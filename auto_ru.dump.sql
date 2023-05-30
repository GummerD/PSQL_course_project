--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: freight_vehicles; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.freight_vehicles (
    id integer NOT NULL,
    car_brand character varying(100) NOT NULL,
    car_name character varying(100) NOT NULL,
    car_color character varying(100) NOT NULL,
    engine_power character varying(50) NOT NULL,
    gearbox character varying(50) NOT NULL,
    car_body character varying(50) NOT NULL,
    year_of_issue date NOT NULL,
    created_at date NOT NULL
);


ALTER TABLE public.freight_vehicles OWNER TO gb_user;

--
-- Name: freight_vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.freight_vehicles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.freight_vehicles_id_seq OWNER TO gb_user;

--
-- Name: freight_vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.freight_vehicles_id_seq OWNED BY public.freight_vehicles.id;


--
-- Name: garage; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.garage (
    id_user integer,
    id_light_vehicles integer,
    id_freight_vehicles integer,
    id_motorcycles integer,
    state_number character varying(20),
    vin character varying(30),
    vehicles_photo_id integer,
    vehicles_video_id integer,
    ownership_status character varying(50),
    vehicle_information character varying(300),
    created_at date
);


ALTER TABLE public.garage OWNER TO gb_user;

--
-- Name: light_vehicles; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.light_vehicles (
    id integer NOT NULL,
    car_brand character varying(100) NOT NULL,
    car_name character varying(100) NOT NULL,
    car_color character varying(100) NOT NULL,
    engine_power character varying(50) NOT NULL,
    gearbox character varying(50) NOT NULL,
    car_body character varying(50) NOT NULL,
    year_of_issue date NOT NULL,
    created_at date NOT NULL
);


ALTER TABLE public.light_vehicles OWNER TO gb_user;

--
-- Name: light_vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.light_vehicles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.light_vehicles_id_seq OWNER TO gb_user;

--
-- Name: light_vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.light_vehicles_id_seq OWNED BY public.light_vehicles.id;


--
-- Name: messages_for_seller; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.messages_for_seller (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_private_seller integer NOT NULL,
    text character varying(500) NOT NULL,
    created_at date NOT NULL
);


ALTER TABLE public.messages_for_seller OWNER TO gb_user;

--
-- Name: messages_for_seller_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.messages_for_seller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_for_seller_id_seq OWNER TO gb_user;

--
-- Name: messages_for_seller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.messages_for_seller_id_seq OWNED BY public.messages_for_seller.id;


--
-- Name: motorcycles; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.motorcycles (
    id integer NOT NULL,
    moto_brand character varying(100) NOT NULL,
    moto_name character varying(100) NOT NULL,
    moto_color character varying(100) NOT NULL,
    engine_power character varying(50) NOT NULL,
    gearbox character varying(50) NOT NULL,
    moto_body character varying(50) NOT NULL,
    year_of_issue date NOT NULL,
    created_at date NOT NULL
);


ALTER TABLE public.motorcycles OWNER TO gb_user;

--
-- Name: motorcycles_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.motorcycles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motorcycles_id_seq OWNER TO gb_user;

--
-- Name: motorcycles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.motorcycles_id_seq OWNED BY public.motorcycles.id;


--
-- Name: private_seller; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.private_seller (
    id integer NOT NULL,
    id_user integer,
    id_light_vehicles integer,
    id_freight_vehicles integer,
    id_motorcycles integer,
    description character varying(20),
    status character varying(20),
    photo_id integer,
    video_id integer,
    price integer,
    created_at date NOT NULL
);


ALTER TABLE public.private_seller OWNER TO gb_user;

--
-- Name: private_seller_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.private_seller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.private_seller_id_seq OWNER TO gb_user;

--
-- Name: private_seller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.private_seller_id_seq OWNED BY public.private_seller.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.profiles (
    id_user integer,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(120),
    phone character varying(15),
    driving_experience smallint,
    personal_information character varying(300),
    main_foto_id integer,
    created_at date
);


ALTER TABLE public.profiles OWNER TO gb_user;

--
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    created_at date
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_photo; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users_photo (
    id integer NOT NULL,
    owner_id integer NOT NULL,
    url character varying(250) NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at date NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.users_photo OWNER TO gb_user;

--
-- Name: users_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_photo_id_seq OWNER TO gb_user;

--
-- Name: users_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_photo_id_seq OWNED BY public.users_photo.id;


--
-- Name: vehicles_photo; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.vehicles_photo (
    id integer NOT NULL,
    owner_id integer NOT NULL,
    url character varying(250) NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at date NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.vehicles_photo OWNER TO gb_user;

--
-- Name: vehicles_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.vehicles_photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicles_photo_id_seq OWNER TO gb_user;

--
-- Name: vehicles_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.vehicles_photo_id_seq OWNED BY public.vehicles_photo.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.video (
    id integer NOT NULL,
    owner_id integer NOT NULL,
    url character varying(250) NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at date NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.video OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: freight_vehicles id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.freight_vehicles ALTER COLUMN id SET DEFAULT nextval('public.freight_vehicles_id_seq'::regclass);


--
-- Name: light_vehicles id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.light_vehicles ALTER COLUMN id SET DEFAULT nextval('public.light_vehicles_id_seq'::regclass);


--
-- Name: messages_for_seller id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages_for_seller ALTER COLUMN id SET DEFAULT nextval('public.messages_for_seller_id_seq'::regclass);


--
-- Name: motorcycles id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.motorcycles ALTER COLUMN id SET DEFAULT nextval('public.motorcycles_id_seq'::regclass);


--
-- Name: private_seller id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.private_seller ALTER COLUMN id SET DEFAULT nextval('public.private_seller_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_photo id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users_photo ALTER COLUMN id SET DEFAULT nextval('public.users_photo_id_seq'::regclass);


--
-- Name: vehicles_photo id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.vehicles_photo ALTER COLUMN id SET DEFAULT nextval('public.vehicles_photo_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: freight_vehicles; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.freight_vehicles (id, car_brand, car_name, car_color, engine_power, gearbox, car_body, year_of_issue, created_at) FROM stdin;
1	Mercedes Benz	simple truck	blue	635	automatic	open	2019-06-27	2019-06-03
2	Man	truck with accommodation	red	453	manual	closed	2022-09-05	2019-02-12
3	Daf	timber carrier	yellow	540	robot	open	2022-10-13	2019-05-22
4	Scania	simple truck	white	601	automatic	closed	2019-09-11	2021-11-10
5	Iveco	truck with accommodation	black	892	manual	open	2020-03-31	2022-10-20
6	Volvo	timber carrier	green	737	robot	closed	2022-12-23	2023-03-31
7	Renault	simple truck	brown	518	automatic	open	2022-09-19	2020-03-04
8	Nissan	truck with accommodation	blue	400	manual	closed	2022-03-27	2019-03-02
9	Mitsubishi	timber carrier	red	644	robot	open	2019-05-03	2019-05-14
10	Mercedes Benz	simple truck	yellow	499	automatic	closed	2021-02-27	2021-11-16
11	Man	truck with accommodation	white	569	manual	open	2021-07-28	2023-07-17
12	Daf	timber carrier	black	765	robot	closed	2019-04-04	2023-03-05
13	Scania	simple truck	green	255	automatic	open	2020-03-25	2022-11-30
14	Iveco	truck with accommodation	brown	991	manual	closed	2022-10-11	2019-02-05
15	Volvo	timber carrier	blue	803	robot	open	2019-05-13	2023-02-09
16	Renault	simple truck	red	811	automatic	closed	2020-11-03	2019-08-27
17	Nissan	truck with accommodation	yellow	371	manual	open	2021-09-20	2022-04-06
18	Mitsubishi	timber carrier	white	723	robot	closed	2021-02-03	2020-01-26
19	Mercedes Benz	simple truck	black	716	automatic	open	2021-08-12	2023-07-27
20	Man	truck with accommodation	green	964	manual	closed	2021-08-29	2020-05-20
21	Daf	timber carrier	brown	366	robot	open	2019-12-13	2020-12-11
22	Scania	simple truck	blue	618	automatic	closed	2019-09-29	2021-02-18
23	Iveco	truck with accommodation	red	614	manual	open	2022-10-18	2021-02-02
24	Volvo	timber carrier	yellow	827	robot	closed	2022-02-25	2020-05-01
25	Renault	simple truck	white	842	automatic	open	2021-02-10	2020-11-03
26	Nissan	truck with accommodation	black	289	manual	closed	2018-11-08	2023-12-05
27	Mitsubishi	timber carrier	green	467	robot	open	2022-12-08	2018-12-02
28	Mercedes Benz	simple truck	brown	242	automatic	closed	2021-02-19	2020-12-13
29	Man	truck with accommodation	blue	677	manual	open	2020-10-15	2022-11-23
30	Daf	timber carrier	red	369	robot	closed	2022-11-04	2018-12-27
31	Scania	simple truck	yellow	535	automatic	open	2020-06-04	2022-03-09
32	Iveco	truck with accommodation	white	183	manual	closed	2018-10-03	2023-02-07
33	Volvo	timber carrier	black	539	robot	open	2022-02-27	2019-05-22
34	Renault	simple truck	green	920	automatic	closed	2020-05-08	2019-09-25
35	Nissan	truck with accommodation	brown	158	manual	open	2022-12-17	2019-06-14
36	Mitsubishi	timber carrier	blue	789	robot	closed	2022-04-10	2020-04-14
37	Mercedes Benz	simple truck	red	374	automatic	open	2020-07-09	2022-01-23
38	Man	truck with accommodation	yellow	546	manual	closed	2020-07-07	2023-07-23
39	Daf	timber carrier	white	404	robot	open	2021-12-20	2018-10-19
40	Scania	simple truck	black	439	automatic	closed	2021-06-25	2022-10-10
41	Iveco	truck with accommodation	green	942	manual	open	2021-10-07	2023-12-05
42	Volvo	timber carrier	brown	457	robot	closed	2022-07-07	2021-06-26
43	Renault	simple truck	blue	977	automatic	open	2019-09-29	2020-03-07
44	Nissan	truck with accommodation	red	966	manual	closed	2022-05-18	2020-03-22
45	Mitsubishi	timber carrier	yellow	483	robot	open	2022-05-18	2023-05-27
46	Mercedes Benz	simple truck	white	280	automatic	closed	2020-06-06	2020-08-03
47	Man	truck with accommodation	black	922	manual	open	2020-05-13	2022-10-22
48	Daf	timber carrier	green	633	robot	closed	2020-12-13	2019-11-16
49	Scania	simple truck	brown	177	automatic	open	2020-03-28	2022-04-22
50	Iveco	truck with accommodation	blue	934	manual	closed	2020-10-09	2021-01-22
51	Volvo	timber carrier	red	669	robot	open	2019-04-11	2019-01-24
52	Renault	simple truck	yellow	179	automatic	closed	2022-03-11	2022-04-10
53	Nissan	truck with accommodation	white	302	manual	open	2021-12-19	2023-03-20
54	Mitsubishi	timber carrier	black	764	robot	closed	2019-06-15	2020-08-01
55	Mercedes Benz	simple truck	green	553	automatic	open	2020-10-27	2021-06-11
56	Man	truck with accommodation	brown	773	manual	closed	2021-03-30	2020-07-26
57	Daf	timber carrier	blue	453	robot	open	2021-05-24	2023-12-03
58	Scania	simple truck	red	419	automatic	closed	2022-06-25	2023-01-18
59	Iveco	truck with accommodation	yellow	680	manual	open	2020-09-07	2022-07-26
60	Volvo	timber carrier	white	797	robot	closed	2022-04-21	2021-10-26
61	Renault	simple truck	black	888	automatic	open	2020-03-08	2022-12-15
62	Nissan	truck with accommodation	green	759	manual	closed	2020-03-01	2019-10-23
63	Mitsubishi	timber carrier	brown	727	robot	open	2019-10-19	2022-06-28
64	Mercedes Benz	simple truck	blue	460	automatic	closed	2020-12-11	2021-10-23
65	Man	truck with accommodation	red	515	manual	open	2021-02-03	2023-06-19
66	Daf	timber carrier	yellow	605	robot	closed	2019-09-16	2019-09-15
67	Scania	simple truck	white	707	automatic	open	2022-07-24	2019-05-10
68	Iveco	truck with accommodation	black	655	manual	closed	2021-07-13	2023-07-06
69	Volvo	timber carrier	green	258	robot	open	2021-02-02	2022-04-18
70	Renault	simple truck	brown	197	automatic	closed	2021-05-14	2021-08-11
71	Nissan	truck with accommodation	blue	500	manual	open	2020-10-13	2020-06-08
72	Mitsubishi	timber carrier	red	616	robot	closed	2021-11-29	2018-10-04
73	Mercedes Benz	simple truck	yellow	460	automatic	open	2022-06-15	2023-04-30
74	Man	truck with accommodation	white	898	manual	closed	2018-10-04	2022-12-24
75	Daf	timber carrier	black	274	robot	open	2021-07-02	2022-01-05
76	Scania	simple truck	green	331	automatic	closed	2021-06-11	2022-09-01
77	Iveco	truck with accommodation	brown	449	manual	open	2022-06-25	2020-12-28
78	Volvo	timber carrier	blue	862	robot	closed	2021-01-01	2020-01-06
79	Renault	simple truck	red	591	automatic	open	2022-08-26	2020-07-06
80	Nissan	truck with accommodation	yellow	652	manual	closed	2019-02-01	2021-09-06
81	Mitsubishi	timber carrier	white	673	robot	open	2022-01-07	2019-06-20
82	Mercedes Benz	simple truck	black	302	automatic	closed	2021-11-05	2022-12-28
83	Man	truck with accommodation	green	242	manual	open	2019-12-25	2019-06-25
84	Daf	timber carrier	brown	858	robot	closed	2021-03-15	2019-03-12
85	Scania	simple truck	blue	499	automatic	open	2020-03-05	2021-09-18
86	Iveco	truck with accommodation	red	966	manual	closed	2019-10-24	2019-05-16
87	Volvo	timber carrier	yellow	178	robot	open	2019-02-13	2023-06-11
88	Renault	simple truck	white	603	automatic	closed	2022-05-29	2022-12-22
89	Nissan	truck with accommodation	black	454	manual	open	2021-09-21	2022-11-15
90	Mitsubishi	timber carrier	green	652	robot	closed	2019-10-18	2019-06-29
91	Mercedes Benz	simple truck	brown	402	automatic	open	2018-09-05	2022-11-12
92	Man	truck with accommodation	blue	600	manual	closed	2022-05-28	2023-02-04
93	Daf	timber carrier	red	682	robot	open	2019-07-29	2021-04-22
94	Scania	simple truck	yellow	230	automatic	closed	2020-03-04	2020-08-12
95	Iveco	truck with accommodation	white	485	manual	open	2018-11-04	2023-02-13
96	Volvo	timber carrier	black	319	robot	closed	2022-12-05	2022-04-27
97	Renault	simple truck	green	319	automatic	open	2019-09-19	2021-04-22
98	Nissan	truck with accommodation	brown	365	manual	closed	2022-10-14	2020-05-29
99	Mitsubishi	timber carrier	blue	331	robot	open	2019-09-21	2019-05-14
100	Mercedes Benz	simple truck	red	689	automatic	closed	2020-01-25	2023-03-03
\.


--
-- Data for Name: garage; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.garage (id_user, id_light_vehicles, id_freight_vehicles, id_motorcycles, state_number, vin, vehicles_photo_id, vehicles_video_id, ownership_status, vehicle_information, created_at) FROM stdin;
14	\N	\N	55	sapien234	vel234,	8	60	sold	jksehfbe iuejbwehj	2020-05-31
44	86	\N	\N	sit234	esdf234	74	73	sold	jksehfbeiuejb wehj	2022-08-15
77	55	\N	\N	magna234	purus234sdf	99	93	owned	jks ehfbeiuejbwehj	2020-05-31
85	20	\N	\N	placerat234	sapien234sd	11	49	owned	jksehfb eiuejbwehj	2020-11-21
40	62	\N	\N	volutpat234	in234234gfdfg	39	20	sold	jksehfb eiuejbwehj	2022-08-15
99	\N	\N	51	adipiscing2342	natoque234dfg	96	38	sold	jksehfbeiuejbwehj	2020-05-08
22	\N	7	\N	arcu2342	nec234234dfg	66	27	owned	jkse hfbeiuejbw ehj	2020-01-26
62	74	\N	\N	Curabitur234	dolor234dfgdf	80	46	owned	jkse hfbeiuejb wehj	2020-05-31
81	98	\N	\N	aliquet234ssd	Quisque234sdf	7	40	sold	jkseh fbei uejbwe hj	2020-11-21
25	1	\N	\N	quam234	erat234fsdf	97	31	sold	jk se hfbeiue jbwehj	2022-08-15
46	\N	76	\N	convallis234	non23423sdfsd	4	74	owned	jks ehfbe iue jb wehj	2020-11-21
58	35	\N	\N	ac234	In23423sdfsdf	30	63	owned	jks ehfb eiuejbwe hj	2020-05-08
38	48	\N	\N	hendrerit234	Nunc234sdfsd	40	74	sold	jk sehf beiuejbwehj	2020-11-21
3	89	\N	\N	aliquet234ewr	posuere234sdfdfs	35	71	sold	jks ehfbeiuej bwehj	2020-11-21
1	24	\N	\N	erat234	risus23423sdfsdf	21	15	owned	jk sehfbe iuejbwehj	2022-08-15
55	5	\N	\N	libero234	ornare234sdfsdf	71	21	owned	jksehfb iuejbwehj	2020-11-21
55	\N	22	\N	egestas234	odio234sdfsdf	53	93	sold	jkse hfbeiue jbwehj	2020-11-21
78	25	\N	\N	vitae567	bibendum567sdffs	57	53	sold	jksehfb eiuejbwehj	2022-08-15
75	18	\N	\N	ante5676	senectus56756sdfsd	55	90	owned	jks ehfbei uejbwehj	2020-11-21
19	31	\N	\N	facilisis56756	erat56756sdffs	62	15	owned	jkseh fbeiuej bwehj	2020-11-21
54	89	\N	\N	vel567756	vel567567sdf	13	27	sold	jksehf beiuej bwe hj	2021-09-17
4	5	\N	\N	est567567	at567567fgffgh	14	42	sold	jkseh fbei uej bwehj	2020-11-21
63	73	\N	\N	imperdiet5677567	ante567567fghfg	34	83	owned	jkseh fbeiu ejb wehj	2020-11-21
2	32	\N	\N	aliquet5567	Sed5677fghfg	13	49	owned	jks ehfbe iuej wehj	2020-11-21
9	14	\N	\N	scelerisque567675	eu567567fghfgh	5	83	sold	jks ehfb eiuejb wehj	2020-11-21
94	\N	79	\N	mollis5675	mauris567fghfgh	14	18	sold	jks ehfb eiuej bwehj	2020-11-21
4	84	\N	\N	lorem567	convallis567fghfg	94	7	owned	jks eh fbeiuej bwehj	2020-01-26
92	1	\N	\N	Nam567	si567tfg	90	98	owned	jksehfb  eiuejb wehj	2020-11-21
36	18	\N	\N	grav567ida	se5675mfgh	92	39	sold	jkse hfbeiu ejb we hj	2020-11-21
18	79	\N	\N	ut567567,	ne567que	73	95	sold	jkse hf beiu ejbwehj	2020-05-31
19	49	\N	\N	id567567	penatib567us	6	33	owned	jk sehfbeiue jbw ehj	2020-11-21
93	76	\N	\N	eget5675	odi567567fghfgh	31	96	owned	jkse hfbeiue jbwehj	2021-09-17
66	14	\N	\N	facilisi5675	volutpa567567fgh	95	71	sold	jksehf beiuejbwe hj	2020-05-08
41	69	\N	\N	eu567567	Don567567fghfg	94	67	sold	jkse hf beiuejb wehj	2020-11-21
88	92	\N	\N	partur567657	Proin5675fgh	40	72	owned	jks ehfbeiue jbwehj	2021-09-17
25	21	\N	\N	lectu565675	por567567ttitor	18	5	owned	jkse hfbeiuej bwe hj	2020-11-21
13	4	\N	\N	eget56756	neq56756ue	12	13	sold	jks eh fbeiu ejbwehj	2020-01-26
42	66	\N	\N	at567567	n567567unc	17	76	sold	jkse hfbeiuejbw ehj	2020-11-21
42	\N	79	\N	nisi567567	vel567567	97	63	owned	jk sehf beiuejb wehj	2020-11-21
67	40	\N	\N	eli56756756t	neq567ue567fgh	2	77	owned	jksehfb eiuejbwehj	2021-09-17
57	\N	\N	55	nib567h567	sapien567567fghf	15	92	sold	jks ehfbeiu ejbwehj	2020-11-21
38	12	\N	\N	magna567567	lacus567567fgh	8	17	sold	jkseh fbeiuej bwehj	2020-05-08
58	44	\N	\N	puru567567.	Nun56756cfgh	9	43	owned	jks ehfbe  iue jbwehj	2020-01-26
76	\N	\N	35	Se567567dwe	erat567567fgh	35	24	owned	jks ehfbeiu ej bwehj	2020-01-26
40	87	\N	\N	Null567567am	ultr567ices567dfg	9	44	sold	jkseh fbeiu ejb wehj	2020-11-21
95	85	\N	\N	di567m567	at567567fhgh	44	22	sold	jksehf beiuej bwehj	2020-11-21
36	1	\N	\N	consec567tetue567	adipi56756scing	17	40	owned	jk sehfbe iue jbwehj	2020-05-31
11	4	\N	\N	lig567567ula567	ultr567567icies	26	93	owned	jks ehfb dfsdfs eiuejbwehj	2020-11-21
23	\N	\N	55	a567567	mor567567bidf	36	35	sold	jksehfbeiu ej wehj	2021-09-17
41	53	\N	\N	nul567567la	ultri567ces567gfh	89	34	sold	jksehfb eiuejbwehj	2020-11-21
82	\N	19	\N	Aene567567an	vit567567ae,	43	7	owned	jksehf beiue bwehj	2020-11-21
61	30	\N	\N	cub567567ilia	a56756756dfg	80	76	owned	jkse hfb eiuejbwehj	2020-01-26
88	65	\N	\N	partu567567rient	Prae567567sent	37	82	sold	jkse hfbei ue jbwehj	2020-11-21
87	7	\N	\N	Cu567567m	Fu567567scedf	23	54	sold	jkseh fbeiuej bwehj	2020-11-21
8	16	\N	\N	Viva567567mus	ips567567umdf	26	37	owned	jkseh fbeiue jbwe hj	2020-05-08
66	5	\N	\N	dia567567m	pret56756756iumgf	97	68	owned	jk sehfbe iu ejb wehj	2020-11-21
73	50	\N	\N	ele567567ifend,	am567567etdf	25	47	sold	jkseh fbe iu ejbw ehj	2020-01-26
12	49	\N	\N	vehi567567cula	ni567567sifg	19	18	sold	jk sehfb eiu ej bwehj	2020-11-21
43	60	\N	\N	te567567mpus	ris567567ushg	31	43	owned	jks ehf beiu ejbw ehj	2021-09-17
59	\N	\N	89	sem567567per	en567567im	41	16	owned	jks ehfbei uejbwehj	2020-11-21
100	30	\N	\N	ege567567stas	vit567567ae	25	38	sold	jkseh fbeiuejbwehj	2020-11-21
46	\N	67	\N	Se567567drt	tem567567por	10	58	sold	jkse hfbeiu ejbwehj	2020-01-26
5	38	\N	\N	elei567567fend	Viva567567mus	25	8	owned	jkse hfbeiuejbwehj	2020-11-21
51	\N	\N	24	di567567m	am567567577et	26	5	owned	jksehfbeiuej bwehj	2022-08-15
49	90	\N	\N	Suspe567567ndisse	le567567o	81	74	sold	jkseh fbeiuejbwehj	2020-05-08
26	7	\N	\N	con567567gue.	na5567msdf	43	50	sold	jksehfb eiuejbwehj	2020-11-21
10	\N	\N	55	cur567567sus	u567567567t,	84	70	owned	jksehf beiuejbwehj	2020-05-31
38	40	\N	\N	vulp567567utate,	vulp56756utate	23	4	owned	jkseh fbeiuejbwehj	2020-11-21
35	34	\N	\N	tinci567567dunt	tinci567567dunt	60	38	sold	jksehf be uejbwehj	2021-09-17
36	\N	\N	14	aliq567567uam	Phase567567llus	77	30	sold	jksehfbei uejbwehj	2022-08-15
19	\N	\N	68	pret567567ium	nu567567lla	12	29	owned	jksehf beiuejbwehj	2020-11-21
22	\N	\N	16	lac567567us	or567567ci	87	75	owned	jkse fbeiuejbwe hj	2021-09-17
17	\N	\N	46	ni567567si	lac567567us	67	81	sold	jkseh fbei uejb wehj	2020-11-21
88	86	\N	\N	frin567567gilla	a567567t	7	96	sold	jksehf beiuej bwehj	2020-11-21
28	\N	28	\N	ullam567567corper,	Na567567m	70	48	owned	jk sehfb eiuejbwehj	2020-11-21
20	20	\N	\N	Qui567567sque	laci567567nia	62	26	owned	jksehf eiuejb wehj	2020-11-21
86	57	\N	\N	vi567567tae	me567567tus.	15	68	sold	jks ehfbeiue jbwehj	2021-09-17
8	73	\N	\N	aliq57567uam	m567567567i	53	93	sold	jkse hfbeiuejbwe hj	2020-11-21
51	25	\N	\N	ne567567c,	lig7567567ula.	98	52	owned	jksehf beiuejbwehj	2022-08-15
9	82	\N	\N	me4567756tus	ri567567us.	72	27	owned	jkse hfbeiuejb wehj	2020-11-21
98	57	\N	\N	bla567567ndit	di56754645am	64	19	sold	jkseh fbeiuejbwehj	2020-11-21
93	2	\N	\N	di567754am	en56775456im.	23	74	sold	jksehfbe iuejbwehj	2020-05-31
45	93	\N	\N	sem45647per	vest355464bulum	44	13	owned	jksehfb eiue jbwehj	2020-11-21
72	61	\N	\N	auc4566453456tor	en45645345im.	30	95	owned	jks ehfbeiuejbwehj	2020-11-21
68	\N	\N	59	nu45645lla	nu34554645nc	84	22	sold	jksehfbei uej bwehj	2020-05-08
88	\N	\N	21	di456453s	ju456456sto	36	57	sold	jksehfb eiuej bwehj	2020-01-26
37	\N	\N	36	feug4353453iat	dic456456tum	12	22	owned	jksehf beiu ej bwehj	2020-11-21
14	43	\N	\N	i45645645d	ve4456l	85	93	owned	jkseh fbeiue jbwehj	2021-09-17
73	38	\N	\N	ne456456c	ni456456sl	64	67	sold	jksehfbe  iuejbwehj	2020-11-21
89	\N	27	\N	pla456456erat	nu456456nc	41	30	sold	jkse hfbeiu ejb wehj	2020-11-21
29	94	\N	\N	met456456us.	fe456456lis	42	81	owned	jkseh fbeiuejbwe hj	2020-11-21
43	90	\N	\N	hend45645645rerit	nat456456oque	87	83	owned	jk sehfbeiue jbwehj	2020-11-21
7	77	\N	\N	Mau456456ris	ar456456cu.	26	33	sold	jkseh fbeiuejb wehj	2020-11-21
97	3	\N	\N	eli45645t	sem456456per	95	11	sold	jksehfbeiuej bwehj	2022-08-15
86	86	\N	\N	di456456tum	en456456im	80	22	owned	jksehf beiuej bwehj	2020-11-21
24	44	\N	\N	lo456645rem	vel45645it	10	53	owned	jkseh fb eiuejbwehj	2020-05-31
56	53	\N	\N	ma456456gna	es456456t	83	84	sold	jkseh fbeiue jbwehj	2022-08-15
19	78	\N	\N	var456456456ius	eli456456t	13	54	sold	jkseh fbeiue jbwehj	2020-05-08
52	\N	\N	49	qu456i45645s	mole45645stie	100	20	owned	jksehf beiuejbwehj	2020-01-26
88	\N	79	\N	qu456456is	mole5675675stie	48	53	owned	jksehfbei uejbwehj	2020-05-31
\.


--
-- Data for Name: light_vehicles; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.light_vehicles (id, car_brand, car_name, car_color, engine_power, gearbox, car_body, year_of_issue, created_at) FROM stdin;
1	Mercedes Benz	some name	blue	185	automatic	sedan	2020-11-10	2020-07-13
2	Volvo	some name	red	565	manual	convertible	2022-11-17	2020-11-24
3	Renault	some name	yellow	219	robot	wagon	2020-10-10	2022-06-11
4	Nissan	some name	white	253	automatic	minivan	2022-08-18	2019-01-19
5	Mitsubishi	some name	black	587	manual	crossover	2021-09-17	2021-07-19
6	BMW	some name	green	581	robot	sedan	2018-11-10	2019-03-24
7	Kia	some name	brown	488	automatic	convertible	2020-12-24	2020-06-17
8	Mazda	some name	blue	184	manual	wagon	2021-12-06	2021-08-18
9	Hyundai	some name	red	189	robot	minivan	2021-02-27	2023-05-13
10	Honda	some name	yellow	260	automatic	crossover	2021-06-08	2023-06-01
11	Mercedes Benz	some name	white	556	manual	sedan	2021-08-17	2022-04-04
12	Volvo	some name	black	434	robot	convertible	2022-10-29	2022-12-24
13	Renault	some name	green	152	automatic	wagon	2019-06-19	2020-09-27
14	Nissan	some name	brown	118	manual	minivan	2021-12-11	2021-05-16
15	Mitsubishi	some name	blue	221	robot	crossover	2021-02-18	2023-12-10
16	BMW	some name	red	179	automatic	sedan	2019-02-16	2023-03-20
17	Kia	some name	yellow	169	manual	convertible	2019-01-03	2019-12-20
18	Mazda	some name	white	219	robot	wagon	2019-01-13	2020-04-09
19	Hyundai	some name	black	139	automatic	minivan	2021-06-08	2023-10-27
20	Honda	some name	green	149	manual	crossover	2019-07-26	2021-01-28
21	Mercedes Benz	some name	brown	487	robot	sedan	2019-09-15	2021-02-17
22	Volvo	some name	blue	488	automatic	convertible	2019-06-23	2023-04-13
23	Renault	some name	red	88	manual	wagon	2020-10-30	2022-08-05
24	Nissan	some name	yellow	593	robot	minivan	2020-01-27	2022-07-25
25	Mitsubishi	some name	white	260	automatic	crossover	2020-08-03	2018-10-24
26	BMW	some name	black	84	manual	sedan	2020-04-30	2021-10-14
27	Kia	some name	green	222	robot	convertible	2022-04-22	2022-08-20
28	Mazda	some name	brown	440	automatic	wagon	2021-11-05	2021-09-29
29	Hyundai	some name	blue	450	manual	minivan	2020-08-23	2023-03-10
30	Honda	some name	red	447	robot	crossover	2018-09-06	2020-04-10
31	Mercedes Benz	some name	yellow	400	automatic	sedan	2021-06-20	2019-04-12
32	Volvo	some name	white	280	manual	convertible	2018-12-08	2022-05-22
33	Renault	some name	black	324	robot	wagon	2020-09-04	2018-11-29
34	Nissan	some name	green	268	automatic	minivan	2018-11-25	2023-01-19
35	Mitsubishi	some name	brown	547	manual	crossover	2021-05-26	2023-05-11
36	BMW	some name	blue	347	robot	sedan	2020-05-10	2020-11-17
37	Kia	some name	red	553	automatic	convertible	2018-10-28	2020-11-08
38	Mazda	some name	yellow	560	manual	wagon	2019-10-27	2020-05-02
39	Hyundai	some name	white	467	robot	minivan	2022-12-31	2022-03-01
40	Honda	some name	black	147	automatic	crossover	2020-03-14	2023-05-16
41	Mercedes Benz	some name	green	270	manual	sedan	2022-12-23	2020-05-17
42	Volvo	some name	brown	422	robot	convertible	2019-06-24	2022-04-15
43	Renault	some name	blue	366	automatic	wagon	2018-11-10	2018-12-06
44	Nissan	some name	red	554	manual	minivan	2019-06-17	2021-08-19
45	Mitsubishi	some name	yellow	233	robot	crossover	2019-11-10	2019-08-06
46	BMW	some name	white	150	automatic	sedan	2022-08-12	2023-09-05
47	Kia	some name	black	121	manual	convertible	2022-06-27	2021-02-10
48	Mazda	some name	green	221	robot	wagon	2021-01-10	2022-12-26
49	Hyundai	some name	brown	325	automatic	minivan	2021-08-01	2023-04-15
50	Honda	some name	blue	256	manual	crossover	2022-03-25	2023-10-18
51	Mercedes Benz	some name	red	235	robot	sedan	2019-01-21	2022-12-30
52	Volvo	some name	yellow	593	automatic	convertible	2019-01-10	2020-03-01
53	Renault	some name	white	314	manual	wagon	2021-05-13	2023-02-18
54	Nissan	some name	black	587	robot	minivan	2022-05-30	2022-04-17
55	Mitsubishi	some name	green	269	automatic	crossover	2019-08-28	2019-08-07
56	BMW	some name	brown	530	manual	sedan	2018-11-02	2020-07-29
57	Kia	some name	blue	593	robot	convertible	2021-02-01	2019-08-04
58	Mazda	some name	red	327	automatic	wagon	2019-08-11	2023-11-04
59	Hyundai	some name	yellow	288	manual	minivan	2022-08-23	2019-05-07
60	Honda	some name	white	183	robot	crossover	2018-11-07	2023-06-19
61	Mercedes Benz	some name	black	113	automatic	sedan	2018-09-04	2020-11-06
62	Volvo	some name	green	516	manual	convertible	2020-08-07	2019-08-17
63	Renault	some name	brown	110	robot	wagon	2019-09-27	2020-03-20
64	Nissan	some name	blue	195	automatic	minivan	2021-09-05	2021-10-03
65	Mitsubishi	some name	red	213	manual	crossover	2019-11-02	2019-01-24
66	BMW	some name	yellow	518	robot	sedan	2019-04-12	2022-11-03
67	Kia	some name	white	514	automatic	convertible	2020-05-20	2023-12-03
68	Mazda	some name	black	213	manual	wagon	2020-08-30	2022-07-20
69	Hyundai	some name	green	251	robot	minivan	2022-05-22	2023-06-14
70	Honda	some name	brown	410	automatic	crossover	2020-07-22	2022-12-19
71	Mercedes Benz	some name	blue	224	manual	sedan	2022-01-04	2020-11-26
72	Volvo	some name	red	536	robot	convertible	2019-07-15	2018-12-16
73	Renault	some name	yellow	373	automatic	wagon	2022-10-16	2021-08-22
74	Nissan	some name	white	521	manual	minivan	2020-09-26	2019-08-24
75	Mitsubishi	some name	black	322	robot	crossover	2020-08-10	2022-06-26
76	BMW	some name	green	411	automatic	sedan	2021-07-22	2019-10-13
77	Kia	some name	brown	300	manual	convertible	2021-12-10	2022-03-19
78	Mazda	some name	blue	292	robot	wagon	2022-07-16	2019-06-30
79	Hyundai	some name	red	96	automatic	minivan	2020-02-14	2020-11-05
80	Honda	some name	yellow	428	manual	crossover	2022-06-02	2020-04-24
81	Mercedes Benz	some name	white	372	robot	sedan	2020-04-09	2021-03-11
82	Volvo	some name	black	485	automatic	convertible	2020-07-15	2020-01-17
83	Renault	some name	green	232	manual	wagon	2020-05-05	2022-09-29
84	Nissan	some name	brown	600	robot	minivan	2021-12-12	2019-04-03
85	Mitsubishi	some name	blue	201	automatic	crossover	2020-04-13	2022-04-18
86	BMW	some name	red	343	manual	sedan	2021-12-26	2018-12-06
87	Kia	some name	yellow	189	robot	convertible	2018-12-05	2019-01-26
88	Mazda	some name	white	528	automatic	wagon	2022-07-04	2023-07-16
89	Hyundai	some name	black	291	manual	minivan	2021-03-28	2022-07-15
90	Honda	some name	green	231	robot	crossover	2019-02-05	2019-04-03
91	Mercedes Benz	some name	brown	372	automatic	sedan	2022-02-11	2020-02-18
92	Volvo	some name	blue	321	manual	convertible	2020-08-20	2019-07-18
93	Renault	some name	red	465	robot	wagon	2022-05-06	2020-11-26
94	Nissan	some name	yellow	331	automatic	minivan	2021-05-16	2023-07-28
95	Mitsubishi	some name	white	112	manual	crossover	2018-10-10	2023-03-07
96	BMW	some name	black	458	robot	sedan	2019-04-12	2021-08-23
97	Kia	some name	green	108	automatic	convertible	2022-05-08	2020-11-28
98	Mazda	some name	brown	81	manual	wagon	2022-06-13	2019-12-01
99	Hyundai	some name	blue	211	robot	minivan	2020-02-01	2021-12-21
100	Honda	some name	red	369	automatic	crossover	2022-09-17	2022-05-15
\.


--
-- Data for Name: messages_for_seller; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.messages_for_seller (id, from_user_id, to_private_seller, text, created_at) FROM stdin;
1	30	87	a letter to the seller	2021-04-17
2	73	16	a letter to the seller	2022-06-11
3	49	80	a letter to the seller	2022-02-02
4	92	42	a letter to the seller	2020-02-29
5	99	58	a letter to the seller	2022-04-22
6	76	37	a letter to the seller	2020-09-23
7	95	98	a letter to the seller	2021-11-03
8	38	11	a letter to the seller	2021-10-02
9	84	8	a letter to the seller	2022-10-04
10	60	10	a letter to the seller	2022-04-22
11	8	13	a letter to the seller	2020-12-10
12	94	98	a letter to the seller	2022-07-14
13	97	26	a letter to the seller	2022-04-30
14	41	99	a letter to the seller	2022-04-10
15	93	58	a letter to the seller	2021-01-09
16	25	54	a letter to the seller	2022-09-05
17	40	29	a letter to the seller	2021-11-28
18	79	44	a letter to the seller	2020-07-17
19	28	73	a letter to the seller	2022-01-12
20	62	1	a letter to the seller	2022-05-03
21	63	86	a letter to the seller	2021-11-10
22	93	4	a letter to the seller	2021-10-03
23	2	96	a letter to the seller	2021-05-14
24	25	98	a letter to the seller	2020-08-30
25	10	5	a letter to the seller	2021-05-22
26	43	68	a letter to the seller	2022-06-20
27	20	94	a letter to the seller	2021-03-25
28	28	4	a letter to the seller	2022-03-03
29	34	31	a letter to the seller	2021-03-23
30	37	59	a letter to the seller	2021-05-22
31	12	51	a letter to the seller	2021-07-01
32	34	30	a letter to the seller	2022-10-31
33	21	9	a letter to the seller	2021-12-20
34	45	49	a letter to the seller	2021-02-20
35	14	95	a letter to the seller	2020-05-12
36	64	37	a letter to the seller	2021-06-21
37	18	12	a letter to the seller	2022-10-30
38	91	55	a letter to the seller	2020-07-16
39	81	51	a letter to the seller	2020-03-08
40	82	55	a letter to the seller	2022-03-02
41	51	41	a letter to the seller	2020-09-06
42	25	36	a letter to the seller	2022-01-08
43	76	56	a letter to the seller	2022-10-10
44	18	57	a letter to the seller	2021-08-04
45	28	44	a letter to the seller	2022-03-18
46	43	25	a letter to the seller	2021-04-25
47	87	47	a letter to the seller	2020-12-20
48	81	63	a letter to the seller	2022-11-05
49	38	46	a letter to the seller	2021-07-28
50	48	70	a letter to the seller	2021-03-08
51	85	27	a letter to the seller	2022-10-05
52	52	34	a letter to the seller	2021-04-25
53	89	83	a letter to the seller	2021-05-28
54	5	51	a letter to the seller	2020-09-08
55	95	59	a letter to the seller	2021-01-24
56	91	25	a letter to the seller	2022-11-17
57	32	78	a letter to the seller	2020-04-21
58	24	74	a letter to the seller	2021-08-30
59	12	73	a letter to the seller	2020-08-11
60	77	99	a letter to the seller	2020-05-14
61	29	100	a letter to the seller	2022-06-12
62	89	56	a letter to the seller	2022-07-04
63	98	28	a letter to the seller	2022-07-02
64	48	7	a letter to the seller	2021-12-21
65	20	10	a letter to the seller	2021-03-26
66	53	7	a letter to the seller	2022-09-05
67	91	8	a letter to the seller	2021-11-12
68	94	41	a letter to the seller	2020-11-27
69	41	33	a letter to the seller	2020-04-09
70	60	22	a letter to the seller	2022-01-22
71	11	56	a letter to the seller	2021-09-30
72	24	55	a letter to the seller	2021-08-29
73	69	39	a letter to the seller	2020-12-02
74	66	25	a letter to the seller	2021-04-08
75	21	1	a letter to the seller	2022-09-02
76	70	83	a letter to the seller	2021-05-27
77	42	42	a letter to the seller	2022-02-09
78	45	6	a letter to the seller	2022-07-08
79	55	84	a letter to the seller	2021-09-18
80	77	81	a letter to the seller	2021-04-24
81	90	22	a letter to the seller	2020-11-29
82	80	79	a letter to the seller	2020-03-24
83	76	75	a letter to the seller	2020-06-23
84	25	41	a letter to the seller	2022-11-16
85	86	38	a letter to the seller	2021-02-01
86	16	78	a letter to the seller	2021-04-15
87	54	61	a letter to the seller	2022-02-22
88	97	54	a letter to the seller	2021-08-22
89	74	6	a letter to the seller	2022-05-20
90	84	53	a letter to the seller	2021-04-23
91	19	74	a letter to the seller	2021-12-17
92	37	69	a letter to the seller	2022-06-15
93	61	84	a letter to the seller	2022-12-14
94	42	7	a letter to the seller	2022-07-20
95	26	55	a letter to the seller	2021-02-10
96	76	62	a letter to the seller	2022-10-08
97	93	55	a letter to the seller	2021-11-10
98	26	11	a letter to the seller	2022-11-14
99	32	73	a letter to the seller	2020-12-25
100	45	73	a letter to the seller	2022-05-10
\.


--
-- Data for Name: motorcycles; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.motorcycles (id, moto_brand, moto_name, moto_color, engine_power, gearbox, moto_body, year_of_issue, created_at) FROM stdin;
1	Mitsubishi	some name	blue	458	automatic	Classic	2020-07-19	2021-08-30
2	BMW	some name	red	221	manual	Sports	2021-05-24	2023-12-03
3	Honda	some name	yellow	312	robot	Superbike	2022-10-26	2020-02-06
4	Yamaha	some name	white	428	automatic	Cruiser	2021-06-06	2019-12-09
5	Ducati	some name	black	398	manual	Dragster	2019-07-04	2019-06-29
6	Dodge	some name	green	28	robot	Motard	2022-03-01	2021-09-01
7	MTT	some name	brown	22	automatic	Minibike	2021-06-12	2020-04-19
8	Suzuki	some name	blue	337	manual	Classic	2022-08-12	2023-11-14
9	Kawasaki	some name	red	227	robot	Sports	2019-01-23	2019-06-14
10	Mitsubishi	some name	yellow	168	automatic	Superbike	2019-09-09	2021-06-25
11	BMW	some name	white	61	manual	Cruiser	2021-05-28	2022-09-03
12	Honda	some name	black	451	robot	Dragster	2021-10-19	2020-10-27
13	Yamaha	some name	green	435	automatic	Motard	2021-03-10	2020-06-02
14	Ducati	some name	brown	365	manual	Minibike	2020-08-23	2023-11-29
15	Dodge	some name	blue	537	robot	Classic	2022-08-28	2019-07-28
16	MTT	some name	red	194	automatic	Sports	2020-07-16	2022-11-20
17	Suzuki	some name	yellow	179	manual	Superbike	2020-11-23	2020-12-07
18	Kawasaki	some name	white	545	robot	Cruiser	2022-10-21	2020-03-10
19	Mitsubishi	some name	black	369	automatic	Dragster	2018-09-20	2020-09-01
20	BMW	some name	green	459	manual	Motard	2022-08-05	2019-10-29
21	Honda	some name	brown	45	robot	Minibike	2020-10-03	2023-02-23
22	Yamaha	some name	blue	388	automatic	Classic	2019-07-20	2019-12-13
23	Ducati	some name	red	591	manual	Sports	2021-06-02	2021-03-13
24	Dodge	some name	yellow	528	robot	Superbike	2021-06-16	2023-11-05
25	MTT	some name	white	263	automatic	Cruiser	2019-04-14	2023-03-16
26	Suzuki	some name	black	350	manual	Dragster	2020-07-02	2018-11-07
27	Kawasaki	some name	green	538	robot	Motard	2022-09-30	2020-11-14
28	Mitsubishi	some name	brown	113	automatic	Minibike	2020-12-14	2019-12-18
29	BMW	some name	blue	520	manual	Classic	2018-11-04	2022-07-03
30	Honda	some name	red	446	robot	Sports	2020-01-21	2022-12-14
31	Yamaha	some name	yellow	62	automatic	Superbike	2020-03-20	2020-03-03
32	Ducati	some name	white	517	manual	Cruiser	2019-01-08	2019-10-12
33	Dodge	some name	black	286	robot	Dragster	2022-07-21	2022-09-01
34	MTT	some name	green	71	automatic	Motard	2021-03-30	2020-02-04
35	Suzuki	some name	brown	303	manual	Minibike	2019-12-21	2022-03-03
36	Kawasaki	some name	blue	38	robot	Classic	2021-03-21	2021-08-21
37	Mitsubishi	some name	red	107	automatic	Sports	2020-07-02	2021-04-19
38	BMW	some name	yellow	576	manual	Superbike	2021-06-07	2019-09-05
39	Honda	some name	white	149	robot	Cruiser	2021-07-13	2022-08-10
40	Yamaha	some name	black	290	automatic	Dragster	2019-10-02	2020-08-16
41	Ducati	some name	green	295	manual	Motard	2020-03-27	2019-11-29
42	Dodge	some name	brown	219	robot	Minibike	2022-08-19	2020-06-16
43	MTT	some name	blue	70	automatic	Classic	2019-10-29	2022-08-26
44	Suzuki	some name	red	568	manual	Sports	2018-11-22	2020-07-09
45	Kawasaki	some name	yellow	571	robot	Superbike	2022-02-03	2020-02-19
46	Mitsubishi	some name	white	282	automatic	Cruiser	2020-06-14	2021-08-25
47	BMW	some name	black	319	manual	Dragster	2021-12-13	2023-07-22
48	Honda	some name	green	133	robot	Motard	2021-03-03	2022-03-27
49	Yamaha	some name	brown	165	automatic	Minibike	2018-12-03	2020-12-01
50	Ducati	some name	blue	45	manual	Classic	2019-12-20	2019-05-11
51	Dodge	some name	red	261	robot	Sports	2021-07-22	2023-05-17
52	MTT	some name	yellow	246	automatic	Superbike	2021-12-14	2023-01-27
53	Suzuki	some name	white	175	manual	Cruiser	2021-07-02	2021-02-22
54	Kawasaki	some name	black	199	robot	Dragster	2021-09-08	2020-09-28
55	Mitsubishi	some name	green	568	automatic	Motard	2018-09-18	2019-12-09
56	BMW	some name	brown	68	manual	Minibike	2019-04-02	2022-02-12
57	Honda	some name	blue	413	robot	Classic	2020-02-09	2020-01-02
58	Yamaha	some name	red	199	automatic	Sports	2019-11-28	2022-08-25
59	Ducati	some name	yellow	309	manual	Superbike	2020-12-19	2022-12-29
60	Dodge	some name	white	342	robot	Cruiser	2020-03-03	2021-09-20
61	MTT	some name	black	516	automatic	Dragster	2021-04-20	2021-01-14
62	Suzuki	some name	green	139	manual	Motard	2021-02-13	2019-04-17
63	Kawasaki	some name	brown	454	robot	Minibike	2021-06-02	2020-12-19
64	Mitsubishi	some name	blue	57	automatic	Classic	2022-06-10	2022-01-22
65	BMW	some name	red	51	manual	Sports	2021-09-23	2020-01-12
66	Honda	some name	yellow	509	robot	Superbike	2019-03-16	2018-12-04
67	Yamaha	some name	white	195	automatic	Cruiser	2021-08-26	2019-10-07
68	Ducati	some name	black	480	manual	Dragster	2020-01-03	2022-03-04
69	Dodge	some name	green	580	robot	Motard	2021-04-13	2022-10-06
70	MTT	some name	brown	470	automatic	Minibike	2021-01-30	2019-10-13
71	Suzuki	some name	blue	102	manual	Classic	2020-01-30	2023-08-11
72	Kawasaki	some name	red	199	robot	Sports	2021-08-08	2020-01-18
73	Mitsubishi	some name	yellow	89	automatic	Superbike	2022-12-29	2020-10-20
74	BMW	some name	white	153	manual	Cruiser	2022-08-25	2021-12-12
75	Honda	some name	black	576	robot	Dragster	2020-10-07	2020-10-24
76	Yamaha	some name	green	91	automatic	Motard	2022-09-18	2022-06-05
77	Ducati	some name	brown	349	manual	Minibike	2019-02-07	2023-11-28
78	Dodge	some name	blue	157	robot	Classic	2021-05-10	2023-11-12
79	MTT	some name	red	60	automatic	Sports	2020-05-04	2023-12-30
80	Suzuki	some name	yellow	598	manual	Superbike	2018-09-06	2020-07-14
81	Kawasaki	some name	white	322	robot	Cruiser	2020-02-20	2019-09-16
82	Mitsubishi	some name	black	267	automatic	Dragster	2020-11-18	2020-09-09
83	BMW	some name	green	419	manual	Motard	2020-09-03	2019-05-30
84	Honda	some name	brown	283	robot	Minibike	2020-08-16	2018-11-20
85	Yamaha	some name	blue	382	automatic	Classic	2019-09-04	2021-12-23
86	Ducati	some name	red	190	manual	Sports	2021-08-27	2020-03-31
87	Dodge	some name	yellow	231	robot	Superbike	2022-03-13	2021-08-07
88	MTT	some name	white	33	automatic	Cruiser	2019-05-03	2020-07-17
89	Suzuki	some name	black	372	manual	Dragster	2021-05-08	2022-03-19
90	Kawasaki	some name	green	173	robot	Motard	2021-12-16	2020-10-07
91	Mitsubishi	some name	brown	363	automatic	Minibike	2019-10-09	2020-09-08
92	BMW	some name	blue	269	manual	Classic	2019-01-22	2021-10-18
93	Honda	some name	red	380	robot	Sports	2019-06-13	2022-04-13
94	Yamaha	some name	yellow	217	automatic	Superbike	2021-10-24	2021-07-31
95	Ducati	some name	white	479	manual	Cruiser	2019-03-20	2020-01-18
96	Dodge	some name	black	429	robot	Dragster	2020-11-01	2021-10-29
97	MTT	some name	green	443	automatic	Motard	2022-03-12	2022-12-03
98	Suzuki	some name	brown	112	manual	Minibike	2019-10-23	2023-05-06
99	Kawasaki	some name	blue	537	robot	Classic	2021-04-02	2020-10-15
100	Mitsubishi	some name	red	402	automatic	Sports	2018-12-26	2019-12-02
\.


--
-- Data for Name: private_seller; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.private_seller (id, id_user, id_light_vehicles, id_freight_vehicles, id_motorcycles, description, status, photo_id, video_id, price, created_at) FROM stdin;
1	43	39	\N	\N	sell a vehicle	for sale	49	96	2476125	2021-12-31
2	34	\N	\N	93	sell a vehicle	sales	62	24	6849973	2021-12-31
3	19	26	\N	\N	sell a vehicle	for sale	99	96	988467	2021-12-31
4	36	\N	\N	80	sell a vehicle	sales	33	61	7366651	2021-12-31
5	93	87	\N	\N	sell a vehicle	for sale	5	60	967986	2021-12-31
6	10	41	\N	\N	sell a vehicle	sales	48	44	2128018	2021-12-31
7	67	\N	\N	37	sell a vehicle	for sale	64	33	3292410	2021-12-31
8	10	\N	\N	60	sell a vehicle	sales	100	36	2894207	2021-12-31
9	3	12	\N	\N	sell a vehicle	for sale	72	17	8283245	2021-12-31
10	81	\N	\N	43	sell a vehicle	sales	68	90	7387039	2021-12-31
11	52	\N	\N	90	sell a vehicle	for sale	25	85	7727046	2021-12-31
12	77	35	\N	\N	sell a vehicle	sales	60	92	6699689	2021-12-31
13	35	\N	\N	59	sell a vehicle	for sale	98	66	4945633	2021-12-31
14	75	\N	\N	2	sell a vehicle	sales	74	88	2055801	2021-12-31
15	46	42	\N	\N	sell a vehicle	for sale	9	69	8784403	2021-12-31
16	17	61	\N	\N	sell a vehicle	sales	77	79	2037946	2021-12-31
17	5	\N	\N	65	sell a vehicle	for sale	82	59	1154884	2021-12-31
18	2	75	\N	\N	sell a vehicle	sales	16	35	6764322	2021-12-31
19	94	27	\N	\N	sell a vehicle	for sale	59	11	3300174	2021-12-31
20	17	\N	\N	73	sell a vehicle	sales	47	44	7825049	2021-12-31
21	91	88	\N	\N	sell a vehicle	for sale	71	37	453225	2021-12-31
22	43	\N	\N	48	sell a vehicle	sales	8	75	7896780	2021-12-31
23	2	37	67	23	sell a vehicle	for sale	76	95	2921297	2021-12-31
24	49	\N	\N	9	sell a vehicle	sales	63	94	6317184	2021-12-31
25	33	\N	\N	100	sell a vehicle	for sale	50	76	3979191	2021-12-31
26	6	\N	\N	10	sell a vehicle	sales	63	54	881270	2021-12-31
27	49	\N	\N	20	sell a vehicle	for sale	15	61	342743	2021-12-31
28	88	\N	\N	10	sell a vehicle	sales	34	56	5061646	2021-12-31
29	17	35	\N	\N	sell a vehicle	for sale	86	43	8104014	2021-12-31
30	94	99	\N	\N	sell a vehicle	sales	70	71	9395022	2021-12-31
31	90	\N	\N	70	sell a vehicle	for sale	20	32	648073	2021-12-31
32	98	\N	\N	99	sell a vehicle	sales	48	43	8628451	2021-12-31
33	4	56	\N	\N	sell a vehicle	for sale	11	36	7310311	2021-12-31
34	38	28	\N	\N	sell a vehicle	sales	17	52	1164609	2021-12-31
35	84	\N	\N	21	sell a vehicle	for sale	74	10	6860475	2021-12-31
36	62	63	91	67	sell a vehicle	sales	29	74	7954494	2021-12-31
37	18	\N	\N	65	sell a vehicle	for sale	4	32	9090717	2021-12-31
38	89	\N	\N	50	sell a vehicle	sales	23	50	5680679	2021-12-31
39	50	\N	\N	17	sell a vehicle	for sale	39	13	3651534	2021-12-31
40	48	71	\N	\N	sell a vehicle	sales	34	66	7385181	2021-12-31
41	36	14	\N	\N	sell a vehicle	for sale	56	23	988107	2021-12-31
42	24	12	\N	\N	sell a vehicle	sales	48	49	8780983	2021-12-31
43	42	\N	\N	99	sell a vehicle	for sale	77	19	4567621	2021-12-31
44	27	\N	48	\N	sell a vehicle	sales	52	5	8316641	2021-12-31
45	59	\N	7	\N	sell a vehicle	for sale	91	82	9234903	2021-12-31
46	54	49	\N	\N	sell a vehicle	sales	80	11	7458494	2021-12-31
47	64	\N	38	\N	sell a vehicle	for sale	17	78	4146832	2021-12-31
48	24	\N	\N	45	sell a vehicle	sales	44	51	9929750	2021-12-31
49	3	55	\N	\N	sell a vehicle	for sale	67	13	5459488	2021-12-31
50	53	81	\N	\N	sell a vehicle	sales	19	90	4009046	2021-12-31
51	44	48	\N	\N	sell a vehicle	for sale	65	79	2788049	2021-12-31
52	8	87	\N	\N	sell a vehicle	sales	73	67	9613505	2021-12-31
53	90	\N	\N	22	sell a vehicle	for sale	83	28	6008297	2021-12-31
54	44	\N	100	\N	sell a vehicle	sales	18	5	8153068	2021-12-31
55	49	\N	\N	67	sell a vehicle	for sale	60	16	510506	2021-12-31
56	80	67	\N	\N	sell a vehicle	sales	1	61	4109939	2021-12-31
57	90	62	\N	\N	sell a vehicle	for sale	30	100	3719101	2021-12-31
58	24	\N	82	\N	sell a vehicle	sales	31	60	6499369	2021-12-31
59	38	63	\N	\N	sell a vehicle	for sale	74	66	5333137	2021-12-31
60	87	\N	13	\N	sell a vehicle	sales	3	29	2067790	2021-12-31
61	50	\N	\N	9	sell a vehicle	for sale	61	5	4072177	2021-12-31
62	80	\N	\N	35	sell a vehicle	sales	91	17	9684145	2021-12-31
63	98	\N	\N	76	sell a vehicle	for sale	92	20	655357	2021-12-31
64	78	34	\N	\N	sell a vehicle	sales	26	73	3471073	2021-12-31
65	10	\N	5	\N	sell a vehicle	for sale	45	51	6595372	2021-12-31
66	99	34	\N	\N	sell a vehicle	sales	25	78	8936061	2021-12-31
67	87	\N	44	\N	sell a vehicle	for sale	75	67	3122516	2021-12-31
68	74	\N	17	\N	sell a vehicle	sales	17	98	6332944	2021-12-31
69	28	\N	88	\N	sell a vehicle	for sale	22	55	8339906	2021-12-31
70	65	\N	\N	80	sell a vehicle	sales	10	26	2235769	2021-12-31
71	4	\N	91	\N	sell a vehicle	for sale	9	87	9118432	2021-12-31
72	21	40	\N	\N	sell a vehicle	sales	12	77	6564472	2021-12-31
73	12	\N	2	\N	sell a vehicle	for sale	68	26	6228160	2021-12-31
74	9	\N	\N	23	sell a vehicle	sales	5	57	5614395	2021-12-31
75	72	32	\N	\N	sell a vehicle	for sale	13	43	2731980	2021-12-31
76	48	6	\N	\N	sell a vehicle	sales	11	44	2606264	2021-12-31
77	62	\N	80	\N	sell a vehicle	for sale	93	71	7563639	2021-12-31
78	34	\N	\N	27	sell a vehicle	sales	83	81	2020167	2021-12-31
79	41	\N	\N	57	sell a vehicle	for sale	95	58	3039205	2021-12-31
80	37	\N	51	\N	sell a vehicle	sales	8	49	7526371	2021-12-31
81	22	\N	16	\N	sell a vehicle	for sale	16	98	8962137	2021-12-31
82	45	\N	\N	61	sell a vehicle	sales	5	23	5573014	2021-12-31
83	85	\N	\N	25	sell a vehicle	for sale	60	30	1056853	2021-12-31
84	74	42	\N	\N	sell a vehicle	sales	70	82	7034316	2021-12-31
85	14	68	\N	\N	sell a vehicle	for sale	95	67	6624754	2021-12-31
86	89	18	\N	\N	sell a vehicle	sales	44	23	8170420	2021-12-31
87	55	\N	90	\N	sell a vehicle	for sale	13	12	6522002	2021-12-31
88	8	\N	\N	96	sell a vehicle	sales	48	18	701408	2021-12-31
89	42	\N	\N	79	sell a vehicle	for sale	47	63	4021898	2021-12-31
90	96	\N	12	\N	sell a vehicle	sales	70	17	3449951	2021-12-31
91	75	\N	72	\N	sell a vehicle	for sale	59	4	1541484	2021-12-31
92	17	64	\N	\N	sell a vehicle	sales	80	61	4310632	2021-12-31
93	53	61	\N	\N	sell a vehicle	for sale	91	8	6147413	2021-12-31
94	51	92	\N	\N	sell a vehicle	sales	50	24	3365841	2021-12-31
95	11	\N	\N	65	sell a vehicle	for sale	93	58	4545503	2021-12-31
96	43	50	\N	\N	sell a vehicle	sales	60	53	3803219	2021-12-31
97	10	58	\N	\N	sell a vehicle	for sale	52	48	7356625	2021-12-31
98	2	\N	29	\N	sell a vehicle	sales	65	11	9119241	2021-12-31
99	84	\N	91	\N	sell a vehicle	for sale	86	41	267010	2021-12-31
100	73	35	\N	\N	sell a vehicle	sales	59	35	8913613	2021-12-31
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.profiles (id_user, first_name, last_name, email, phone, driving_experience, personal_information, main_foto_id, created_at) FROM stdin;
1	Jermaine	Gordon	j-gordon7727@yahoo.zg	126-4238	50	magna. Sed eu eros.	1	2023-05-31
2	Yoshi	Everett	yoshieverett@protonmail.zg	1-729-315-8147	51	odio semper cursus. Integer mollis. Integer tincidunt	2	2023-08-08
3	Evan	Stevenson	stevensonevan@hotmail.com	1-875-371-1846	47	facilisis	3	2023-03-07
4	Perry	Lara	lara_perry4280@yahoo.couk	1-489-478-9517	47	Ut nec urna et arcu imperdiet ullamcorper.	4	2020-08-06
5	Judah	Herring	herring_judah5251@mail.ca	471-2642	50	nostra, per inceptos hymenaeos. Mauris ut	5	2022-10-14
6	Avye	Warner	warner.avye@yandex.ca	1-338-464-2475	33	arcu	6	2021-09-17
7	Reese	Haynes	rhaynes@hotmail.edu	448-4361	11	sollicitudin adipiscing ligula.	7	2020-07-24
8	Dawn	Finley	dfinley3194@hotmail.eu	1-886-941-8676	8	at, libero. Morbi accumsan laoreet	8	2022-05-13
9	Kiayada	Williamson	k-williamson1133@google.zg	265-1133	52	non arcu. Vivamus sit	9	2023-03-18
10	Zena	Mckenzie	m.zena7111@aol.ru	1-744-537-1514	55	quis diam luctus lobortis. Class	10	2023-07-12
11	Cedric	Walton	w_cedric@mail.ru	942-2020	16	Aenean sed pede nec ante blandit viverra. Donec tempus,	11	2023-09-04
12	Angela	Noel	n_angela@yandex.zg	958-4342	57	sagittis	12	2022-12-25
13	Ferris	Kennedy	fkennedy2232@google.ca	1-558-881-2115	8	pede. Nunc sed orci lobortis augue scelerisque	13	2022-08-27
14	August	Mcgowan	a-mcgowan7879@icloud.com	330-8836	19	rutrum. Fusce dolor quam, elementum at, egestas	14	2023-01-21
15	Carlos	Pickett	carlos_pickett@yahoo.ru	334-9696	1	nascetur ridiculus mus. Proin vel arcu eu odio tristique	15	2021-11-21
16	Kimberley	Brennan	kimberley_brennan@yandex.ru	960-7858	9	purus. Nullam	16	2022-06-24
17	Flavia	Hall	hall.flavia@protonmail.couk	1-234-861-8844	6	at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum	17	2022-10-21
18	Xyla	Livingston	livingstonxyla@yahoo.zg	1-632-277-1570	26	dapibus gravida. Aliquam tincidunt, nunc	18	2023-06-16
19	Drew	Moody	drewmoody7856@aol.edu	1-579-344-2934	23	quis	19	2020-04-09
20	Hollee	Ortiz	hortiz3085@protonmail.zg	1-656-566-6132	38	rhoncus. Donec est. Nunc ullamcorper, velit	20	2022-02-26
21	Stone	Nunez	n.stone@mail.eu	757-4160	33	erat. Vivamus nisi. Mauris nulla. Integer	21	2023-03-18
22	Jermaine	Dillon	dillonjermaine@hotmail.org	173-8588	24	tempus risus. Donec egestas. Duis	22	2021-04-11
23	Kay	Valentine	valentinekay7833@google.com	1-653-134-0424	50	felis eget	23	2020-12-28
24	Nyssa	Mccarty	n-mccarty5583@yahoo.couk	1-605-203-9774	7	est,	24	2022-06-05
25	Veda	Raymond	rveda4244@outlook.net	1-747-529-7165	42	diam.	25	2022-02-06
26	Ishmael	Case	case-ishmael7633@protonmail.ca	1-289-657-4575	39	vitae erat vel pede blandit congue.	26	2020-05-08
27	Rudyard	Savage	r_savage@yahoo.edu	232-1248	60	nunc sed libero. Proin	27	2023-02-19
28	Kirk	Mayo	mayo_kirk@mail.ru	174-5267	40	at pretium aliquet, metus	28	2023-05-03
29	Anthony	Carr	anthony-carr@icloud.net	185-5204	15	eleifend vitae, erat. Vivamus nisi. Mauris nulla.	29	2021-08-15
30	Kerry	Parks	kerry.parks8281@mail.couk	1-827-715-5262	8	porttitor interdum. Sed auctor odio a	30	2020-02-24
31	Camilla	Porter	c.porter1710@aol.eu	1-727-191-8677	25	nec, mollis vitae, posuere at,	31	2020-08-21
32	Erasmus	Sanford	sanforderasmus@mail.org	544-0528	4	ornare. Fusce mollis. Duis sit amet diam eu dolor	32	2020-01-26
33	Castor	Hurst	hurst_castor9896@aol.zg	1-620-498-5242	47	pede nec ante blandit viverra. Donec tempus, lorem fringilla	33	2020-08-05
34	Kylynn	Walsh	kylynn.walsh@hotmail.couk	1-687-425-7742	55	sit amet nulla. Donec non justo. Proin	34	2020-06-29
35	Shay	Christensen	christensen-shay@hotmail.net	445-1739	32	lorem vitae odio sagittis semper. Nam	35	2021-12-19
36	Tara	Harvey	harvey_tara@outlook.edu	1-536-520-8643	49	primis in faucibus orci luctus et ultrices posuere cubilia	36	2020-06-08
37	Frances	Bullock	bullockfrances8654@hotmail.ru	458-5747	58	nibh. Donec est mauris, rhoncus id, mollis nec, cursus a,	37	2023-07-31
38	Sandra	Russell	russell.sandra6416@google.eu	1-334-764-3488	14	Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla	38	2022-09-19
39	Zenia	Reilly	zreilly@google.edu	1-670-314-8618	13	quis	39	2022-09-25
40	Maile	Walsh	m-walsh@outlook.net	1-369-361-2778	45	pretium neque.	40	2022-06-23
41	Michael	Rogers	rogers-michael3141@outlook.eu	701-1722	24	felis. Nulla tempor augue ac	41	2020-12-09
42	Lee	Lindsay	l_lindsay@yandex.couk	375-7134	18	enim. Curabitur massa. Vestibulum accumsan neque et	42	2022-05-18
43	Melissa	O'connor	m_oconnor@mail.ru	910-6823	30	pretium et, rutrum non,	43	2020-11-14
44	Sheila	Schneider	schneider-sheila@aol.com	995-4434	55	magna. Phasellus dolor	44	2023-07-18
45	Ariana	Holmes	holmes-ariana@protonmail.net	102-8964	4	ridiculus mus.	45	2020-05-05
46	Hayfa	Wright	wrighthayfa@aol.edu	1-131-239-1777	59	arcu. Nunc mauris. Morbi non sapien molestie	46	2022-08-15
47	Eliana	Powers	elianapowers9836@mail.zg	447-6653	34	erat, eget	47	2023-02-22
48	Cara	Manning	manningcara@yahoo.org	492-6683	42	lobortis quis, pede. Suspendisse dui. Fusce diam	48	2020-01-19
49	Cherokee	Strickland	c-strickland408@google.edu	1-849-876-1843	48	placerat, orci lacus vestibulum	49	2021-06-10
50	Graham	Whitaker	g.whitaker2225@mail.edu	516-6874	15	nisi. Cum sociis natoque penatibus et	50	2023-10-03
51	Kenyon	Coffey	ckenyon@outlook.com	263-8145	53	sociis natoque	51	2023-10-13
52	Hayden	Richardson	richardson-hayden2221@aol.org	1-368-537-6118	56	Phasellus fermentum convallis ligula. Donec luctus aliquet	52	2022-01-06
53	Bianca	Key	biancakey4890@icloud.edu	1-674-502-8694	38	Aliquam vulputate ullamcorper magna.	53	2021-11-01
54	Berk	Wells	w_berk@google.zg	1-375-871-5332	7	tempus	54	2020-12-06
55	Lucius	Curtis	curtis_lucius@yandex.ca	832-7778	55	quis, pede. Praesent eu dui. Cum sociis natoque	55	2021-02-14
56	Jeanette	Glover	glover.jeanette@google.ca	703-8252	59	fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc	56	2023-07-23
57	Mannix	Ray	m.ray9047@mail.org	770-8658	39	mollis dui, in sodales elit	57	2020-02-25
58	Judith	Dale	judithdale6243@outlook.net	1-636-453-4760	17	ante dictum	58	2020-03-07
59	Boris	Jacobs	j_boris@yandex.com	1-244-598-0161	57	leo.	59	2021-10-19
60	Herrod	Finley	f.herrod@aol.org	1-748-389-0554	4	ultrices sit amet,	60	2022-10-05
61	Maggy	Valencia	valencia_maggy@icloud.couk	1-186-382-7053	11	odio tristique pharetra. Quisque ac libero nec	61	2020-07-01
62	Kimberley	Foreman	foreman-kimberley6075@protonmail.eu	257-6503	45	dui. Cum sociis	62	2022-08-18
63	Gage	Pollard	pollard-gage1208@icloud.couk	1-446-874-9506	14	gravida sagittis. Duis gravida.	63	2020-01-27
64	Colton	Jenkins	c_jenkins229@icloud.eu	565-1856	53	mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean	64	2023-09-28
65	Jennifer	Beard	j.beard@aol.ru	421-5149	49	interdum ligula	65	2022-11-18
66	Ocean	Washington	o-washington8130@google.com	1-333-142-3769	16	molestie dapibus ligula. Aliquam erat	66	2023-04-25
67	Amal	Ramirez	ramirez-amal6532@mail.org	994-8734	8	luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie.	67	2020-04-20
68	Alvin	Franks	a.franks@hotmail.zg	1-248-535-7379	30	mauris erat eget ipsum. Suspendisse	68	2022-04-13
69	Mufutau	Livingston	l_mufutau@hotmail.zg	162-6538	60	ut, pellentesque eget, dictum placerat, augue. Sed	69	2021-10-31
70	Melyssa	West	mwest@mail.zg	226-6747	48	libero lacus, varius et, euismod	70	2022-03-14
71	Merritt	Warren	warrenmerritt@outlook.zg	870-3352	8	varius orci, in	71	2021-03-23
72	Rigel	Conway	rconway4340@icloud.ru	588-2543	14	Sed pharetra,	72	2023-03-07
73	Robert	Haley	hrobert5534@icloud.com	723-0552	20	viverra. Maecenas	73	2020-01-22
74	Kaye	Dyer	k.dyer@yahoo.couk	582-5349	18	bibendum fermentum metus. Aenean	74	2022-03-25
75	Axel	Cain	c.axel556@hotmail.ru	726-8932	38	ipsum dolor sit amet,	75	2022-11-26
76	Robert	Campos	r.campos1920@hotmail.zg	428-6274	12	convallis est, vitae sodales nisi magna sed dui. Fusce aliquam,	76	2023-04-20
77	Aiko	Macias	a.macias4887@outlook.eu	1-911-449-0534	25	mi lorem, vehicula et, rutrum eu, ultrices sit	77	2021-08-14
78	Hasad	Holmes	holmeshasad@hotmail.edu	235-3705	49	pede et	78	2020-09-29
79	Graiden	Johnston	graiden.johnston4174@yahoo.com	964-7692	14	a, arcu. Sed et libero. Proin mi.	79	2020-01-18
80	Guinevere	Prince	prince.guinevere6480@google.ru	676-1162	10	gravida mauris ut mi. Duis risus	80	2020-05-31
81	Halla	Sweeney	h-sweeney204@protonmail.zg	1-855-321-2020	29	Nam ac nulla. In	81	2022-07-28
82	Tasha	Franks	tasha.franks@aol.org	1-479-456-1614	38	Morbi	82	2020-08-20
83	Baker	French	french-baker5869@google.net	764-6378	14	elementum,	83	2021-05-17
84	Audra	Hays	audrahays8963@aol.org	1-218-370-3313	46	auctor vitae, aliquet nec,	84	2020-08-18
85	Kai	Ewing	k.ewing5703@protonmail.com	1-935-902-6864	28	mi lacinia mattis. Integer eu lacus. Quisque imperdiet,	85	2023-12-03
86	Whoopi	Dotson	w_dotson3704@yahoo.eu	216-3623	39	Nullam velit	86	2023-01-16
87	Shad	Parsons	shad_parsons@icloud.org	895-9657	14	scelerisque scelerisque dui.	87	2021-10-20
88	Leilani	Preston	p-leilani@outlook.com	691-1373	36	Cras	88	2022-04-08
89	Ian	Baird	i.baird@yahoo.org	725-4506	17	mauris sagittis placerat. Cras dictum	89	2021-11-10
90	Sebastian	Holloway	sebastian_holloway@outlook.ca	964-5381	21	Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue	90	2020-07-14
91	Ryan	Collins	collins-ryan@outlook.ca	1-444-182-3133	10	ultricies adipiscing,	91	2021-09-17
92	Winter	Leon	w.leon@yandex.ru	235-6422	56	quis turpis	92	2023-10-29
93	Walker	Dyer	dyer-walker@yandex.edu	616-3276	41	tristique pellentesque,	93	2023-09-21
94	Gannon	Mcclain	m-gannon2233@yahoo.zg	202-3749	24	facilisi. Sed neque. Sed eget lacus. Mauris non dui	94	2022-08-23
95	Kiayada	Harrell	h_kiayada@mail.com	1-245-328-1657	23	sed dolor. Fusce mi lorem, vehicula et, rutrum eu,	95	2022-10-14
96	Declan	Peters	p_declan9985@aol.net	1-878-252-7427	12	sed dolor. Fusce mi lorem, vehicula	96	2020-03-13
97	Hiroko	Rodriquez	rodriquezhiroko4721@mail.couk	715-1441	52	Proin nisl sem, consequat nec, mollis vitae, posuere	97	2021-07-27
98	Ferris	Blevins	f.blevins@google.org	1-763-283-7266	15	Aenean egestas hendrerit neque.	98	2020-12-06
99	Scarlet	Medina	smedina@yahoo.couk	625-2232	45	parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor.	99	2020-11-21
100	Serena	Avila	s-avila@icloud.ca	988-5771	41	auctor, velit eget laoreet posuere, enim nisl	100	2020-03-05
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users (id, login, password, created_at) FROM stdin;
1	Rhonarwe	ante123	2020-09-05
2	Alfonsowefd	dig124nissim	2022-05-31
3	Tatyandea	A456enean	2023-06-27
4	Sylwedfvia	lig11ula	2021-03-22
5	Clemefdfgntine	purr23rfggus23sf	2020-05-12
6	Aimdfseee	di23rdfi8gew23rdfews	2020-10-31
7	Conwedstance	v223ulpu67jjtate	2020-01-16
8	Errefin	ele45men566wertum	2022-06-21
9	Eric	hendsfdrerit	2022-12-19
10	Gredfsdtchen	tinb34nghcidunt34	2023-07-16
11	Rfdralph	pul34ttfvf54ginar	2020-01-15
12	Tasfdhya	lo34bvbnv34torti5s	2022-12-12
13	Otfdeo	te34gfmvn34gfpor	2023-07-30
14	Shdgfaron	mvb53n4g5bvagna34d	2021-02-04
15	Basdfgil	fdghh6PravnbResent	2021-01-24
16	Dradfbcdke	p34fgladfFce34drat	2022-08-15
17	Raxcvja	gg3Suspedgrn34disse	2022-08-17
18	Mervxritt	sagk34gfjuiittis	2022-09-10
19	Derfcvrek	tytf34tgbftrfa	2020-02-09
20	Zaswewchery	redf34ggrg45ferut	2023-08-17
21	Nigefdfel	sceld34fvderisque34t	2022-07-03
22	Deasdnna	b3445laer4534ndit	2021-04-11
23	Darsfius	no34ntrdgfg534f34fd	2021-11-20
24	TasdShya	penfa3ergfgv53tibus	2022-03-23
25	Marsdfshall	d34tgfapert434ibus	2021-02-01
26	Kyrsdfsa	nequgfde35terd345	2020-04-07
27	Lasdfvcura	quidfgdf53sredfyty65	2022-08-28
28	Xefgrnos	codfg34nseq34gfuat	2020-12-04
29	Winkloiter	e43gfdu6gefdgdfgdr5456t	2022-02-08
30	Hilel	tin3df5dgcdgdfr34idunt	2022-05-02
31	Latyukyiifah	adfbnuiuojh12cyhrd	2023-01-23
32	Sahjymuel	ee3424fd4767svsgrvt	2023-07-25
33	Julyjkian	ureff35tfltricesxvryh	2020-06-30
34	Dyukahlia	tem789hfg443pusvxgyr	2023-05-04
35	Hoyuk8p	faciwe234rwflisiwefs	2022-02-17
36	Armayufnd	nwfefcon4545fg45efg	2022-09-04
37	Catytjmeron	vcxhtePhasgr5ellus	2023-02-07
38	Kashgjeem	qugdg45g64g4543is	2023-09-30
39	Katjdsper	eui3ty565hr45smod	2020-01-09
40	Bedhgfatrice	vsffsdI343trg54534tn	2023-10-16
41	Odetrthte	dswefInte345fdge455r	2020-09-28
42	Lert6o	Mae3435fdgcenas	2022-04-27
43	Kirhfgrestin	uwerge4564gdfg65645ergct	2023-04-23
44	Gjfgraham	eros3434fg434trwefsd	2020-02-03
45	Sajgh6ndra	sc345gf45elerisque	2021-05-29
46	Rfghashad	amdg54fdg645et	2021-04-08
47	Cljfhfinton	acc3434gf434gumsan	2021-10-08
48	Pahrhfgmela	sod34t3gfales	2020-01-03
49	Nefghll	vel34gfd34git	2022-01-16
50	Rifgha	hendrg354fderitregegr	2021-05-15
51	Myjfgles	ip3453fdg53sum434	2022-08-12
52	Imjfgelda	vu34t545lputate	2022-03-03
53	Ulysjfses	bladgfgdndit	2021-05-10
54	Safghrah	ris34fg5wef3vdfgedfus	2020-02-13
55	Edfgan	ped34gf434e34fsdw	2023-04-13
56	Mnbfona	ur343gdgdfnwefwdf32a	2020-01-05
57	Inhrtgrid	mor34t353s2bi	2020-01-24
58	Prhtreston	magfdgt7645na23fsassa	2022-04-06
59	Shajrtine	wefsdfee3434tg53fdgdt	2022-11-15
60	Asfghher	weffdsProd43gfd53in	2022-03-02
61	Magfhtia	mi34t34dfg34wew3fsd	2021-01-29
62	Gambnlvin	wedsfePr3g4gfd534oin	2021-06-23
63	Cdfrlark	sem34t3gdfgwefd53	2022-07-17
64	Gilegelian	auct34gfd34fg43or	2022-02-25
65	Desgdrgirae	Phas343rgdf334ellus	2020-07-14
66	Adebfsna	Vestibd3rdfgulum	2020-10-02
67	Rosdfgbin	eget3434sdwsdfgg5	2021-11-23
68	Syvbdglvia	se34trggsd434dwfwdf	2023-04-25
69	Amigdfr	amet34t3dsfg53fwe34f	2020-02-12
70	Tatregum	erat34dfse344ew3dfukih	2023-12-10
71	Kafgye	enimgt43gxcvere43wefdfw	2022-02-17
72	Jolene	ipsum343fds4sdf	2020-01-31
73	Unity	eu34gfd5gdfg5wfsdmho	2021-08-25
74	Georgia	turpis53gf42sdf	2022-12-24
75	Zephania	Sedf34fsdf4fsd	2022-07-25
76	Mollie	adipiscing34rdwf	2023-12-15
77	Deanna	in23ew23sdf434dfsza	2020-04-18
78	Leo	liberwerr4t5gdfbttu67o	2023-11-27
79	Ora	se35tg65y5hgh45d	2020-02-21
80	Jakeem	i34tps434u54gdf3m	2023-05-28
81	Audra	r23i3r2sus43fds	2023-06-22
82	Halla	cu23rdsf4rsus	2022-01-07
83	Porter	Aliqfseef422uam	2021-09-06
84	Bo	moll3rfdsfb87jfis	2022-05-13
85	Branden	34fdghfglectus	2021-05-17
86	Macaulay	53gdfi43fdg5tae	2022-02-25
87	Wyatt	gfdg534tfdfacilisis	2020-08-31
88	Stella	gfdgg5t5hdfuyiornare	2022-07-12
89	Upton	Iregf5n46ujhf	2021-08-25
90	Petra	turpisertfd34t	2023-04-26
91	Brock	henerdfg4drerit	2023-07-20
92	Cole	nofdg34sdf32n	2022-09-18
93	Cheyenne	anterfdg44svew	2023-10-08
94	Keith	wefdv55Alweiquam	2020-10-12
95	Gail	ardf4gerdfw4g5c	2021-06-11
96	Giacomo	e5gdfgel3sdit4wsd	2022-02-15
97	Ryan	l434dgg5acus34td	2023-05-15
98	Diana	e4sgf53ge5tdgt	2023-03-02
99	Ishmael	s34tsde54gfd3dm	2021-07-07
100	Dexter	a43fd3sc5dg55fg	2021-03-28
\.


--
-- Data for Name: users_photo; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users_photo (id, owner_id, url, description, uploaded_at, size) FROM stdin;
1	1	https://yahoo.com/group/9	of the vehicle	2020-09-18	1250.64
2	2	https://nytimes.com/en-ca	of the vehicle	2021-03-16	893.51
3	3	http://facebook.com/one	of the vehicle	2021-03-25	1159.37
4	4	http://facebook.com/en-us	photograph of the vehicle	2022-10-27	862.91
5	5	https://bbc.co.uk/sub	of the vehicle	2022-07-09	1269.51
6	6	http://walmart.com/en-ca	photograph of the vehicle	2020-05-26	1169.59
7	7	https://pinterest.com/sub	of the vehicle	2021-11-02	1131.24
8	8	https://zoom.us/en-us	of the vehicle	2020-11-04	1153.69
9	9	https://walmart.com/fr	photograph of the vehicle	2021-04-28	1322.56
10	10	http://google.com/group/9	of the vehicle	2020-11-16	967.97
11	11	http://twitter.com/en-ca	of the vehicle	2022-10-14	1144.13
12	12	http://youtube.com/site	photograph of the vehicle	2021-12-22	1313.02
13	13	http://guardian.co.uk/site	of the vehicle	2020-05-11	636.84
14	14	https://twitter.com/group/9	photograph of the vehicle	2020-02-13	691.25
15	15	https://facebook.com/group/9	of the vehicle	2022-11-02	963.35
16	16	http://bbc.co.uk/settings	photograph of the vehicle	2021-09-01	941.99
17	17	https://baidu.com/site	of the vehicle	2021-06-16	1374.09
18	18	https://naver.com/user/110	of the vehicle	2021-02-28	672.55
19	19	https://twitter.com/sub	photograph of the vehicle	2020-12-12	1457.2
20	20	http://wikipedia.org/fr	of the vehicle	2022-09-06	908
21	21	https://instagram.com/en-ca	of the vehicle	2021-01-28	934.17
22	22	http://naver.com/fr	photograph of the vehicle	2020-09-15	708.39
23	23	https://pinterest.com/group/9	photograph of the vehicle	2022-05-30	979.36
24	24	http://netflix.com/one	of the vehicle	2022-06-23	1440.5
25	25	https://zoom.us/en-ca	of the vehicle	2020-08-26	1107.13
26	26	https://guardian.co.uk/user/110	photograph of the vehicle	2021-12-03	995.8
27	27	https://twitter.com/site	photograph of the vehicle	2022-11-06	1093.53
28	28	https://nytimes.com/sub/cars	of the vehicle	2021-02-24	817.64
29	29	http://google.com/sub	photograph of the vehicle	2021-11-03	952.92
30	30	https://instagram.com/one	of the vehicle	2020-01-19	1035.13
31	31	http://twitter.com/fr	photograph of the vehicle	2022-11-07	921.83
32	32	https://cnn.com/group/9	of the vehicle	2021-11-20	889.14
33	33	https://guardian.co.uk/user/110	of the vehicle	2020-01-02	976.73
34	34	https://twitter.com/group/9	of the vehicle	2021-01-09	936.12
35	35	https://naver.com/fr	of the vehicle	2022-05-01	490.85
36	36	https://whatsapp.com/user/110	photograph of the vehicle	2022-02-08	1037.7
37	37	https://youtube.com/sub	photograph of the vehicle	2021-06-15	1001
38	38	http://google.com/settings	of the vehicle	2020-05-04	1401.78
39	39	http://whatsapp.com/user/110	photograph of the vehicle	2021-02-23	928.71
40	40	http://twitter.com/user/110	photograph of the vehicle	2021-10-20	1186.53
41	41	https://guardian.co.uk/user/110	of the vehicle	2022-03-23	1077.25
42	42	https://whatsapp.com/fr	of the vehicle	2020-09-25	1238.48
43	43	https://whatsapp.com/group/9	of the vehicle	2020-03-26	1047.93
44	44	https://twitter.com/sub/cars	photograph of the vehicle	2020-01-08	737.06
45	45	http://baidu.com/user/110	of the vehicle	2021-09-22	270.33
46	46	https://ebay.com/one	photograph of the vehicle	2020-06-27	902.75
47	47	http://naver.com/en-us	photograph of the vehicle	2022-10-01	680.44
48	48	https://netflix.com/settings	photograph of the vehicle	2020-11-29	1381.55
49	49	http://ebay.com/sub	of the vehicle	2022-01-09	1052.98
50	50	http://youtube.com/settings	photograph of the vehicle	2021-03-11	755.9
51	51	https://instagram.com/sub	photograph of the vehicle	2022-10-07	643.88
52	52	http://wikipedia.org/one	photograph of the vehicle	2021-01-16	1180.14
53	53	http://instagram.com/sub	of the vehicle	2022-08-31	748.46
54	54	https://instagram.com/en-us	photograph of the vehicle	2020-09-11	955.02
55	55	https://baidu.com/sub/cars	of the vehicle	2021-07-18	785.83
56	56	https://youtube.com/sub	photograph of the vehicle	2020-09-30	1094
57	57	http://nytimes.com/en-us	photograph of the vehicle	2021-11-11	828.2
58	58	https://bbc.co.uk/one	of the vehicle	2020-08-23	1168.52
59	59	http://youtube.com/fr	photograph of the vehicle	2021-05-28	1254.22
60	60	https://pinterest.com/fr	photograph of the vehicle	2021-12-23	1338.33
61	61	http://ebay.com/sub	photograph of the vehicle	2022-11-05	683.62
62	62	http://whatsapp.com/group/9	photograph of the vehicle	2021-05-25	1023.19
63	63	http://youtube.com/sub	of the vehicle	2021-03-09	656.95
64	64	http://facebook.com/en-ca	of the vehicle	2020-12-06	1162.65
65	65	https://instagram.com/sub/cars	of the vehicle	2022-07-18	1020.8
66	66	https://netflix.com/en-ca	of the vehicle	2022-03-12	1640.98
67	67	http://zoom.us/en-us	photograph of the vehicle	2022-10-14	747.61
68	68	https://pinterest.com/user/110	photograph of the vehicle	2021-08-10	796.37
69	69	http://youtube.com/group/9	photograph of the vehicle	2021-08-20	1243.36
70	70	http://pinterest.com/en-ca	of the vehicle	2021-12-28	491.78
71	71	https://youtube.com/site	photograph of the vehicle	2020-04-26	1447.24
72	72	http://reddit.com/en-us	of the vehicle	2020-03-18	1510.95
73	73	http://bbc.co.uk/group/9	photograph of the vehicle	2022-02-26	897.15
74	74	http://zoom.us/group/9	photograph of the vehicle	2021-04-11	1167.36
75	75	https://walmart.com/sub	photograph of the vehicle	2021-10-10	766.91
76	76	http://netflix.com/one	photograph of the vehicle	2022-06-25	638.37
77	77	http://ebay.com/fr	photograph of the vehicle	2020-01-29	1115.68
78	78	https://cnn.com/one	of the vehicle	2022-10-02	796.66
79	79	https://bbc.co.uk/one	photograph of the vehicle	2020-08-13	832.42
80	80	https://reddit.com/sub	photograph of the vehicle	2021-09-28	1064.07
81	81	https://instagram.com/one	photograph of the vehicle	2020-02-01	1177.17
82	82	https://yahoo.com/settings	photograph of the vehicle	2021-06-19	1190.66
83	83	http://twitter.com/sub	photograph of the vehicle	2021-08-22	688.85
84	84	http://zoom.us/site	of the vehicle	2022-09-12	685.92
85	85	http://bbc.co.uk/sub	photograph of the vehicle	2021-12-11	1189.01
86	86	http://whatsapp.com/en-ca	photograph of the vehicle	2022-03-18	682.21
87	87	https://ebay.com/fr	photograph of the vehicle	2020-04-25	1130.74
88	88	http://instagram.com/site	of the vehicle	2022-07-02	1393.54
89	89	http://pinterest.com/sub/cars	photograph of the vehicle	2020-01-31	502.21
90	90	http://guardian.co.uk/user/110	of the vehicle	2021-07-05	977.45
91	91	https://youtube.com/settings	photograph of the vehicle	2021-02-07	910.53
92	92	http://whatsapp.com/group/9	of the vehicle	2020-03-09	1362.77
93	93	https://baidu.com/one	of the vehicle	2022-10-20	769.53
94	94	https://pinterest.com/en-ca	photograph of the vehicle	2020-09-21	1064.38
95	95	https://bbc.co.uk/group/9	of the vehicle	2020-04-15	572.96
96	96	https://yahoo.com/one	of the vehicle	2022-05-25	875.74
97	97	http://ebay.com/user/110	of the vehicle	2021-08-05	1241.1
98	98	http://walmart.com/sub/cars	photograph of the vehicle	2021-06-20	1020.77
99	99	https://walmart.com/sub	of the vehicle	2022-07-25	804.83
100	100	http://google.com/site	of the vehicle	2020-01-13	1046.77
\.


--
-- Data for Name: vehicles_photo; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.vehicles_photo (id, owner_id, url, description, uploaded_at, size) FROM stdin;
1	14	https://naver.com/one	of the vehicle	2022-07-05	1101.38
2	38	https://bbc.co.uk/en-us	of the vehicle	2021-08-05	789.11
3	19	http://baidu.com/en-ca	of the vehicle	2022-11-20	723.71
4	44	http://youtube.com/sub/cars	of the vehicle	2021-06-14	1198.45
5	83	http://zoom.us/sub/cars	photograph of the vehicle	2020-12-25	971.71
6	15	http://twitter.com/sub/cars	of the vehicle	2021-07-05	1026.97
7	1	http://baidu.com/user/110	of the vehicle	2022-01-09	691.68
8	36	http://instagram.com/en-ca	of the vehicle	2021-03-10	899.3
9	20	http://wikipedia.org/sub/cars	photograph of the vehicle	2021-03-03	1182.32
10	89	http://nytimes.com/site	photograph of the vehicle	2022-12-03	1137.82
11	93	http://facebook.com/group/9	photograph of the vehicle	2022-04-23	778.23
12	73	http://nytimes.com/site	of the vehicle	2022-06-12	1097
13	90	http://facebook.com/user/110	photograph of the vehicle	2021-12-25	1067.12
14	38	https://ebay.com/sub/cars	photograph of the vehicle	2021-04-29	1022.89
15	41	https://reddit.com/site	photograph of the vehicle	2020-11-22	1187.43
16	51	https://youtube.com/settings	photograph of the vehicle	2020-12-09	849.84
17	39	http://youtube.com/sub	of the vehicle	2021-07-24	1103.68
18	30	http://nytimes.com/site	photograph of the vehicle	2021-10-08	1054.81
19	35	https://nytimes.com/user/110	of the vehicle	2022-02-25	949.29
20	40	http://facebook.com/en-ca	photograph of the vehicle	2022-12-18	594.73
21	69	https://walmart.com/en-us	photograph of the vehicle	2022-02-13	1173.56
22	49	http://youtube.com/group/9	of the vehicle	2022-10-09	1175.9
23	36	http://reddit.com/en-us	of the vehicle	2021-08-25	1146.95
24	87	https://ebay.com/site	photograph of the vehicle	2022-09-07	490.95
25	34	https://whatsapp.com/en-us	photograph of the vehicle	2021-06-30	1365.31
26	41	http://zoom.us/settings	of the vehicle	2022-12-14	1341.04
27	89	https://instagram.com/en-us	of the vehicle	2020-07-01	1152.89
28	25	https://baidu.com/user/110	of the vehicle	2022-05-13	941.11
29	30	https://baidu.com/fr	of the vehicle	2022-06-08	772.88
30	98	http://naver.com/group/9	photograph of the vehicle	2022-03-14	1069.47
31	53	http://yahoo.com/en-ca	photograph of the vehicle	2021-12-18	1116.03
32	41	https://wikipedia.org/en-ca	photograph of the vehicle	2020-11-24	823.52
33	24	https://instagram.com/settings	of the vehicle	2022-01-31	615.12
34	40	https://twitter.com/sub	photograph of the vehicle	2020-08-27	1112.38
35	11	http://bbc.co.uk/user/110	of the vehicle	2021-06-06	1207.41
36	46	http://youtube.com/sub/cars	photograph of the vehicle	2021-08-16	1075.89
37	76	http://facebook.com/fr	photograph of the vehicle	2022-05-01	1101.33
38	30	http://instagram.com/sub/cars	photograph of the vehicle	2022-10-27	524.41
39	32	http://nytimes.com/fr	of the vehicle	2020-11-14	1380.54
40	60	https://yahoo.com/user/110	of the vehicle	2022-12-01	1039.31
41	62	http://whatsapp.com/user/110	photograph of the vehicle	2020-04-16	838.74
42	98	https://naver.com/en-ca	photograph of the vehicle	2020-05-07	1338.08
43	82	https://walmart.com/sub	photograph of the vehicle	2020-10-30	1056.46
44	73	http://reddit.com/group/9	of the vehicle	2021-12-11	1472.54
45	37	https://cnn.com/settings	photograph of the vehicle	2022-03-11	956.28
46	32	http://facebook.com/one	photograph of the vehicle	2022-10-12	770.89
47	41	https://whatsapp.com/group/9	photograph of the vehicle	2020-06-05	1330.73
48	12	https://bbc.co.uk/site	of the vehicle	2020-12-22	909.52
49	53	http://naver.com/en-ca	of the vehicle	2022-09-12	1228.05
50	57	http://whatsapp.com/sub/cars	photograph of the vehicle	2020-07-01	1272.31
51	27	https://guardian.co.uk/settings	photograph of the vehicle	2021-06-03	1064.79
52	94	https://google.com/sub	photograph of the vehicle	2020-08-01	1261.99
53	70	https://ebay.com/fr	of the vehicle	2022-07-18	558.31
54	32	https://guardian.co.uk/sub/cars	of the vehicle	2021-04-10	1185.7
55	82	https://baidu.com/group/9	photograph of the vehicle	2021-06-06	615.01
56	14	http://yahoo.com/en-us	photograph of the vehicle	2021-06-30	929.65
57	64	https://zoom.us/site	of the vehicle	2022-11-27	583.29
58	58	https://google.com/sub	photograph of the vehicle	2022-10-06	1177.01
59	22	http://zoom.us/site	of the vehicle	2020-11-03	804.8
60	36	http://youtube.com/settings	photograph of the vehicle	2021-08-19	1476.35
61	27	https://walmart.com/settings	of the vehicle	2022-03-10	1169.39
62	85	http://pinterest.com/site	of the vehicle	2020-12-12	581.12
63	55	http://reddit.com/site	photograph of the vehicle	2020-11-18	1226.26
64	25	https://nytimes.com/group/9	photograph of the vehicle	2021-09-29	1334.4
65	55	http://cnn.com/sub	of the vehicle	2022-03-17	1589.59
66	5	https://walmart.com/en-ca	of the vehicle	2021-08-11	1075.54
67	47	https://cnn.com/group/9	photograph of the vehicle	2020-12-19	971.74
68	23	https://twitter.com/user/110	of the vehicle	2022-12-16	868.88
69	16	https://instagram.com/site	photograph of the vehicle	2021-12-06	871.86
70	32	http://cnn.com/user/110	photograph of the vehicle	2022-11-05	1223.81
71	49	https://nytimes.com/fr	photograph of the vehicle	2020-08-22	764.24
72	90	https://wikipedia.org/en-ca	photograph of the vehicle	2020-06-13	870.23
73	91	https://yahoo.com/group/9	of the vehicle	2021-11-23	1011.8
74	7	http://instagram.com/user/110	of the vehicle	2021-10-18	1216.43
75	35	https://twitter.com/sub	photograph of the vehicle	2020-11-02	1395.35
76	53	http://yahoo.com/sub	of the vehicle	2020-12-17	714.29
77	65	https://yahoo.com/site	of the vehicle	2020-07-04	1138.65
78	33	http://reddit.com/group/9	of the vehicle	2021-12-25	975.57
79	72	http://instagram.com/sub/cars	of the vehicle	2021-02-13	961.16
80	4	http://facebook.com/fr	of the vehicle	2022-06-03	1055.75
81	79	http://zoom.us/site	of the vehicle	2020-01-31	933.82
82	82	https://twitter.com/sub/cars	photograph of the vehicle	2021-07-27	767.35
83	32	https://whatsapp.com/site	photograph of the vehicle	2022-05-15	1458.44
84	24	http://netflix.com/en-ca	of the vehicle	2022-12-28	644.3
85	83	https://reddit.com/en-ca	photograph of the vehicle	2020-01-17	669.82
86	64	https://baidu.com/fr	of the vehicle	2020-11-01	822.44
87	56	http://zoom.us/sub/cars	photograph of the vehicle	2022-03-05	912.48
88	79	http://youtube.com/one	of the vehicle	2021-02-26	1121.04
89	88	https://youtube.com/one	photograph of the vehicle	2022-01-12	645.72
90	50	http://ebay.com/sub	photograph of the vehicle	2020-12-25	749.33
91	82	https://walmart.com/sub	of the vehicle	2022-06-17	1114.4
92	82	http://nytimes.com/one	photograph of the vehicle	2022-07-29	1336.09
93	92	https://baidu.com/sub/cars	photograph of the vehicle	2021-09-18	1200.87
94	40	https://facebook.com/sub	photograph of the vehicle	2020-01-19	486.47
95	28	http://google.com/one	photograph of the vehicle	2022-12-10	767.41
96	68	http://facebook.com/user/110	photograph of the vehicle	2021-04-22	626.47
97	96	https://nytimes.com/user/110	of the vehicle	2021-08-09	1046.07
98	86	https://facebook.com/en-ca	of the vehicle	2021-04-13	859.02
99	13	https://ebay.com/group/9	photograph of the vehicle	2021-01-16	1126.56
100	43	http://facebook.com/group/9	of the vehicle	2022-07-04	711.21
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.video (id, owner_id, url, description, uploaded_at, size) FROM stdin;
1	89	https://guardian.co.uk/site	video	2020-03-01	980514.01
2	10	https://twitter.com/en-ca	video	2021-12-18	1042426.66
3	62	https://wikipedia.org/en-ca	video	2020-04-20	964835.2
4	17	https://nytimes.com/en-us	transport video	2022-08-03	999488.06
5	72	http://facebook.com/site	video	2020-04-19	1013140.28
6	78	https://bbc.co.uk/one	transport video	2021-07-29	984796.24
7	51	http://cnn.com/en-us	transport video	2021-01-19	994747.3
8	85	https://pinterest.com/settings	transport video	2020-03-14	991176.47
9	33	http://nytimes.com/fr	video	2022-08-28	1003262.52
10	88	http://zoom.us/en-us	transport video	2022-03-15	978190.39
11	99	https://twitter.com/one	video	2020-02-01	1028997.84
12	74	http://baidu.com/en-ca	video	2020-08-20	988368.07
13	72	http://pinterest.com/en-us	transport video	2021-05-18	938321.19
14	18	http://ebay.com/one	transport video	2020-03-28	1002588.69
15	58	https://bbc.co.uk/sub	video	2020-03-01	1030054.67
16	33	http://pinterest.com/one	transport video	2022-06-14	965994.32
17	27	http://instagram.com/fr	transport video	2021-05-06	1044253.35
18	87	https://ebay.com/fr	video	2022-07-23	984929
19	77	https://netflix.com/one	video	2022-05-04	985592.81
20	48	http://google.com/site	video	2021-08-03	995709.39
21	2	https://nytimes.com/settings	video	2022-08-29	992350.41
22	44	https://cnn.com/user/110	transport video	2021-08-23	991816.97
23	51	https://yahoo.com/site	video	2020-02-25	961146.57
24	94	https://bbc.co.uk/sub	video	2020-07-27	1005935.68
25	62	https://walmart.com/group/9	video	2022-12-07	967019.88
26	36	http://walmart.com/fr	video	2022-12-13	946775.19
27	69	https://nytimes.com/settings	video	2020-04-10	961397.25
28	43	https://guardian.co.uk/site	video	2022-10-06	1005914.65
29	81	https://twitter.com/site	video	2020-09-07	974367.66
30	57	https://google.com/settings	transport video	2021-02-17	998697.01
31	67	https://nytimes.com/site	transport video	2021-03-22	987979.36
32	54	https://cnn.com/en-ca	video	2021-10-26	1006211.15
33	95	http://nytimes.com/en-ca	video	2021-01-09	969571.5
34	45	https://google.com/en-ca	transport video	2020-03-14	986553.19
35	39	http://cnn.com/sub/cars	video	2022-10-19	971703.36
36	70	https://naver.com/site	transport video	2022-02-02	975768.02
37	74	http://youtube.com/fr	transport video	2022-02-26	1020188.33
38	69	http://ebay.com/sub/cars	transport video	2021-07-12	958680.11
39	56	http://zoom.us/one	video	2022-09-25	996221.67
40	66	http://pinterest.com/sub/cars	video	2021-11-05	1004304.06
41	88	http://zoom.us/en-us	video	2020-08-23	985019.34
42	45	http://youtube.com/one	video	2021-11-11	1021043.5
43	19	https://yahoo.com/en-us	transport video	2022-12-07	995947.22
44	24	http://wikipedia.org/group/9	transport video	2021-02-04	1029401.79
45	19	http://yahoo.com/sub	transport video	2022-11-29	1024754.83
46	33	https://youtube.com/fr	transport video	2022-07-01	970828.51
47	37	https://bbc.co.uk/sub	transport video	2021-10-11	983251.91
48	23	https://naver.com/group/9	transport video	2022-07-26	970634.92
49	6	https://reddit.com/user/110	video	2020-04-03	1019526.8
50	8	http://whatsapp.com/sub/cars	video	2022-07-01	940067.16
51	90	http://pinterest.com/user/110	video	2020-06-18	990570.33
52	93	http://whatsapp.com/group/9	video	2021-09-02	1017787.56
53	54	http://cnn.com/sub/cars	video	2022-03-14	1004092.11
54	63	https://twitter.com/group/9	video	2020-04-21	990367.22
55	20	https://reddit.com/site	video	2021-04-10	1008053.68
56	1	https://youtube.com/fr	transport video	2022-02-20	1010456.98
57	91	http://twitter.com/en-us	transport video	2020-06-27	982958.01
58	61	https://bbc.co.uk/sub/cars	transport video	2022-11-28	953733.22
59	40	https://nytimes.com/sub/cars	video	2021-06-12	986770.23
60	76	http://guardian.co.uk/fr	video	2020-07-16	1007589.3
61	5	https://reddit.com/sub	video	2022-03-12	1003111.41
62	73	https://reddit.com/settings	transport video	2022-03-10	1055624.06
63	16	http://walmart.com/sub	video	2020-05-08	964736.02
64	31	https://netflix.com/group/9	video	2022-01-16	1004527.09
65	72	http://yahoo.com/sub	video	2022-12-10	987591.6
66	5	http://pinterest.com/settings	video	2021-04-21	1036111.39
67	75	https://cnn.com/user/110	transport video	2021-08-26	1001485.88
68	85	http://google.com/group/9	video	2022-09-10	1013166.84
69	5	https://baidu.com/one	video	2020-10-08	969477.39
70	6	http://walmart.com/sub	video	2020-01-26	1002653.92
71	28	https://youtube.com/one	transport video	2020-02-08	965673.49
72	2	https://instagram.com/en-us	transport video	2020-12-09	945361.61
73	84	https://google.com/sub/cars	video	2020-08-27	1022339.97
74	93	https://instagram.com/sub	transport video	2020-04-06	1003052.47
75	93	http://ebay.com/site	video	2020-03-26	1017096.79
76	56	https://reddit.com/sub	video	2022-11-06	991593.33
77	45	https://twitter.com/user/110	video	2021-04-21	972255.94
78	54	http://google.com/sub	video	2022-03-11	954604.38
79	3	http://walmart.com/en-ca	video	2020-07-14	1018279.51
80	70	http://bbc.co.uk/one	video	2022-01-23	1003693.69
81	92	https://reddit.com/group/9	video	2022-04-22	1037188.75
82	12	https://walmart.com/user/110	transport video	2022-07-05	1073268.22
83	6	http://walmart.com/settings	video	2021-12-14	976174.2
84	91	http://ebay.com/site	transport video	2020-02-06	941868.56
85	97	http://reddit.com/fr	transport video	2021-07-30	949033.55
86	53	https://wikipedia.org/user/110	transport video	2020-11-25	967458.79
87	20	https://instagram.com/site	video	2022-01-20	989564.2
88	22	https://bbc.co.uk/fr	video	2021-02-25	998276.71
89	36	http://bbc.co.uk/user/110	transport video	2021-11-27	974431.1
90	15	http://google.com/one	transport video	2020-11-02	965267.35
91	6	https://wikipedia.org/one	video	2022-12-27	1001506.44
92	41	https://wikipedia.org/en-us	transport video	2022-10-25	950193.21
93	34	http://twitter.com/fr	video	2022-06-10	1030100.69
94	62	http://baidu.com/fr	video	2022-04-28	1025704.4
95	56	http://wikipedia.org/settings	video	2021-05-06	998790.93
96	44	http://ebay.com/fr	transport video	2021-09-01	1022502.14
97	86	http://pinterest.com/group/9	video	2022-04-14	983607.74
98	73	https://yahoo.com/user/110	video	2021-08-16	978243.59
99	11	http://facebook.com/en-ca	transport video	2022-05-30	1034527.67
100	53	http://pinterest.com/fr	video	2022-03-12	1013693.51
\.


--
-- Name: freight_vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.freight_vehicles_id_seq', 100, true);


--
-- Name: light_vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.light_vehicles_id_seq', 100, true);


--
-- Name: messages_for_seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.messages_for_seller_id_seq', 100, true);


--
-- Name: motorcycles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.motorcycles_id_seq', 100, true);


--
-- Name: private_seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.private_seller_id_seq', 100, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: users_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_photo_id_seq', 100, true);


--
-- Name: vehicles_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.vehicles_photo_id_seq', 100, true);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.video_id_seq', 100, true);


--
-- Name: freight_vehicles freight_vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.freight_vehicles
    ADD CONSTRAINT freight_vehicles_pkey PRIMARY KEY (id);


--
-- Name: garage garage_state_number_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.garage
    ADD CONSTRAINT garage_state_number_key UNIQUE (state_number);


--
-- Name: garage garage_vin_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.garage
    ADD CONSTRAINT garage_vin_key UNIQUE (vin);


--
-- Name: light_vehicles light_vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.light_vehicles
    ADD CONSTRAINT light_vehicles_pkey PRIMARY KEY (id);


--
-- Name: messages_for_seller messages_for_seller_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages_for_seller
    ADD CONSTRAINT messages_for_seller_pkey PRIMARY KEY (id);


--
-- Name: motorcycles motorcycles_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.motorcycles
    ADD CONSTRAINT motorcycles_pkey PRIMARY KEY (id);


--
-- Name: private_seller private_seller_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.private_seller
    ADD CONSTRAINT private_seller_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_email_key UNIQUE (email);


--
-- Name: profiles profiles_main_foto_id_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_main_foto_id_key UNIQUE (main_foto_id);


--
-- Name: profiles profiles_phone_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_phone_key UNIQUE (phone);


--
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- Name: users users_password_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_password_key UNIQUE (password);


--
-- Name: users_photo users_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users_photo
    ADD CONSTRAINT users_photo_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vehicles_photo vehicles_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.vehicles_photo
    ADD CONSTRAINT vehicles_photo_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- Name: messages_for_seller from_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages_for_seller
    ADD CONSTRAINT from_user_id_fk FOREIGN KEY (from_user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: private_seller id_freight_vehicles_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.private_seller
    ADD CONSTRAINT id_freight_vehicles_fk FOREIGN KEY (id_freight_vehicles) REFERENCES public.freight_vehicles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: garage id_freight_vehicles_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.garage
    ADD CONSTRAINT id_freight_vehicles_fk FOREIGN KEY (id_freight_vehicles) REFERENCES public.freight_vehicles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: private_seller id_light_vehicles_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.private_seller
    ADD CONSTRAINT id_light_vehicles_fk FOREIGN KEY (id_light_vehicles) REFERENCES public.light_vehicles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: garage id_light_vehicles_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.garage
    ADD CONSTRAINT id_light_vehicles_fk FOREIGN KEY (id_light_vehicles) REFERENCES public.light_vehicles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: private_seller id_motorcycles_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.private_seller
    ADD CONSTRAINT id_motorcycles_fk FOREIGN KEY (id_motorcycles) REFERENCES public.motorcycles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: garage id_motorcycles_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.garage
    ADD CONSTRAINT id_motorcycles_fk FOREIGN KEY (id_motorcycles) REFERENCES public.motorcycles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: private_seller id_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.private_seller
    ADD CONSTRAINT id_user_fk FOREIGN KEY (id_user) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: garage id_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.garage
    ADD CONSTRAINT id_user_fk FOREIGN KEY (id_user) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: video owner_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT owner_id_fk FOREIGN KEY (owner_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: vehicles_photo owner_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.vehicles_photo
    ADD CONSTRAINT owner_id_fk FOREIGN KEY (owner_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users_photo owner_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users_photo
    ADD CONSTRAINT owner_id_fk FOREIGN KEY (owner_id) REFERENCES public.profiles(main_foto_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: private_seller photo_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.private_seller
    ADD CONSTRAINT photo_id_fk FOREIGN KEY (photo_id) REFERENCES public.vehicles_photo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: garage photo_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.garage
    ADD CONSTRAINT photo_id_fk FOREIGN KEY (vehicles_photo_id) REFERENCES public.vehicles_photo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: messages_for_seller to_private_seller_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages_for_seller
    ADD CONSTRAINT to_private_seller_fk FOREIGN KEY (to_private_seller) REFERENCES public.private_seller(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: profiles user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT user_id_fk FOREIGN KEY (id_user) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: private_seller video_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.private_seller
    ADD CONSTRAINT video_id_fk FOREIGN KEY (video_id) REFERENCES public.video(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: garage video_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.garage
    ADD CONSTRAINT video_id_fk FOREIGN KEY (vehicles_video_id) REFERENCES public.video(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

