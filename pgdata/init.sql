--
-- PostgreSQL database cluster dump
--

-- Started on 2022-05-11 23:24:03

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--
ALTER ROLE iniciador_admin WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:4r/ro3oAqr8PPJ2g4mAq/Q==$6kikjanBsIgAbTcajGd6sGauehAnb1yum4R4mmWjryU=:SfneIVJuute5ad+JwTDGqO700VNhTRQkvoeSPnUTArU=';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2022-05-11 23:24:03

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

-- Completed on 2022-05-11 23:24:04

--
-- PostgreSQL database dump complete
--

--
-- Database "iniciador_admin" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2022-05-11 23:24:04

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

--
-- TOC entry 3344 (class 1262 OID 16384)
-- Name: iniciador_admin; Type: DATABASE; Schema: -; Owner: iniciador_admin
--
ALTER DATABASE iniciador_admin OWNER TO iniciador_admin;

\connect iniciador_admin

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

--
-- TOC entry 2 (class 3079 OID 16385)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 16408)
-- Name: game; Type: TABLE; Schema: public; Owner: iniciador_admin
--

CREATE TABLE public.game (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(200) NOT NULL,
    category character varying(20) NOT NULL,
    status boolean DEFAULT true NOT NULL,
    "createBy" character varying(64),
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.game OWNER TO iniciador_admin;

--
-- TOC entry 210 (class 1259 OID 16396)
-- Name: typeorm_metadata; Type: TABLE; Schema: public; Owner: iniciador_admin
--

CREATE TABLE public.typeorm_metadata (
    type character varying NOT NULL,
    database character varying,
    schema character varying,
    "table" character varying,
    name character varying,
    value text
);


ALTER TABLE public.typeorm_metadata OWNER TO iniciador_admin;

--
-- TOC entry 211 (class 1259 OID 16401)
-- Name: user; Type: TABLE; Schema: public; Owner: iniciador_admin
--

CREATE TABLE public."user" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(200) NOT NULL,
    password character varying(24) NOT NULL,
    status boolean DEFAULT true NOT NULL
);


ALTER TABLE public."user" OWNER TO iniciador_admin;

--
-- TOC entry 3338 (class 0 OID 16408)
-- Dependencies: 212
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: iniciador_admin
--

COPY public.game (id, name, category, status, "createBy", "createdAt", "updatedAt") FROM stdin;
1436a873-bbd2-4516-84dc-3b269c48b77f	Diablo	RPG	t	\N	2022-05-12 02:15:22.847951	2022-05-12 02:15:22.847951
\.


--
-- TOC entry 3336 (class 0 OID 16396)
-- Dependencies: 210
-- Data for Name: typeorm_metadata; Type: TABLE DATA; Schema: public; Owner: iniciador_admin
--

COPY public.typeorm_metadata (type, database, schema, "table", name, value) FROM stdin;
\.


--
-- TOC entry 3337 (class 0 OID 16401)
-- Dependencies: 211
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: iniciador_admin
--

COPY public."user" (id, name, password, status) FROM stdin;
93239f68-598f-4e1a-abaa-e4685bcecd70	john	changeme	t
\.


--
-- TOC entry 3194 (class 2606 OID 16416)
-- Name: game PK_352a30652cd352f552fef73dec5; Type: CONSTRAINT; Schema: public; Owner: iniciador_admin
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT "PK_352a30652cd352f552fef73dec5" PRIMARY KEY (id);


--
-- TOC entry 3192 (class 2606 OID 16407)
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: iniciador_admin
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- TOC entry 3196 (class 2606 OID 16427)
-- Name: game unq_gamename; Type: CONSTRAINT; Schema: public; Owner: iniciador_admin
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT unq_gamename UNIQUE (name) INCLUDE (name);


-- Completed on 2022-05-11 23:24:04

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2022-05-11 23:24:04

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

-- Completed on 2022-05-11 23:24:05

--
-- PostgreSQL database dump complete
--

-- Completed on 2022-05-11 23:24:05

--
-- PostgreSQL database cluster dump complete
--

