#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    # insert both teams (skipped automatically if they already exist)
    $PSQL "INSERT INTO teams(name) VALUES('$WINNER'), ('$OPPONENT') ON CONFLICT (name) DO NOTHING" > /dev/null

    # insert the game, looking up team ids inside the same query
    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
           VALUES($YEAR, '$ROUND',
                  (SELECT team_id FROM teams WHERE name='$WINNER'),
                  (SELECT team_id FROM teams WHERE name='$OPPONENT'),
                  $WINNER_GOALS, $OPPONENT_GOALS)" > /dev/null
  fi
done