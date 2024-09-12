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
-- Name: aliens; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.aliens (
    alien_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.aliens OWNER TO freecodecamp;

--
-- Name: aliens_alien_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.aliens_alien_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aliens_alien_id_seq OWNER TO freecodecamp;

--
-- Name: aliens_alien_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.aliens_alien_id_seq OWNED BY public.aliens.alien_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_ly integer,
    number_of_stars integer,
    black_hole_size numeric(24,4),
    small_description text,
    explored boolean,
    hostile boolean
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
    name character varying(30) NOT NULL,
    size_in_km integer,
    number_of_siblings integer,
    distance_from_planet_km numeric(24,4),
    small_description text,
    is_vital boolean,
    sustains_life boolean,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    size_in_km integer,
    number_of_moons integer,
    mass_in_kg numeric(24,4),
    small_description text,
    is_habitable boolean,
    is_hostile boolean,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    size_in_km integer,
    number_of_planets integer,
    mass_in_kg numeric(24,4),
    small_description text,
    is_alive boolean,
    is_neutron boolean,
    galaxy_id integer NOT NULL
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
-- Name: aliens alien_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.aliens ALTER COLUMN alien_id SET DEFAULT nextval('public.aliens_alien_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: aliens; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'A55XC-KLM-66', 110000, 34000000, 456789456.5567, 'extremely hostile and advanced civilizations', false, true);
INSERT INTO public.galaxy VALUES (2, 'A55TC-KOM-36', 310000, 54000000, 459789456.5567, 'Peaceful empty galaxy', true, false);
INSERT INTO public.galaxy VALUES (3, 'A35XC-XLM-22', 510000, 3000000, 6789456.5567, 'Neutral primal civilization', false, false);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 403321, 43309691, 70893.0000, 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.', true, true);
INSERT INTO public.galaxy VALUES (5, 'Antennae Galaxies', 89763, 52343584, 207075.0000, 'Appearance is similar to an insects antennae.', false, true);
INSERT INTO public.galaxy VALUES (6, 'Backward Galaxy', 338692, 61746450, 158454.0000, 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.', true, false);
INSERT INTO public.galaxy VALUES (7, 'Bear Paw Galaxy', 82601, 40279171, 202984.0000, 'It resembles the appearance of a bears claw.', false, false);
INSERT INTO public.galaxy VALUES (8, 'Black Eye Galaxy', 307639, 85342935, 151930.0000, 'It has a spectacular dark band of absorbing dust in front of the galaxys bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.', false, false);
INSERT INTO public.galaxy VALUES (9, 'Bodes Galaxy', 407950, 80834994, 137380.0000, 'Named for Johann Elert Bode who discovered this galaxy in 1774.', true, false);
INSERT INTO public.galaxy VALUES (10, 'Butterfly Galaxies', 168448, 29649627, 208785.0000, 'Looks are similar to a butterfly.', true, false);
INSERT INTO public.galaxy VALUES (11, 'Cartwheel Galaxy', 213571, 40324960, 119061.0000, 'Its visual appearance is similar to that of a spoked cartwheel.', false, true);
INSERT INTO public.galaxy VALUES (12, 'Cigar Galaxy', 324571, 53572320, 65397.0000, 'Appears similar in shape to a cigar.', true, false);
INSERT INTO public.galaxy VALUES (13, 'Circinus Galaxy', 390216, 71246798, 171744.0000, 'Named after the constellation it is located in (Circinus).', false, false);
INSERT INTO public.galaxy VALUES (14, 'Coma Pinwheel Galaxy', 366131, 70620785, 223387.0000, 'Named after its resemblance to the Pinwheel Galaxy and its location in the Coma Berenices constellation.', true, true);
INSERT INTO public.galaxy VALUES (15, 'Comet Galaxy', 221142, 93325862, 159949.0000, 'This galaxy is named after its unusual appearance, looking like a comet.', true, false);
INSERT INTO public.galaxy VALUES (16, 'Condor Galaxy', 403209, 46110981, 65050.0000, 'Named after a condor, a type of vulture that is one of the largest flying birds.', false, false);
INSERT INTO public.galaxy VALUES (17, 'Cosmos Redshift 7', 103202, 92656936, 88083.0000, 'The name of this galaxy is based on a Redshift (z) measurement of nearly 7 (actually, z = 6.604).[5]', true, false);
INSERT INTO public.galaxy VALUES (18, 'Eye of God', 214192, 93182365, 108275.0000, 'Name after its structural appearance', false, false);
INSERT INTO public.galaxy VALUES (19, 'Eye of Sauron', 393902, 91044291, 193570.0000, 'Due to its resemblance to the Eye of Sauron from The Lord of the Rings.', false, false);
INSERT INTO public.galaxy VALUES (20, 'Fireworks Galaxy', 351228, 86892457, 202785.0000, 'Due to its bright and spotty appearance', true, false);
INSERT INTO public.galaxy VALUES (21, 'Grasshopper', 311172, 27707573, 93023.0000, 'Named after its appearance to a grasshopper', true, true);
INSERT INTO public.galaxy VALUES (22, 'Hockey Stick Galaxies', 55753, 57223924, 64501.0000, 'Its elongated and curved appearance resembles a hockey stick.', true, false);
INSERT INTO public.galaxy VALUES (23, 'Hoags Object', 82972, 73104882, 88203.0000, 'This is named after Art Hoag, who discovered this ring galaxy.', true, true);
INSERT INTO public.galaxy VALUES (24, 'Large Magellanic Cloud', 269393, 96073638, 241536.0000, 'Named after Ferdinand Magellan', true, true);
INSERT INTO public.galaxy VALUES (25, 'Lindsay-Shapley Ring', 175057, 69870940, 219129.0000, 'Named after its discoverer, Eric Lindsay, his professor Harlow Shapley, and its nature as a ring galaxy.', false, true);
INSERT INTO public.galaxy VALUES (26, 'Little Sombrero Galaxy', 262443, 70041059, 116940.0000, 'Named after its similarity to the Sombrero Galaxy.', false, true);
INSERT INTO public.galaxy VALUES (27, 'Malin 1', 383573, 31112571, 174897.0000, 'Discovered and named by David Malin.', true, false);
INSERT INTO public.galaxy VALUES (28, 'Medusa Merger', 85873, 87405132, 233172.0000, 'Ejected dust from the merging galaxies is said to look like the snakes that the Gorgon Medusa from Greek mythology had on her head.', true, true);
INSERT INTO public.galaxy VALUES (29, 'Sculptor Dwarf Galaxy', 86841, 90557496, 128099.0000, 'Similar to the Sculpture Galaxies', true, true);
INSERT INTO public.galaxy VALUES (30, 'Mice Galaxies', 233730, 36680100, 190276.0000, 'Appearance is similar to a mouse.', true, false);
INSERT INTO public.galaxy VALUES (31, 'Small Magellanic Cloud', 111189, 69265060, 84248.0000, 'Named after Ferdinand Magellan', false, true);
INSERT INTO public.galaxy VALUES (32, 'Mayalls Object', 362557, 79614364, 233424.0000, 'This is named after Nicholas Mayall, of the Lick Observatory, who discovered it.[7][8][9]', false, false);
INSERT INTO public.galaxy VALUES (33, 'Milky Way', 374093, 78264950, 154000.0000, 'The appearance from Earth of the galaxy—a band of light', false, true);
INSERT INTO public.galaxy VALUES (34, 'Needle Galaxy', 232940, 43185838, 98802.0000, 'Named due to its slender appearance.', true, false);
INSERT INTO public.galaxy VALUES (35, 'Wolf-Lundmark-Melotte', 198932, 79945631, 109941.0000, 'Named for the three astronomers instrumental in its discovery and identification.', false, true);
INSERT INTO public.galaxy VALUES (36, 'Paramecium Galaxy', 253426, 58623228, 162147.0000, 'Named after its appearance to the organism Paramecium', true, false);
INSERT INTO public.galaxy VALUES (37, 'Peekaboo Galaxy', 277632, 94984537, 124374.0000, 'Galaxy (aka HIPASS J1131-31) was hidden behind a relatively fast-moving foreground star (TYC 7215-199-1) and became observable when the star moved aside.', true, true);
INSERT INTO public.galaxy VALUES (38, 'Pinwheel Galaxy', 182845, 33210682, 91529.0000, 'Similar in appearance to a pinwheel (toy).', true, true);
INSERT INTO public.galaxy VALUES (39, 'Sculptor Galaxy', 441905, 60393157, 148173.0000, 'Named after its location in the Sculptor Constellation. Also called the Silver Dollar or Silver Coin Galaxy, because of its light and circular appearance.', false, true);
INSERT INTO public.galaxy VALUES (40, 'Sombrero Galaxy', 227374, 88767377, 241535.0000, 'Similar in appearance to a sombrero.', true, true);
INSERT INTO public.galaxy VALUES (41, 'Southern Pinwheel Galaxy', 330579, 79157634, 127684.0000, 'Named after its resemblance to the Pinwheel Galaxy and its location in the southern celestial hemisphere.', true, false);
INSERT INTO public.galaxy VALUES (42, 'Spider Galaxy', 209680, 96061123, 179213.0000, 'Name after its appearance of a spider', false, false);
INSERT INTO public.galaxy VALUES (43, 'Sunflower Galaxy', 235158, 93725010, 138706.0000, 'Similar in appearance to a sunflower.', true, true);
INSERT INTO public.galaxy VALUES (44, 'Tadpole Galaxy', 112858, 35200186, 181682.0000, 'The name comes from the resemblance of the galaxy to a tadpole.', false, true);
INSERT INTO public.galaxy VALUES (45, 'Triangulum Galaxy', 157459, 98018251, 208578.0000, 'Named after its location within the Triangulum constellation.', false, true);
INSERT INTO public.galaxy VALUES (46, 'Whirlpool Galaxy', 84587, 24200488, 216069.0000, 'From the whirlpool appearance this gravitationally disturbed galaxy exhibits.', true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mini puller', 5267, 3, 4500.0000, 'strong gravitational pull', true, false, 1);
INSERT INTO public.moon VALUES (2, 'Large pusher', 98900, 1, 450000.0000, 'Pushes brothers', false, true, 2);
INSERT INTO public.moon VALUES (3, 'Plaetary influencer', 140967, 5, 450200.0000, 'self-explanatory', true, true, 3);
INSERT INTO public.moon VALUES (4, 'Moon', 155573, 52, 206889.0000, 'Synchronous rotation (Binary)', false, true, 40);
INSERT INTO public.moon VALUES (5, 'Phobos', 230963, 45, 243301.0000, 'Synchronous rotation', true, false, 43);
INSERT INTO public.moon VALUES (6, 'Deimos', 332123, 64, 59837.0000, 'Synchronous rotation', true, false, 8);
INSERT INTO public.moon VALUES (7, 'Io', 405564, 28, 60295.0000, 'Main-group moon (Galilean)', false, true, 10);
INSERT INTO public.moon VALUES (8, 'Europa', 235121, 20, 83126.0000, 'Main-group moon (Galilean)', true, false, 5);
INSERT INTO public.moon VALUES (9, 'Ganymede', 283414, 12, 205067.0000, 'Main-group moon (Galilean)', true, false, 13);
INSERT INTO public.moon VALUES (10, 'Callisto', 431985, 67, 167374.0000, 'Main-group moon (Galilean)', false, false, 23);
INSERT INTO public.moon VALUES (11, 'Amalthea', 300085, 22, 202924.0000, 'Inner moon (Amalthea)', false, true, 17);
INSERT INTO public.moon VALUES (12, 'Himalia', 418562, 57, 78045.0000, 'Prograde irregular (Himalia)', true, true, 33);
INSERT INTO public.moon VALUES (13, 'Elara', 196181, 61, 201529.0000, 'Prograde irregular (Himalia)', false, true, 22);
INSERT INTO public.moon VALUES (14, 'Pasiphae', 128785, 46, 118128.0000, 'Retrograde irregular (Pasiphae)', true, true, 24);
INSERT INTO public.moon VALUES (15, 'Sinope', 73621, 48, 159175.0000, 'Retrograde irregular (Pasiphae)', true, false, 39);
INSERT INTO public.moon VALUES (16, 'Lysithea', 167367, 29, 186619.0000, 'Prograde irregular (Himalia)', true, false, 5);
INSERT INTO public.moon VALUES (17, 'Carme', 50965, 59, 204929.0000, 'Retrograde irregular (Carme)', false, true, 6);
INSERT INTO public.moon VALUES (18, 'Ananke', 340263, 46, 205398.0000, 'Retrograde irregular (Ananke)', true, false, 8);
INSERT INTO public.moon VALUES (19, 'Leda', 430195, 45, 187560.0000, 'Prograde irregular (Himalia)', false, false, 38);
INSERT INTO public.moon VALUES (20, 'Thebe', 142434, 61, 74720.0000, 'Inner moon (Amalthea)', false, false, 37);
INSERT INTO public.moon VALUES (21, 'Adrastea', 440926, 32, 85102.0000, 'Inner moon (Amalthea)', false, false, 41);
INSERT INTO public.moon VALUES (22, 'Metis', 384668, 7, 128494.0000, 'Inner moon (Amalthea)', false, true, 12);
INSERT INTO public.moon VALUES (23, 'Callirrhoe', 219012, 14, 87597.0000, 'Retrograde irregular (Pasiphae)', false, false, 33);
INSERT INTO public.moon VALUES (24, 'Themisto', 100995, 32, 234703.0000, 'Prograde irregular (Themisto)', true, false, 2);
INSERT INTO public.moon VALUES (25, 'Megaclite', 105035, 61, 127050.0000, 'Retrograde irregular (Pasiphae)', false, false, 26);
INSERT INTO public.moon VALUES (26, 'Taygete', 75533, 27, 93865.0000, 'Retrograde irregular (Carme)', false, false, 24);
INSERT INTO public.moon VALUES (27, 'Chaldene', 414160, 33, 95867.0000, 'Retrograde irregular (Carme)', true, true, 28);
INSERT INTO public.moon VALUES (28, 'Harpalyke', 162294, 10, 109160.0000, 'Retrograde irregular (Ananke)', true, false, 15);
INSERT INTO public.moon VALUES (29, 'Kalyke', 332402, 41, 68126.0000, 'Retrograde irregular (Carme)', false, false, 33);
INSERT INTO public.moon VALUES (30, 'Iocaste', 443818, 13, 210934.0000, 'Retrograde irregular (Ananke)', false, false, 10);
INSERT INTO public.moon VALUES (31, 'Erinome', 135323, 56, 171811.0000, 'Retrograde irregular (Carme)', true, false, 23);
INSERT INTO public.moon VALUES (32, 'Isonoe', 184231, 29, 235627.0000, 'Retrograde irregular (Carme)', true, false, 30);
INSERT INTO public.moon VALUES (33, 'Praxidike', 103704, 10, 209776.0000, 'Retrograde irregular (Ananke)', false, true, 25);
INSERT INTO public.moon VALUES (34, 'Autonoe', 279592, 62, 189781.0000, 'Retrograde irregular (Pasiphae)', true, true, 4);
INSERT INTO public.moon VALUES (35, 'Thyone', 326756, 31, 82583.0000, 'Retrograde irregular (Ananke)', false, true, 18);
INSERT INTO public.moon VALUES (36, 'Hermippe', 93158, 54, 108709.0000, 'Retrograde irregular (Ananke)', true, true, 20);
INSERT INTO public.moon VALUES (37, 'Aitne', 436964, 45, 212515.0000, 'Retrograde irregular (Carme)', false, false, 6);
INSERT INTO public.moon VALUES (38, 'Eurydome', 185484, 71, 226547.0000, 'Retrograde irregular (Pasiphae)', true, true, 1);
INSERT INTO public.moon VALUES (39, 'Euanthe', 411639, 18, 210024.0000, 'Retrograde irregular (Ananke)', false, false, 10);
INSERT INTO public.moon VALUES (40, 'Euporie', 109005, 75, 79921.0000, 'Retrograde irregular (Ananke)', false, false, 18);
INSERT INTO public.moon VALUES (41, 'Orthosie', 104810, 30, 201601.0000, 'Retrograde irregular (Ananke)', true, false, 18);
INSERT INTO public.moon VALUES (42, 'Sponde', 334043, 17, 111187.0000, 'Retrograde irregular (Pasiphae)', false, true, 13);
INSERT INTO public.moon VALUES (43, 'Kale', 139059, 73, 126568.0000, 'Retrograde irregular (Carme)', true, true, 17);
INSERT INTO public.moon VALUES (44, 'Pasithee', 307932, 73, 64202.0000, 'Retrograde irregular (Carme)', false, false, 39);
INSERT INTO public.moon VALUES (45, 'Hegemone', 190461, 20, 84575.0000, 'Retrograde irregular (Pasiphae)', true, true, 11);
INSERT INTO public.moon VALUES (46, 'Mneme', 221223, 26, 75955.0000, 'Retrograde irregular (Ananke)', true, true, 38);
INSERT INTO public.moon VALUES (47, 'Aoede', 140775, 67, 225666.0000, 'Retrograde irregular (Pasiphae)', false, false, 16);
INSERT INTO public.moon VALUES (48, 'Thelxinoe', 264698, 40, 155895.0000, 'Retrograde irregular (Ananke)', true, true, 17);
INSERT INTO public.moon VALUES (49, 'Arche', 249570, 74, 245633.0000, 'Retrograde irregular (Carme)', false, false, 36);
INSERT INTO public.moon VALUES (50, 'Kallichore', 408184, 63, 126745.0000, 'Retrograde irregular (Carme)', true, false, 24);
INSERT INTO public.moon VALUES (51, 'Helike', 414957, 73, 236011.0000, 'Retrograde irregular (Ananke)', false, true, 13);
INSERT INTO public.moon VALUES (52, 'Carpo', 416928, 57, 115674.0000, 'Prograde irregular (Carpo)', false, false, 20);
INSERT INTO public.moon VALUES (53, 'Eukelade', 145154, 13, 200486.0000, 'Retrograde irregular (Carme)', true, true, 39);
INSERT INTO public.moon VALUES (54, 'Cyllene', 343566, 40, 108173.0000, 'Retrograde irregular (Pasiphae)', true, false, 19);
INSERT INTO public.moon VALUES (55, 'Kore', 54088, 38, 197668.0000, 'Retrograde irregular (Pasiphae)', false, false, 6);
INSERT INTO public.moon VALUES (56, 'Herse', 93457, 70, 198686.0000, 'Retrograde irregular (Carme)', true, true, 41);
INSERT INTO public.moon VALUES (57, 'S/2010 J 1', 122777, 11, 229200.0000, 'Retrograde irregular (Carme)', true, true, 39);
INSERT INTO public.moon VALUES (58, 'S/2010 J 2', 58462, 52, 72021.0000, 'Retrograde irregular (Ananke)', false, false, 26);
INSERT INTO public.moon VALUES (59, 'Dia', 434236, 65, 166895.0000, 'Prograde irregular (Himalia)', false, true, 9);
INSERT INTO public.moon VALUES (60, 'S/2016 J 1', 448966, 37, 187894.0000, 'Retrograde irregular (Ananke)', false, false, 9);
INSERT INTO public.moon VALUES (61, 'S/2003 J 18', 193184, 13, 133154.0000, 'Retrograde irregular (Ananke)', false, false, 30);
INSERT INTO public.moon VALUES (62, 'S/2011 J 2', 426251, 24, 177431.0000, 'Retrograde irregular (Pasiphae)', false, false, 44);
INSERT INTO public.moon VALUES (63, 'Eirene', 182835, 29, 230243.0000, 'Retrograde irregular (Carme)', false, false, 17);
INSERT INTO public.moon VALUES (64, 'Philophrosyne', 247062, 6, 175400.0000, 'Retrograde irregular (Pasiphae)', true, true, 20);
INSERT INTO public.moon VALUES (65, 'S/2017 J 1', 389558, 6, 231097.0000, 'Retrograde irregular (Pasiphae)', true, false, 23);
INSERT INTO public.moon VALUES (66, 'Eupheme', 379485, 9, 179966.0000, 'Retrograde irregular (Ananke)', false, false, 18);
INSERT INTO public.moon VALUES (67, 'S/2003 J 19', 342229, 50, 117230.0000, 'Retrograde irregular (Carme)', false, false, 30);
INSERT INTO public.moon VALUES (68, 'Valetudo', 134021, 15, 248226.0000, 'Prograde irregular (Valetudo)', true, false, 16);
INSERT INTO public.moon VALUES (69, 'S/2017 J 2', 366612, 11, 202969.0000, 'Retrograde irregular (Carme)', false, false, 34);
INSERT INTO public.moon VALUES (70, 'S/2017 J 3', 376022, 11, 175436.0000, 'Retrograde irregular (Ananke)', true, true, 20);
INSERT INTO public.moon VALUES (71, 'Pandia', 246100, 14, 89684.0000, 'Prograde irregular (Himalia)', true, false, 11);
INSERT INTO public.moon VALUES (72, 'S/2017 J 5', 345363, 5, 183823.0000, 'Retrograde irregular (Carme)', true, true, 4);
INSERT INTO public.moon VALUES (73, 'S/2017 J 6', 108682, 12, 213954.0000, 'Retrograde irregular (Pasiphae)', true, true, 39);
INSERT INTO public.moon VALUES (74, 'S/2017 J 7', 306593, 68, 218094.0000, 'Retrograde irregular (Ananke)', true, false, 5);
INSERT INTO public.moon VALUES (75, 'S/2017 J 8', 326022, 43, 154541.0000, 'Retrograde irregular (Carme)', true, true, 30);
INSERT INTO public.moon VALUES (76, 'S/2017 J 9', 87445, 17, 114312.0000, 'Retrograde irregular (Ananke)', false, true, 36);
INSERT INTO public.moon VALUES (77, 'Ersa', 414019, 13, 219929.0000, 'Prograde irregular (Himalia)', false, false, 21);
INSERT INTO public.moon VALUES (78, 'S/2011 J 1', 135979, 40, 186599.0000, 'Retrograde irregular (Carme)', false, true, 24);
INSERT INTO public.moon VALUES (79, 'S/2003 J 2', 165287, 7, 155680.0000, 'Retrograde irregular (Ananke)', true, true, 30);
INSERT INTO public.moon VALUES (80, 'S/2003 J 4', 136280, 45, 242201.0000, 'Retrograde irregular (Pasiphae)', false, false, 17);
INSERT INTO public.moon VALUES (81, 'S/2003 J 9', 322455, 42, 229263.0000, 'Retrograde irregular (Carme)', true, false, 36);
INSERT INTO public.moon VALUES (82, 'S/2003 J 10', 70002, 41, 149867.0000, 'Retrograde irregular (Carme?)', true, true, 29);
INSERT INTO public.moon VALUES (83, 'S/2003 J 12', 217225, 14, 229121.0000, 'Retrograde irregular (Ananke)', false, true, 34);
INSERT INTO public.moon VALUES (84, 'S/2003 J 16', 295740, 75, 79085.0000, 'Retrograde irregular (Ananke)', false, true, 27);
INSERT INTO public.moon VALUES (85, 'S/2003 J 23', 353663, 39, 249669.0000, 'Retrograde irregular (Pasiphae)', true, true, 3);
INSERT INTO public.moon VALUES (86, 'S/2003 J 24', 340505, 66, 168695.0000, 'Retrograde irregular (Carme)', true, false, 10);
INSERT INTO public.moon VALUES (87, 'S/2011 J 3', 105172, 10, 179625.0000, 'Prograde irregular (Himalia)', false, false, 31);
INSERT INTO public.moon VALUES (88, 'S/2016 J 3', 257359, 57, 67597.0000, 'Retrograde irregular (Carme)', false, false, 37);
INSERT INTO public.moon VALUES (89, 'S/2016 J 4', 123148, 61, 62522.0000, 'Retrograde irregular (Pasiphae)', true, false, 39);
INSERT INTO public.moon VALUES (90, 'S/2018 J 2', 400506, 58, 77773.0000, 'Prograde irregular (Himalia)', false, false, 15);
INSERT INTO public.moon VALUES (91, 'S/2018 J 3', 121306, 27, 90545.0000, 'Retrograde irregular (Carme)', true, false, 5);
INSERT INTO public.moon VALUES (92, 'S/2018 J 4', 103901, 39, 110592.0000, 'Prograde irregular (Carpo)', false, false, 39);
INSERT INTO public.moon VALUES (93, 'S/2021 J 1', 203209, 65, 185867.0000, 'Retrograde irregular (Ananke)', false, true, 9);
INSERT INTO public.moon VALUES (94, 'S/2021 J 2', 221739, 17, 231485.0000, 'Retrograde irregular (Ananke)', false, false, 1);
INSERT INTO public.moon VALUES (95, 'S/2021 J 3', 241515, 24, 237464.0000, 'Retrograde irregular (Ananke)', false, false, 22);
INSERT INTO public.moon VALUES (96, 'S/2021 J 4', 398898, 14, 110329.0000, 'Retrograde irregular (Carme)', false, false, 28);
INSERT INTO public.moon VALUES (97, 'S/2021 J 5', 196014, 12, 171028.0000, 'Retrograde irregular (Carme)', false, false, 1);
INSERT INTO public.moon VALUES (98, 'S/2021 J 6', 86730, 61, 150602.0000, 'Retrograde irregular (Carme)', true, true, 9);
INSERT INTO public.moon VALUES (99, 'S/2022 J 1', 273490, 63, 179953.0000, 'Retrograde irregular (Carme)', true, true, 32);
INSERT INTO public.moon VALUES (100, 'S/2022 J 2', 304324, 40, 64159.0000, 'Retrograde irregular (Carme)', true, true, 32);
INSERT INTO public.moon VALUES (101, 'S/2022 J 3', 286012, 28, 176537.0000, 'Retrograde irregular (Ananke)', true, true, 14);
INSERT INTO public.moon VALUES (102, 'Mimas', 167629, 24, 245776.0000, 'Main-group moon', true, false, 27);
INSERT INTO public.moon VALUES (103, 'Enceladus', 55239, 61, 74525.0000, 'Main-group moon', true, false, 10);
INSERT INTO public.moon VALUES (104, 'Tethys', 268628, 8, 236968.0000, 'Main-group moon (Sidera Lodoicea)', true, false, 5);
INSERT INTO public.moon VALUES (105, 'Dione', 438848, 35, 111800.0000, 'Main-group moon (Sidera Lodoicea)', true, false, 42);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Safe Heaven', 52967, 2, 450000.0000, 'Habitable small green', true, false, 1);
INSERT INTO public.planet VALUES (2, 'RUN', 9897, 25, 45000.0000, 'Gnomish hell', false, true, 2);
INSERT INTO public.planet VALUES (3, 'Planetary Switzerland', 14967, 5, 4500000.0000, 'self-explanatory', true, false, 3);
INSERT INTO public.planet VALUES (4, 'WD 1145+017 b', 223590, 57, 201793.0000, 'Disintegrating planetesimal, likely one of several orbiting its star. Likely about one-tenth the mass of Ceres and ~200 km in radius.[5]', true, true, 100);
INSERT INTO public.planet VALUES (5, 'Ceres', 286525, 34, 107705.0000, 'Shown for comparison', false, true, 88);
INSERT INTO public.planet VALUES (6, 'Pluto', 379969, 58, 104698.0000, 'Shown for comparison', false, true, 103);
INSERT INTO public.planet VALUES (7, 'Moon', 210779, 31, 100019.0000, 'Shown for comparison', false, true, 100);
INSERT INTO public.planet VALUES (8, 'Kepler-37b', 81378, 27, 62049.0000, 'Smallest known exoplanet.[6][7]', false, true, 83);
INSERT INTO public.planet VALUES (9, 'PSR B1257+12 b (Draugr)', 182278, 28, 190702.0000, 'Least massive known exoplanet, at 0.02 Earth masses. Radius estimated from mass-radius relationship.[8]', true, false, 95);
INSERT INTO public.planet VALUES (10, 'Kepler-1520b', 50656, 52, 118574.0000, 'Disintegrating planets with poorly known radii, all thought to be smaller than Mercury.[9][10]', true, false, 83);
INSERT INTO public.planet VALUES (11, 'KOI-2700b', 207317, 55, 240919.0000, '', true, true, 86);
INSERT INTO public.planet VALUES (12, 'K2-22b', 273776, 52, 164673.0000, '', true, false, 100);
INSERT INTO public.planet VALUES (13, 'Mercury', 359873, 45, 220059.0000, 'Shown for comparison', false, false, 103);
INSERT INTO public.planet VALUES (14, 'Kepler-444b', 261444, 13, 204078.0000, '[11]', true, true, 99);
INSERT INTO public.planet VALUES (15, 'Ganymede', 422355, 51, 129020.0000, 'Shown for comparison', true, true, 84);
INSERT INTO public.planet VALUES (16, 'Kepler-102b', 344357, 59, 203762.0000, '[7]', false, true, 100);
INSERT INTO public.planet VALUES (17, 'Kepler-444c', 364457, 66, 105525.0000, '[11]', true, false, 86);
INSERT INTO public.planet VALUES (18, 'Kepler-1971b (KOI-4777.01)', 98965, 9, 204085.0000, '[12]', false, true, 100);
INSERT INTO public.planet VALUES (19, 'Kepler-1994b', 156369, 35, 77496.0000, '[13]', false, false, 94);
INSERT INTO public.planet VALUES (20, 'Kepler-1308b', 371327, 33, 118965.0000, '', true, true, 93);
INSERT INTO public.planet VALUES (21, 'Kepler-444d', 377092, 11, 150485.0000, '[11]', false, false, 99);
INSERT INTO public.planet VALUES (22, 'Mars', 224811, 10, 82685.0000, 'Shown for comparison', true, true, 98);
INSERT INTO public.planet VALUES (23, 'Kepler-62c', 330528, 40, 97752.0000, '', true, true, 83);
INSERT INTO public.planet VALUES (24, 'Kepler-444e', 283122, 10, 62037.0000, '[11]', true, true, 84);
INSERT INTO public.planet VALUES (25, 'Gliese 238 b', 321496, 75, 176815.0000, '[14]', true, false, 95);
INSERT INTO public.planet VALUES (26, 'Kepler-102c', 173326, 55, 134703.0000, '[7]', true, false, 94);
INSERT INTO public.planet VALUES (27, 'Kepler-42d', 170744, 51, 229205.0000, '', true, true, 95);
INSERT INTO public.planet VALUES (28, 'Kepler-1583b', 94253, 26, 197098.0000, '', true, false, 89);
INSERT INTO public.planet VALUES (29, 'Kepler-1998b', 162519, 46, 105739.0000, '[15]', true, false, 95);
INSERT INTO public.planet VALUES (30, 'Kepler-1087b', 143858, 72, 242461.0000, '', false, true, 86);
INSERT INTO public.planet VALUES (31, 'K2-89b', 220174, 69, 57812.0000, '', false, false, 80);
INSERT INTO public.planet VALUES (32, 'Kepler-1877b', 334826, 23, 187612.0000, '', false, false, 100);
INSERT INTO public.planet VALUES (33, 'K2-137b', 194774, 12, 56104.0000, '', false, false, 90);
INSERT INTO public.planet VALUES (34, 'Kepler-1371c', 410907, 12, 104647.0000, '', true, true, 99);
INSERT INTO public.planet VALUES (35, 'Kepler-138b', 328592, 54, 91630.0000, '[16]', false, false, 87);
INSERT INTO public.planet VALUES (36, 'Kepler-1130d', 447175, 65, 221808.0000, '', false, true, 92);
INSERT INTO public.planet VALUES (37, 'Kepler-1351b', 219863, 15, 215232.0000, '', true, false, 95);
INSERT INTO public.planet VALUES (38, 'Kepler-1542c', 375601, 69, 70912.0000, '', false, true, 93);
INSERT INTO public.planet VALUES (39, 'Kepler-271d', 167084, 58, 105457.0000, '', false, true, 85);
INSERT INTO public.planet VALUES (40, 'Kepler-431c', 223043, 46, 212033.0000, '', false, false, 101);
INSERT INTO public.planet VALUES (41, 'Kepler-1558b', 210648, 37, 201298.0000, '', true, true, 93);
INSERT INTO public.planet VALUES (42, 'LHS 1678 b', 181948, 59, 119543.0000, '[17]', false, true, 97);
INSERT INTO public.planet VALUES (43, 'K2-116b', 316499, 52, 145361.0000, '', false, true, 88);
INSERT INTO public.planet VALUES (44, 'Kepler-141b', 254767, 60, 92280.0000, '', true, false, 96);
INSERT INTO public.planet VALUES (45, 'K2-297b (EPIC 201497682 b)', 360993, 32, 219909.0000, '', false, true, 95);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'X551A', 548967, 24, 45000000.0000, 'red dwarf', true, false, 1);
INSERT INTO public.star VALUES (2, 'Z551G', 948967, 94, 450000000.0000, 'Blue lord', true, true, 2);
INSERT INTO public.star VALUES (3, 'X556-ZA', 148967, 2, 450000.0000, 'brown dwarf', false, false, 3);
INSERT INTO public.star VALUES (80, 'Lynx', 108791, 46, 230046.0000, 'Absolutno', true, true, 10);
INSERT INTO public.star VALUES (81, 'Eridanus', 56812, 7, 163932.0000, 'Acamar', false, false, 42);
INSERT INTO public.star VALUES (82, 'Cassiopeia', 97247, 36, 213755.0000, 'Achird', false, false, 29);
INSERT INTO public.star VALUES (83, 'Scorpius', 109470, 22, 200086.0000, 'Acrab', false, false, 46);
INSERT INTO public.star VALUES (84, 'Crux', 202358, 66, 84312.0000, 'Acrux', true, true, 35);
INSERT INTO public.star VALUES (85, 'Cancer', 160430, 22, 119116.0000, 'Acubens', true, false, 30);
INSERT INTO public.star VALUES (86, 'Leo', 157636, 63, 122944.0000, 'Adhafera', true, true, 4);
INSERT INTO public.star VALUES (87, 'Canis Major', 110005, 67, 213394.0000, 'Adhara', false, false, 10);
INSERT INTO public.star VALUES (88, 'Andromeda', 140220, 48, 100838.0000, 'Adhil', false, false, 10);
INSERT INTO public.star VALUES (89, 'Taurus', 171691, 22, 191265.0000, 'Ain', true, true, 26);
INSERT INTO public.star VALUES (90, 'Carina', 208977, 62, 180192.0000, 'Aiolos', true, false, 1);
INSERT INTO public.star VALUES (91, 'Lyra', 441055, 65, 110741.0000, 'Aladfar', false, false, 21);
INSERT INTO public.star VALUES (92, 'Serpens', 163460, 19, 215219.0000, 'Alasia', true, false, 44);
INSERT INTO public.star VALUES (93, 'Sagittarius', 387896, 41, 169131.0000, 'Albaldah', false, true, 21);
INSERT INTO public.star VALUES (94, 'Aquarius', 220486, 35, 203736.0000, 'Albali', false, true, 30);
INSERT INTO public.star VALUES (95, 'Cygnus', 263201, 58, 236556.0000, 'Albireo', true, true, 27);
INSERT INTO public.star VALUES (96, 'Corvus', 241413, 65, 230549.0000, 'Alchiba', false, false, 18);
INSERT INTO public.star VALUES (97, 'Ursa Major', 292435, 5, 215679.0000, 'Alcor', true, true, 37);
INSERT INTO public.star VALUES (98, 'Cepheus', 167059, 30, 165828.0000, 'Alderamin', true, true, 12);
INSERT INTO public.star VALUES (99, 'Grus', 394333, 38, 158346.0000, 'Aldhanab', false, false, 23);
INSERT INTO public.star VALUES (100, 'Draco', 428499, 54, 225133.0000, 'Aldhibah', true, true, 22);
INSERT INTO public.star VALUES (101, 'Delphinus', 219417, 27, 227052.0000, 'Aldulfin', true, false, 9);
INSERT INTO public.star VALUES (102, 'Capricornus', 400813, 24, 142500.0000, 'Alfirk', false, true, 33);
INSERT INTO public.star VALUES (103, 'Pegasus', 145035, 19, 180311.0000, 'Algedi', false, true, 24);


--
-- Name: aliens_alien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.aliens_alien_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 46, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 105, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 45, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 103, true);


--
-- Name: aliens aliens_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.aliens
    ADD CONSTRAINT aliens_name_key UNIQUE (name);


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
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

