--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(12,2),
    has_life boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer,
    discovered_year integer,
    is_spherical boolean,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    diameter_km integer,
    orbital_period_days integer,
    has_life boolean,
    is_spherical boolean,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_rocky boolean NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    temperature_kelvin integer,
    distance_from_earth numeric(12,2),
    is_spherical boolean,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 13600, 0.00, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2.54, false, 'Nearest large galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 10000, 2.73, false, 'Third largest galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 13000, 0.16, false, 'Satellite galaxy of the Milky Way');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 400, 23.00, false, 'Interacting galaxy with a visible companion');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 9000, 29.00, false, 'Known for its bright nucleus and dust lane');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, NULL, true, 'Earth''s only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 1877, false, 'Larger moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1877, false, 'Smaller moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1610, true, 'Most volcanically active body in the solar system');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 1610, true, 'Icy moon with a subsurface ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 1610, true, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 1610, true, 'Heavily cratered moon of Jupiter');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 1655, true, 'Has a thick atmosphere and methane lakes');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, 1789, true, 'Ice geysers erupt from its south pole');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 396, 1789, true, 'Has a giant impact crater');
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 1527, 1672, true, 'Second largest moon of Saturn');
INSERT INTO public.moon VALUES (12, 'Dione', 6, 1123, 1684, true, 'Icy moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 1469, 1671, true, 'Two-toned moon of Saturn');
INSERT INTO public.moon VALUES (14, 'Tethys', 6, 1062, 1684, true, 'Mostly water ice');
INSERT INTO public.moon VALUES (15, 'Titania', 7, 1577, 1787, true, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 1523, 1787, true, 'Outermost major moon of Uranus');
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 472, 1948, true, 'Has extreme surface features');
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 1158, 1851, true, 'Bright, young surface');
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 1169, 1851, true, 'Dark moon of Uranus');
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2707, 1846, true, 'Orbits Neptune backwards');
INSERT INTO public.moon VALUES (21, 'Nereid', 8, 340, 1949, true, 'Has a very eccentric orbit');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4879, 88, false, true, 'Smallest planet and closest to the Sun');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 12104, 225, false, true, 'Hottest planet with a thick atmosphere');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 12742, 365, true, true, 'The only known planet with life');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 6779, 687, false, true, 'The red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 139820, 4333, false, true, 'Largest planet in the solar system');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 116460, 10759, false, true, 'Famous for its ring system');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 50724, 30687, false, true, 'Ice giant that rotates on its side');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 49244, 60190, false, true, 'Farthest planet from the Sun');
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 14000, 11, false, true, 'Exoplanet in the habitable zone of Proxima Centauri');
INSERT INTO public.planet VALUES (10, 'Proxima d', 4, 5000, 5, false, true, 'Small, hot exoplanet candidate');
INSERT INTO public.planet VALUES (11, 'Sirius I', 2, 9000, 400, false, true, 'Fictional rocky world orbiting Sirius');
INSERT INTO public.planet VALUES (12, 'Betelgeuse I', 3, 20000, 1200, false, true, 'Fictional gas world near Betelgeuse');


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', true, 'Small rocky planet with a solid surface');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', false, 'Large planet made mostly of hydrogen and helium');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', false, 'Planet made mostly of water, ammonia, and methane ices');
INSERT INTO public.planet_type VALUES (4, 'Super-Earth', true, 'Rocky planet larger than Earth');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 5772, 0.00, true, 'The star at the center of our solar system');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 242, 9940, 8.60, true, 'Brightest star in the night sky');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 10, 3600, 548.00, true, 'Red supergiant in Orion');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 4850, 3042, 4.24, true, 'Closest known star to the Sun');
INSERT INTO public.star VALUES (5, 'Hubble V1', 2, 50, 6000, 2500000.00, true, 'Cepheid variable star in Andromeda');
INSERT INTO public.star VALUES (6, 'S Doradus', 4, 5, 9000, 160000.00, true, 'Luminous blue variable in the LMC');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

