--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14
-- Dumped by pg_dump version 12.14

-- Started on 2024-12-24 03:55:56

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

DROP DATABASE hotelesdb;
--
-- TOC entry 2924 (class 1262 OID 36683)
-- Name: hotelesdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE hotelesdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';


ALTER DATABASE hotelesdb OWNER TO postgres;

\connect hotelesdb

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 53518)
-- Name: acomodaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acomodaciones (
    id bigint NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public.acomodaciones OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 53544)
-- Name: acomodaciones_hoteles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acomodaciones_hoteles (
    id bigint NOT NULL,
    hotel_id bigint NOT NULL,
    regla_habitacion_id bigint NOT NULL,
    cantidad integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.acomodaciones_hoteles OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 53542)
-- Name: acomodaciones_hoteles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.acomodaciones_hoteles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acomodaciones_hoteles_id_seq OWNER TO postgres;

--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 218
-- Name: acomodaciones_hoteles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.acomodaciones_hoteles_id_seq OWNED BY public.acomodaciones_hoteles.id;


--
-- TOC entry 214 (class 1259 OID 53516)
-- Name: acomodaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.acomodaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acomodaciones_id_seq OWNER TO postgres;

--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 214
-- Name: acomodaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.acomodaciones_id_seq OWNED BY public.acomodaciones.id;


--
-- TOC entry 209 (class 1259 OID 53486)
-- Name: ciudades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciudades (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.ciudades OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 53484)
-- Name: ciudades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ciudades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ciudades_id_seq OWNER TO postgres;

--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 208
-- Name: ciudades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ciudades_id_seq OWNED BY public.ciudades.id;


--
-- TOC entry 211 (class 1259 OID 53494)
-- Name: hoteles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hoteles (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    nit character varying(64) NOT NULL,
    ciudad_id bigint NOT NULL,
    n_habitaciones integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.hoteles OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 53492)
-- Name: hoteles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hoteles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hoteles_id_seq OWNER TO postgres;

--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 210
-- Name: hoteles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hoteles_id_seq OWNED BY public.hoteles.id;


--
-- TOC entry 203 (class 1259 OID 53230)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 53228)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 202
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 207 (class 1259 OID 53472)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 53470)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 2931 (class 0 OID 0)
-- Dependencies: 206
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 217 (class 1259 OID 53526)
-- Name: reglas_habitaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reglas_habitaciones (
    id bigint NOT NULL,
    tipo_habitacion_id bigint NOT NULL,
    acomodacion_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.reglas_habitaciones OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 53524)
-- Name: reglas_habitaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reglas_habitaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reglas_habitaciones_id_seq OWNER TO postgres;

--
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 216
-- Name: reglas_habitaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reglas_habitaciones_id_seq OWNED BY public.reglas_habitaciones.id;


--
-- TOC entry 213 (class 1259 OID 53510)
-- Name: tipo_habitaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_habitaciones (
    id bigint NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public.tipo_habitaciones OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 53508)
-- Name: tipo_habitaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_habitaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_habitaciones_id_seq OWNER TO postgres;

--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 212
-- Name: tipo_habitaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_habitaciones_id_seq OWNED BY public.tipo_habitaciones.id;


--
-- TOC entry 205 (class 1259 OID 53459)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 53457)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2744 (class 2604 OID 53521)
-- Name: acomodaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acomodaciones ALTER COLUMN id SET DEFAULT nextval('public.acomodaciones_id_seq'::regclass);


--
-- TOC entry 2746 (class 2604 OID 53547)
-- Name: acomodaciones_hoteles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acomodaciones_hoteles ALTER COLUMN id SET DEFAULT nextval('public.acomodaciones_hoteles_id_seq'::regclass);


--
-- TOC entry 2741 (class 2604 OID 53489)
-- Name: ciudades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades ALTER COLUMN id SET DEFAULT nextval('public.ciudades_id_seq'::regclass);


--
-- TOC entry 2742 (class 2604 OID 53497)
-- Name: hoteles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteles ALTER COLUMN id SET DEFAULT nextval('public.hoteles_id_seq'::regclass);


--
-- TOC entry 2738 (class 2604 OID 53233)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2740 (class 2604 OID 53475)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 2745 (class 2604 OID 53529)
-- Name: reglas_habitaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reglas_habitaciones ALTER COLUMN id SET DEFAULT nextval('public.reglas_habitaciones_id_seq'::regclass);


--
-- TOC entry 2743 (class 2604 OID 53513)
-- Name: tipo_habitaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_habitaciones ALTER COLUMN id SET DEFAULT nextval('public.tipo_habitaciones_id_seq'::regclass);


--
-- TOC entry 2739 (class 2604 OID 53462)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2914 (class 0 OID 53518)
-- Dependencies: 215
-- Data for Name: acomodaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.acomodaciones VALUES (1, 'Sencilla');
INSERT INTO public.acomodaciones VALUES (2, 'Doble');
INSERT INTO public.acomodaciones VALUES (3, 'Triple');
INSERT INTO public.acomodaciones VALUES (4, 'Cuádruple');


--
-- TOC entry 2918 (class 0 OID 53544)
-- Dependencies: 219
-- Data for Name: acomodaciones_hoteles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.acomodaciones_hoteles VALUES (11, 4, 1, 25, '2024-12-24 07:00:17', '2024-12-24 08:38:46');
INSERT INTO public.acomodaciones_hoteles VALUES (12, 4, 3, 12, '2024-12-24 07:00:38', '2024-12-24 08:38:46');


--
-- TOC entry 2908 (class 0 OID 53486)
-- Dependencies: 209
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ciudades VALUES (1, 'Cartagena');
INSERT INTO public.ciudades VALUES (2, 'Bogotá');
INSERT INTO public.ciudades VALUES (3, 'Medellín');
INSERT INTO public.ciudades VALUES (4, 'Pereira');


--
-- TOC entry 2910 (class 0 OID 53494)
-- Dependencies: 211
-- Data for Name: hoteles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hoteles VALUES (4, 'DECAMERON CARTAGENA', 'CALLE 23 58-25', '12345678-9', 1, 42, '2024-12-23 12:42:23', '2024-12-23 12:42:23');
INSERT INTO public.hoteles VALUES (5, 'Prueba Hotel', 'Calle 5', '123456', 3, 50, '2024-12-24 07:16:26', '2024-12-24 07:16:26');


--
-- TOC entry 2902 (class 0 OID 53230)
-- Dependencies: 203
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migrations VALUES (17, '2014_10_12_000000_create_users_table', 1);
INSERT INTO public.migrations VALUES (18, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO public.migrations VALUES (19, '2024_12_08_211111_create_ciudades_table', 1);
INSERT INTO public.migrations VALUES (20, '2024_12_08_211908_create_hoteles_table', 1);
INSERT INTO public.migrations VALUES (21, '2024_12_08_213406_create_tipo_habitaciones_table', 1);
INSERT INTO public.migrations VALUES (22, '2024_12_08_213449_create_acomodaciones_table', 1);
INSERT INTO public.migrations VALUES (23, '2024_12_08_213622_create_reglas_habitaciones_table', 1);
INSERT INTO public.migrations VALUES (24, '2024_12_08_213843_create_acomodaciones_hoteles_table', 1);


--
-- TOC entry 2906 (class 0 OID 53472)
-- Dependencies: 207
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2916 (class 0 OID 53526)
-- Dependencies: 217
-- Data for Name: reglas_habitaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reglas_habitaciones VALUES (1, 1, 1, '2024-12-08 23:09:08', '2024-12-08 23:09:08');
INSERT INTO public.reglas_habitaciones VALUES (2, 1, 2, '2024-12-08 23:38:29', '2024-12-08 23:38:29');
INSERT INTO public.reglas_habitaciones VALUES (3, 2, 3, '2024-12-08 23:39:10', '2024-12-08 23:39:10');
INSERT INTO public.reglas_habitaciones VALUES (4, 2, 4, '2024-12-08 23:39:12', '2024-12-08 23:39:12');
INSERT INTO public.reglas_habitaciones VALUES (5, 3, 1, '2024-12-08 23:39:42', '2024-12-08 23:39:42');
INSERT INTO public.reglas_habitaciones VALUES (6, 3, 2, '2024-12-08 23:39:45', '2024-12-08 23:39:45');
INSERT INTO public.reglas_habitaciones VALUES (7, 3, 3, '2024-12-08 23:39:47', '2024-12-08 23:39:47');


--
-- TOC entry 2912 (class 0 OID 53510)
-- Dependencies: 213
-- Data for Name: tipo_habitaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_habitaciones VALUES (1, 'Estándar');
INSERT INTO public.tipo_habitaciones VALUES (2, 'Junior');
INSERT INTO public.tipo_habitaciones VALUES (3, 'Suite');


--
-- TOC entry 2904 (class 0 OID 53459)
-- Dependencies: 205
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 218
-- Name: acomodaciones_hoteles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.acomodaciones_hoteles_id_seq', 13, true);


--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 214
-- Name: acomodaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.acomodaciones_id_seq', 4, true);


--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 208
-- Name: ciudades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ciudades_id_seq', 4, true);


--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 210
-- Name: hoteles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hoteles_id_seq', 5, true);


--
-- TOC entry 2939 (class 0 OID 0)
-- Dependencies: 202
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 24, true);


--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 206
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 216
-- Name: reglas_habitaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reglas_habitaciones_id_seq', 7, true);


--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 212
-- Name: tipo_habitaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_habitaciones_id_seq', 3, true);


--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 2769 (class 2606 OID 53549)
-- Name: acomodaciones_hoteles acomodaciones_hoteles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acomodaciones_hoteles
    ADD CONSTRAINT acomodaciones_hoteles_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 53523)
-- Name: acomodaciones acomodaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acomodaciones
    ADD CONSTRAINT acomodaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 53491)
-- Name: ciudades ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudades_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 53502)
-- Name: hoteles hoteles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT hoteles_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 53235)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 53480)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 53483)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 2767 (class 2606 OID 53531)
-- Name: reglas_habitaciones reglas_habitaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reglas_habitaciones
    ADD CONSTRAINT reglas_habitaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 53515)
-- Name: tipo_habitaciones tipo_habitaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_habitaciones
    ADD CONSTRAINT tipo_habitaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 53469)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 2752 (class 2606 OID 53467)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 1259 OID 53481)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 2773 (class 2606 OID 53550)
-- Name: acomodaciones_hoteles acomodaciones_hoteles_hotel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acomodaciones_hoteles
    ADD CONSTRAINT acomodaciones_hoteles_hotel_id_foreign FOREIGN KEY (hotel_id) REFERENCES public.hoteles(id);


--
-- TOC entry 2774 (class 2606 OID 53555)
-- Name: acomodaciones_hoteles acomodaciones_hoteles_regla_habitacion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acomodaciones_hoteles
    ADD CONSTRAINT acomodaciones_hoteles_regla_habitacion_id_foreign FOREIGN KEY (regla_habitacion_id) REFERENCES public.reglas_habitaciones(id);


--
-- TOC entry 2770 (class 2606 OID 53503)
-- Name: hoteles hoteles_ciudad_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT hoteles_ciudad_id_foreign FOREIGN KEY (ciudad_id) REFERENCES public.ciudades(id);


--
-- TOC entry 2772 (class 2606 OID 53537)
-- Name: reglas_habitaciones reglas_habitaciones_acomodacion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reglas_habitaciones
    ADD CONSTRAINT reglas_habitaciones_acomodacion_id_foreign FOREIGN KEY (acomodacion_id) REFERENCES public.acomodaciones(id);


--
-- TOC entry 2771 (class 2606 OID 53532)
-- Name: reglas_habitaciones reglas_habitaciones_tipo_habitacion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reglas_habitaciones
    ADD CONSTRAINT reglas_habitaciones_tipo_habitacion_id_foreign FOREIGN KEY (tipo_habitacion_id) REFERENCES public.tipo_habitaciones(id);


-- Completed on 2024-12-24 03:55:57

--
-- PostgreSQL database dump complete
--

