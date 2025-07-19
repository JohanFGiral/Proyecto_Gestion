--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    categrory_id integer NOT NULL,
    ca_name character varying(15),
    description character varying(100)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_categrory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_categrory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_categrory_id_seq OWNER TO postgres;

--
-- Name: category_categrory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_categrory_id_seq OWNED BY public.category.categrory_id;


--
-- Name: credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credentials (
    user_id integer NOT NULL,
    username character varying(10) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE public.credentials OWNER TO postgres;

--
-- Name: elements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elements (
    elements_id integer NOT NULL,
    ele_serial character varying(50) NOT NULL,
    ele_name character varying(50) NOT NULL,
    ele_status boolean NOT NULL,
    ele_dateadded timestamp without time zone NOT NULL,
    ele_amount integer NOT NULL,
    ele_description character varying(100) NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.elements OWNER TO postgres;

--
-- Name: elements_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.elements_elements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.elements_elements_id_seq OWNER TO postgres;

--
-- Name: elements_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.elements_elements_id_seq OWNED BY public.elements.elements_id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_id integer NOT NULL,
    name character varying(10) NOT NULL,
    description character varying(150) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(100),
    status boolean NOT NULL,
    phone_number character varying(15),
    create_date timestamp without time zone NOT NULL,
    address character varying(25),
    role_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_entrylog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_entrylog (
    user_id integer NOT NULL,
    entrylog_id integer NOT NULL,
    entrydate timestamp without time zone NOT NULL,
    description character varying(100)
);


ALTER TABLE public.users_entrylog OWNER TO postgres;

--
-- Name: users_entrylog_entrylog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_entrylog_entrylog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_entrylog_entrylog_id_seq OWNER TO postgres;

--
-- Name: users_entrylog_entrylog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_entrylog_entrylog_id_seq OWNED BY public.users_entrylog.entrylog_id;


--
-- Name: category categrory_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN categrory_id SET DEFAULT nextval('public.category_categrory_id_seq'::regclass);


--
-- Name: elements elements_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elements ALTER COLUMN elements_id SET DEFAULT nextval('public.elements_elements_id_seq'::regclass);


--
-- Name: users_entrylog entrylog_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_entrylog ALTER COLUMN entrylog_id SET DEFAULT nextval('public.users_entrylog_entrylog_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (categrory_id, ca_name, description) FROM stdin;
1	Impresora	Dispositivo para impresion de documentos
2	Computador	Equipo de computo
3	Parlantes	Dispositivo para reproduccion de audio
4	Camara	Dispositivo para capturar video
5	Proyector	Dispositivo para reproduccion de video y presentaciones
6	Audifonos	Dispositivo para la reproduccion de audio
7	Monitor	Dispositivo para la reproduccion de video
8	Consolas	Dispositivo para videojuegos
9	Asistentes	Dispositivo inteligente asistido por IA
10	Teclados	Dispositivo para entrada de texto
\.


--
-- Data for Name: credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credentials (user_id, username, password) FROM stdin;
1	cperez	19c78e8f071486f5802cb3a14d3364f8
2	lgomez	d3aadf81525d026e792d80a21a8e04bb
3	mruiz	58599ff347cd3751363f91c43047ee73
4	jtorres	31c9e01c264458a9b3b50cbfe0ad7753
5	dlopez	5a470d09ae82b7ffff8cf9414ae70a99
6	spena	b9dfea9bd30c9085ef49f8476a333727
7	lmejia	f334bbbadfac24f795c62d9bde4b0536
8	crios	52c868cf286ff010c5916870eb3b68a4
9	vsilva	2f7d974b6658987fb51df523d6ea65f6
10	aherrera	774e688d9656ce666e87151694663a21
\.


--
-- Data for Name: elements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elements (elements_id, ele_serial, ele_name, ele_status, ele_dateadded, ele_amount, ele_description, category_id) FROM stdin;
1	SN-PRT-001	Impresora HP	t	2024-03-10 10:00:00	5	Impresora multifuncional	1
2	SN-PC-003	Dell XPS 13	t	2023-12-01 09:30:00	8	Port til liviano para desarrollo	2
3	SN-SPK-112	Logitech Z625	f	2024-01-15 14:45:00	4	Sistema de sonido 2.1	3
4	SN-CAM-908	Sony A6400	t	2024-05-02 08:15:00	2	C mara profesional sin espejo	4
5	SN-PRO-200	Epson EB-X41	t	2024-04-18 11:00:00	3	Proyector con HDMI y WiFi	5
6	SN-HDP-321	Sony WH-1000XM5	t	2024-06-22 13:20:00	10	Aud¡fonos con cancelaci¢n de ruido	6
7	SN-MNT-700	LG UltraWide	f	2024-02-10 16:00:00	6	Monitor panor mico de 34 pulgadas	7
8	SN-CNS-502	Xbox Series X	t	2024-03-25 17:30:00	2	Consola de videojuegos de £ltima generaci¢n	8
9	SN-AIA-777	Echo Dot 5	t	2024-07-01 10:10:00	7	Asistente virtual de Amazon	9
10	SN-KBD-210	Logitech MX Keys	t	2024-03-03 09:00:00	12	Teclado inal mbrico para productividad	10
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_id, name, description) FROM stdin;
1	Admin	Usuario Administrador total
2	Supervisor	Usuario Supervisor
3	Empleado	Usuario empleado para gestion
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, name, email, status, phone_number, create_date, address, role_id) FROM stdin;
1	Carlos P‚rez	cperez@example.com	t	3001234567	2024-03-01 08:00:00	Cra 10 #20-30	1
2	Luisa G¢mez	lgomez@example.com	t	3109876543	2024-03-02 09:30:00	Cl 45 #12-15	2
3	Mariana Ruiz	mruiz@example.com	f	3123456789	2024-03-03 10:15:00	Av 68 #33-50	3
4	Jorge Torres	jtorres@example.com	t	3134567890	2024-03-04 11:45:00	Cra 7 #45-60	2
5	Diana L¢pez	dlopez@example.com	t	3145678901	2024-03-05 14:00:00	Cl 26 #10-22	3
6	Santiago Pe¤a	spena@example.com	f	3156789012	2024-03-06 15:30:00	Av 9 #25-30	1
7	Laura Mej¡a	lmejia@example.com	t	3167890123	2024-03-07 16:00:00	Cra 11 #88-20	2
8	Camilo R¡os	crios@example.com	t	3178901234	2024-03-08 17:20:00	Cl 34 #44-33	3
9	Valentina Silva	vsilva@example.com	t	3189012345	2024-03-09 18:45:00	Cra 5 #22-19	2
10	Andr‚s Herrera	aherrera@example.com	f	3190123456	2024-03-10 20:00:00	Av 3 #11-55	1
\.


--
-- Data for Name: users_entrylog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_entrylog (user_id, entrylog_id, entrydate, description) FROM stdin;
1	3	2024-07-02 09:00:00	Accedi¢ al panel de administraci¢n
2	4	2024-07-02 09:05:00	Modific¢ informaci¢n de usuario
1	5	2024-07-02 09:10:00	Gener¢ informe mensual
3	6	2024-07-02 09:15:00	Revis¢ inventario de activos
2	7	2024-07-02 09:20:00	Descarg¢ registros del sistema
3	8	2024-07-02 09:25:00	Agreg¢ nuevo elemento
4	9	2024-07-02 09:30:00	Supervis¢ carga de datos
1	10	2024-07-02 09:35:00	Modific¢ su informaci¢n personal
2	11	2024-07-02 09:40:00	Solicit¢ asistencia t‚cnica
3	12	2024-07-02 09:45:00	Cerr¢ sesi¢n
1	13	2024-07-02 09:00:00	Accedi¢ al panel de administraci¢n
2	14	2024-07-02 09:05:00	Modific¢ informaci¢n de usuario
1	15	2024-07-02 09:10:00	Gener¢ informe mensual
3	16	2024-07-02 09:15:00	Revis¢ inventario de activos
2	17	2024-07-02 09:20:00	Descarg¢ registros del sistema
3	18	2024-07-02 09:25:00	Agreg¢ nuevo elemento
4	19	2024-07-02 09:30:00	Supervis¢ carga de datos
1	20	2024-07-02 09:35:00	Modific¢ su informaci¢n personal
2	21	2024-07-02 09:40:00	Solicit¢ asistencia t‚cnica
3	22	2024-07-02 09:45:00	Cerr¢ sesi¢n
\.


--
-- Name: category_categrory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_categrory_id_seq', 10, true);


--
-- Name: elements_elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.elements_elements_id_seq', 10, true);


--
-- Name: users_entrylog_entrylog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_entrylog_entrylog_id_seq', 22, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (categrory_id);


--
-- Name: credentials credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (user_id);


--
-- Name: credentials credentials_usename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_usename_key UNIQUE (username);


--
-- Name: elements elements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_pkey PRIMARY KEY (elements_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: users_entrylog users_entrylog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_entrylog
    ADD CONSTRAINT users_entrylog_pkey PRIMARY KEY (entrylog_id, user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: credentials credentials_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: elements elements_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(categrory_id);


--
-- Name: users_entrylog users_entrylog_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_entrylog
    ADD CONSTRAINT users_entrylog_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id);


--
-- PostgreSQL database dump complete
--

