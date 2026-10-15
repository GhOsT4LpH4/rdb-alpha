#!/bin/bash

PSQL=(psql --username=freecodecamp --dbname=number_guess -X -t --no-align --set=ON_ERROR_STOP=1)

printf '%s\n' 'Enter your username:'
IFS= read -r USERNAME || exit 1

USER_STATS=$("${PSQL[@]}" --set=username="$USERNAME" <<'SQL'
SELECT u.user_id, COUNT(g.game_id), COALESCE(MIN(g.number_of_guesses), 0)
FROM public.users AS u
LEFT JOIN public.games AS g ON g.user_id = u.user_id
WHERE u.username = :'username'
GROUP BY u.user_id;
SQL
) || exit 1

if [[ -z $USER_STATS ]]; then
  USER_ID=$("${PSQL[@]}" -q --set=username="$USERNAME" <<'SQL'
INSERT INTO public.users (username)
VALUES (:'username')
RETURNING user_id;
SQL
  ) || exit 1

  printf 'Welcome, %s! It looks like this is your first time here.\n' "$USERNAME"
else
  IFS='|' read -r USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_STATS"

  printf 'Welcome back, %s! You have played %s games, and your best game took %s guesses.\n' \
    "$USERNAME" "$GAMES_PLAYED" "$BEST_GAME"
fi

RANDOM_VALUE=$RANDOM
while (( RANDOM_VALUE >= 32000 )); do
  RANDOM_VALUE=$RANDOM
done

SECRET_NUMBER=$((RANDOM_VALUE % 1000 + 1))
NUMBER_OF_GUESSES=0

printf '%s\n' 'Guess the secret number between 1 and 1000:'

while IFS= read -r GUESS; do
  ((NUMBER_OF_GUESSES += 1))

  if [[ ! $GUESS =~ ^[+-]?[0-9]+$ ]]; then
    printf '%s\n' 'That is not an integer, guess again:'
    continue
  fi

  # Remove the sign and leading zeros before numeric comparison.
  DIGITS=${GUESS#[+-]}
  DIGITS=${DIGITS#"${DIGITS%%[!0]*}"}
  DIGITS=${DIGITS:-0}

  if [[ $GUESS == -* && $DIGITS != 0 ]]; then
    printf '%s\n' "It's higher than that, guess again:"
  elif (( ${#DIGITS} > 4 )); then
    printf '%s\n' "It's lower than that, guess again:"
  else
    GUESS_VALUE=$((10#$DIGITS))

    if (( GUESS_VALUE > SECRET_NUMBER )); then
      printf '%s\n' "It's lower than that, guess again:"
    elif (( GUESS_VALUE < SECRET_NUMBER )); then
      printf '%s\n' "It's higher than that, guess again:"
    else
      "${PSQL[@]}" -q -c \
        "INSERT INTO public.games (user_id, number_of_guesses)
         VALUES ($USER_ID, $NUMBER_OF_GUESSES);" \
        >/dev/null || exit 1

      printf 'You guessed it in %s tries. The secret number was %s. Nice job!\n' \
        "$NUMBER_OF_GUESSES" "$SECRET_NUMBER"

      exit 0
    fi
  fi
done

exit 1
