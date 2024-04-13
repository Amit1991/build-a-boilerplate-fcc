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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer NOT NULL,
    u_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    u_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_u_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_u_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_u_id_seq OWNER TO freecodecamp;

--
-- Name: users_u_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_u_id_seq OWNED BY public.users.u_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users u_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN u_id SET DEFAULT nextval('public.users_u_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (198, 1, 62);
INSERT INTO public.games VALUES (199, 1, 62);
INSERT INTO public.games VALUES (200, 1, 63);
INSERT INTO public.games VALUES (201, 1, 63);
INSERT INTO public.games VALUES (202, 1, 62);
INSERT INTO public.games VALUES (203, 1, 62);
INSERT INTO public.games VALUES (204, 1, 62);
INSERT INTO public.games VALUES (205, 1, 64);
INSERT INTO public.games VALUES (206, 1, 64);
INSERT INTO public.games VALUES (207, 1, 65);
INSERT INTO public.games VALUES (208, 1, 65);
INSERT INTO public.games VALUES (209, 1, 64);
INSERT INTO public.games VALUES (210, 1, 64);
INSERT INTO public.games VALUES (211, 1, 64);
INSERT INTO public.games VALUES (212, 1, 66);
INSERT INTO public.games VALUES (213, 1, 67);
INSERT INTO public.games VALUES (214, 1, 67);
INSERT INTO public.games VALUES (215, 1, 68);
INSERT INTO public.games VALUES (216, 1, 68);
INSERT INTO public.games VALUES (217, 1, 67);
INSERT INTO public.games VALUES (218, 1, 67);
INSERT INTO public.games VALUES (219, 1, 67);
INSERT INTO public.games VALUES (220, 1, 66);
INSERT INTO public.games VALUES (221, 249, 69);
INSERT INTO public.games VALUES (222, 737, 69);
INSERT INTO public.games VALUES (223, 923, 70);
INSERT INTO public.games VALUES (224, 613, 70);
INSERT INTO public.games VALUES (225, 822, 69);
INSERT INTO public.games VALUES (226, 567, 69);
INSERT INTO public.games VALUES (227, 427, 69);
INSERT INTO public.games VALUES (228, 790, 71);
INSERT INTO public.games VALUES (229, 619, 71);
INSERT INTO public.games VALUES (230, 143, 72);
INSERT INTO public.games VALUES (231, 431, 72);
INSERT INTO public.games VALUES (232, 658, 71);
INSERT INTO public.games VALUES (233, 693, 71);
INSERT INTO public.games VALUES (234, 419, 71);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (62, 'user_1713030898140');
INSERT INTO public.users VALUES (63, 'user_1713030898139');
INSERT INTO public.users VALUES (64, 'user_1713030939261');
INSERT INTO public.users VALUES (65, 'user_1713030939260');
INSERT INTO public.users VALUES (66, 'amit');
INSERT INTO public.users VALUES (67, 'user_1713031003983');
INSERT INTO public.users VALUES (68, 'user_1713031003982');
INSERT INTO public.users VALUES (69, 'user_1713031078056');
INSERT INTO public.users VALUES (70, 'user_1713031078055');
INSERT INTO public.users VALUES (71, 'user_1713031102886');
INSERT INTO public.users VALUES (72, 'user_1713031102885');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 234, true);


--
-- Name: users_u_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_u_id_seq', 72, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (u_id);


--
-- Name: games games_u_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_u_id_fkey FOREIGN KEY (u_id) REFERENCES public.users(u_id);


--
-- PostgreSQL database dump complete
--

