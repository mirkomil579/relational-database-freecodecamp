--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    size integer NOT NULL,
    distance_from_earth numeric(10,2),
    description text,
    is_active boolean,
    discovered boolean
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    radius integer NOT NULL,
    distance_from_planet numeric(10,2),
    composition text,
    is_ice_moon boolean
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    size integer NOT NULL,
    distance_from_earth numeric(10,2),
    type text,
    is_visible boolean
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    diameter integer NOT NULL,
    orbital_period numeric(10,2),
    atmosphere text,
    has_rings boolean
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    brightness integer NOT NULL,
    temperature numeric(10,2),
    spectral_type text,
    is_visible boolean
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
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 0.00, 'The galaxy that contains our Solar System.', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 2500000.00, 'The nearest spiral galaxy to the Milky Way.', true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 3000000.00, 'A member of the Local Group of galaxies.', true, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 90000, 2300000.00, 'A classic spiral galaxy with prominent arms.', true, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 80000, 2800000.00, 'Known for its bright core and dark dust lane.', true, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 70000, 2500000.00, 'A large spiral galaxy with a prominent central bulge.', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, 384400.00, 'Rocky', false);
INSERT INTO public.moon VALUES (2, 'Phobos', 7, 11, 9377.00, 'Rocky', true);
INSERT INTO public.moon VALUES (3, 'Deimos', 7, 6, 23460.00, 'Rocky', true);
INSERT INTO public.moon VALUES (4, 'Io', 8, 1821, 421800.00, 'Sulfuric', false);
INSERT INTO public.moon VALUES (5, 'Europa', 8, 1560, 670900.00, 'Icy', true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 8, 2634, 1070400.00, 'Icy', true);
INSERT INTO public.moon VALUES (7, 'Callisto', 8, 2410, 1882700.00, 'Icy', true);
INSERT INTO public.moon VALUES (8, 'Titan', 9, 2575, 1221870.00, 'Icy', true);
INSERT INTO public.moon VALUES (9, 'Rhea', 9, 763, 527040.00, 'Icy', true);
INSERT INTO public.moon VALUES (10, 'Iapetus', 9, 734, 3561300.00, 'Rocky-Icy', true);
INSERT INTO public.moon VALUES (11, 'Enceladus', 9, 252, 238040.00, 'Icy', true);
INSERT INTO public.moon VALUES (12, 'Mimas', 9, 198, 185539.00, 'Icy', true);
INSERT INTO public.moon VALUES (13, 'Miranda', 10, 236, 129390.00, 'Icy', true);
INSERT INTO public.moon VALUES (14, 'Ariel', 10, 579, 191020.00, 'Icy', true);
INSERT INTO public.moon VALUES (15, 'Umbriel', 10, 585, 266300.00, 'Icy', true);
INSERT INTO public.moon VALUES (16, 'Titania', 10, 788, 435910.00, 'Icy', true);
INSERT INTO public.moon VALUES (17, 'Oberon', 10, 761, 583520.00, 'Icy', true);
INSERT INTO public.moon VALUES (18, 'Triton', 11, 1353, 354800.00, 'Icy', true);
INSERT INTO public.moon VALUES (19, 'Nereid', 11, 170, 1155000.00, 'Icy', true);
INSERT INTO public.moon VALUES (20, 'Proteus', 11, 420, 117600.00, 'Icy', true);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion Nebula', 1, 24, 1344.00, 'Emission', true);
INSERT INTO public.nebula VALUES (2, 'Crab Nebula', 1, 11, 6300.00, 'Pulsar', true);
INSERT INTO public.nebula VALUES (3, 'Helix Nebula', 1, 20, 700.00, 'Planetary', true);
INSERT INTO public.nebula VALUES (4, 'Eagle Nebula', 1, 70, 7000.00, 'Emission', true);
INSERT INTO public.nebula VALUES (5, 'Lagoon Nebula', 1, 55, 4000.00, 'Emission', true);
INSERT INTO public.nebula VALUES (6, 'Rosette Nebula', 1, 50, 4600.00, 'Emission', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12742, 365.25, 'Nitrogen-Oxygen', false);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 6779, 687.00, 'Carbon Dioxide', false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 139820, 4332.00, 'Hydrogen-Helium', true);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 116460, 10759.00, 'Hydrogen-Helium', true);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 50724, 30687.00, 'Hydrogen-Helium', true);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 49244, 60190.00, 'Hydrogen-Helium', false);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, 4879, 88.00, 'Trace Atmosphere', false);
INSERT INTO public.planet VALUES (8, 'Venus', 1, 12104, 224.70, 'Carbon Dioxide', false);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 2376, 90560.00, 'Nitrogen-Methane', true);
INSERT INTO public.planet VALUES (10, 'Ceres', 1, 939, 1680.00, 'No Atmosphere', false);
INSERT INTO public.planet VALUES (11, 'Haumea', 1, 1632, 10300.00, 'No Atmosphere', true);
INSERT INTO public.planet VALUES (12, 'Makemake', 1, 1430, 11200.00, 'No Atmosphere', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 100000, 5778.00, 'G-type', true);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 50000, 9940.00, 'A-type', true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 3, 30000, 5790.00, 'G-type', true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 4, 70000, 3500.00, 'M-type', true);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 5, 15000, 3050.00, 'M-type', true);
INSERT INTO public.star VALUES (6, 'Rigel', 6, 40000, 12000.00, 'B-type', true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

