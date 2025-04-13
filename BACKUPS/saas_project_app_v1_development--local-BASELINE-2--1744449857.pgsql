--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Ubuntu 14.17-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.17 (Ubuntu 14.17-0ubuntu0.22.04.1)

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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO heidless;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: heidless
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO heidless;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heidless
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO heidless;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: heidless
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO heidless;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heidless
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO heidless;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: heidless
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO heidless;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heidless
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO heidless;

--
-- Name: artifacts; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.artifacts (
    id bigint NOT NULL,
    name character varying,
    picture character varying,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    artimg character varying,
    organization_id integer
);


ALTER TABLE public.artifacts OWNER TO heidless;

--
-- Name: artifacts_id_seq; Type: SEQUENCE; Schema: public; Owner: heidless
--

CREATE SEQUENCE public.artifacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artifacts_id_seq OWNER TO heidless;

--
-- Name: artifacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heidless
--

ALTER SEQUENCE public.artifacts_id_seq OWNED BY public.artifacts.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.items (
    id bigint NOT NULL,
    name character varying,
    key character varying,
    project_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.items OWNER TO heidless;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: heidless
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO heidless;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heidless
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.organizations (
    id bigint NOT NULL,
    user_id bigint,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    active_org boolean DEFAULT false,
    domain character varying,
    subdomain character varying,
    logo character varying,
    plan_id bigint
);


ALTER TABLE public.organizations OWNER TO heidless;

--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: heidless
--

CREATE SEQUENCE public.organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organizations_id_seq OWNER TO heidless;

--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heidless
--

ALTER SEQUENCE public.organizations_id_seq OWNED BY public.organizations.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.payments (
    id bigint NOT NULL,
    email character varying,
    token character varying,
    user_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    organization_id integer
);


ALTER TABLE public.payments OWNER TO heidless;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: heidless
--

CREATE SEQUENCE public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO heidless;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heidless
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: plans; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.plans (
    id bigint NOT NULL,
    name character varying,
    amount numeric,
    symbol character varying,
    organization_id bigint DEFAULT 1 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.plans OWNER TO heidless;

--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: heidless
--

CREATE SEQUENCE public.plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plans_id_seq OWNER TO heidless;

--
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heidless
--

ALTER SEQUENCE public.plans_id_seq OWNED BY public.plans.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    name character varying,
    details character varying,
    expected_completion_date date,
    organization_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    image character varying,
    user_id bigint
);


ALTER TABLE public.projects OWNER TO heidless;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: heidless
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO heidless;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heidless
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO heidless;

--
-- Name: users; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    confirmation_token character varying,
    confirmed_at timestamp(6) without time zone,
    confirmation_sent_at timestamp(6) without time zone,
    unconfirmed_email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    avatar character varying,
    username character varying,
    organization_id integer,
    plan_id bigint
);


ALTER TABLE public.users OWNER TO heidless;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: heidless
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO heidless;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heidless
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: artifacts id; Type: DEFAULT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.artifacts ALTER COLUMN id SET DEFAULT nextval('public.artifacts_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: organizations id; Type: DEFAULT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.organizations ALTER COLUMN id SET DEFAULT nextval('public.organizations_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: plans id; Type: DEFAULT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.plans ALTER COLUMN id SET DEFAULT nextval('public.plans_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
9	logo	Organization	1	9	2025-04-08 12:50:51.024356
144	artimg	Artifact	30	144	2025-04-12 08:03:49.798314
145	artimg	Artifact	31	145	2025-04-12 08:05:50.205898
147	avatar	User	1	147	2025-04-12 09:15:36.355643
19	symbol	Plan	2	19	2025-04-08 18:14:04.140719
20	symbol	Plan	1	20	2025-04-08 19:54:13.751663
27	image	Project	8	27	2025-04-10 09:56:30.525183
28	avatar	User	4	28	2025-04-10 09:59:03.884939
33	avatar	User	6	33	2025-04-10 17:53:27.433907
34	avatar	User	7	34	2025-04-10 18:01:44.119409
35	image	Project	15	35	2025-04-10 18:03:08.041944
36	logo	Organization	5	36	2025-04-10 22:20:11.306328
37	avatar	User	8	37	2025-04-10 22:21:42.333147
65	symbol	Plan	3	65	2025-04-11 13:44:50.807543
66	logo	Organization	2	66	2025-04-11 13:47:30.958548
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
1	hjzp627emtf16ct1bveqwj0z2qj3	choam-0.png	image/png	{"identified":true}	google_dev	280561	u5V6ZxYrsbHWukV7VX2/Iw==	2025-04-08 12:13:39.618965
3	drnlnw76gij46sp95ffr3vdnevp6	avatar.png	image/png	{"identified":true,"width":512,"height":512,"analyzed":true}	google_dev	32475	aRCyEjBbSXkOZougjUh55Q==	2025-04-08 12:25:10.891236
4	zwvv1vphwxuz5s35z2saritw3d61	choam-0.png	image/png	{"identified":true,"width":864,"height":864,"analyzed":true}	google_dev	280561	u5V6ZxYrsbHWukV7VX2/Iw==	2025-04-08 12:25:48.329441
5	ib3frugug5ctumougoxr3uqbkrmr	choam-0.png	image/png	{"identified":true}	google_dev	280561	u5V6ZxYrsbHWukV7VX2/Iw==	2025-04-08 12:37:38.165996
147	saas-project-app-v1--DEV/9sttcivmlb6nv3ganz9cuy9sr6v8	User-Avatar-Profile-PNG-Free-Download.png	image/png	{"identified":true,"width":1024,"height":1024,"analyzed":true}	google_dev	97553	yz79ae87ydsHYoKWgFdvxA==	2025-04-12 09:15:36.320993
9	2kwb1f7ky1vjqyf5etvgqub2knmt	choam-0.png	image/png	{"identified":true,"width":864,"height":864,"analyzed":true}	google_dev	280561	u5V6ZxYrsbHWukV7VX2/Iw==	2025-04-08 12:50:51.021185
72	C.H.O.A.M/aimx1f8561t6n3s8yu33ts7dlwmg	avatar.png	image/png	{"identified":true}	google_dev	32475	aRCyEjBbSXkOZougjUh55Q==	2025-04-11 14:08:35.32343
33	exew101kugenc8libr0dnjjx3q9h	User-Avatar-Profile-PNG-Free-Download.png	image/png	{"identified":true,"width":1024,"height":1024,"analyzed":true}	google_dev	97553	yz79ae87ydsHYoKWgFdvxA==	2025-04-10 17:53:27.424826
73	C.H.O.A.M/3zygrfi0ki2uht76o5ont8pcrrk6	c86-roundel-0.png	image/png	{"identified":true}	google_dev	63887	pqqxhOz4TV60czBe7O90+g==	2025-04-11 14:11:53.004986
19	66ehfm33d07zojudw3608ikonr46	dollar-black-circle-icon-28.png	image/png	{"identified":true,"width":320,"height":320,"analyzed":true}	google_dev	10511	sAOrCZzqPsysfe4Wss5YRQ==	2025-04-08 18:14:04.133024
20	kp3qeas4tqvz5npgspde436237t6	avatar-icon-5.jpg	image/png	{"identified":true,"width":512,"height":512,"analyzed":true}	google_dev	35020	4+sbLLBhDhOMgWeYXs8Y9Q==	2025-04-08 19:54:13.51003
34	7pbplg73sb25lvymt6brpw9a8xg1	User-Avatar-Profile-PNG-Free-Download.png	image/png	{"identified":true,"width":1024,"height":1024,"analyzed":true}	google_dev	97553	yz79ae87ydsHYoKWgFdvxA==	2025-04-10 18:01:44.110203
35	hcfjkyylxg33h77dcx66nop15sp8	cat-bg.jpg	image/jpeg	{"identified":true,"width":3888,"height":2592,"analyzed":true}	google_dev	1774469	jgLGTQylfj+0E8PNkd9GvA==	2025-04-10 18:03:08.034227
36	oke5jxubqxq3d6yppzwt4q6uy8ad	v-img - Copy.jpg	image/jpeg	{"identified":true,"width":900,"height":1140,"analyzed":true}	google_dev	68765	ad0dj8NkoYxATQkmcfYHIQ==	2025-04-10 22:20:11.302795
27	jz5pdrujifhimc2y4nalovqx406k	user (1).png	image/png	{"identified":true,"width":512,"height":512,"analyzed":true}	google_dev	34344	IZq5NKDsIcMvf62hzmGXmQ==	2025-04-10 09:56:30.501849
28	6o5t4min2ws8d69j9iuagg4g92mc	c86-roundel-0.png	image/png	{"identified":true,"width":250,"height":250,"analyzed":true}	google_dev	63887	pqqxhOz4TV60czBe7O90+g==	2025-04-10 09:59:03.881655
37	u31vp180itp3a3d0hdackx0ouw6u	avatar.png	image/png	{"identified":true,"width":512,"height":512,"analyzed":true}	google_dev	32475	aRCyEjBbSXkOZougjUh55Q==	2025-04-10 22:21:42.329809
65	rhemoa8a07m9n8rj5qdzru1lkwny	avatar-icon-5.jpg	image/png	{"identified":true,"width":512,"height":512,"analyzed":true}	google_dev	35020	4+sbLLBhDhOMgWeYXs8Y9Q==	2025-04-11 13:44:50.797169
144	saas-project-app-v1-DEV/zz9w8w388w2tesad1gs9and0qbb1	User-Avatar-Profile-PNG-Free-Download.png	image/png	{"identified":true,"width":1024,"height":1024,"analyzed":true}	google_dev	97553	yz79ae87ydsHYoKWgFdvxA==	2025-04-12 08:03:49.782292
145	saas-project-app-v1-DEV/gnx8h9zvz535p3rfocreuhdidcxx	avatar-icon-5.jpg	image/png	{"identified":true,"width":512,"height":512,"analyzed":true}	google_dev	35020	4+sbLLBhDhOMgWeYXs8Y9Q==	2025-04-12 08:05:50.193629
66	yzp56h7ulj3j357cwluy2jri4oor	airbnb-favicon.ico	image/vnd.microsoft.icon	{"identified":true,"width":32,"height":32,"analyzed":true}	google_dev	4286	M1FxBvwyXOPFUHu/iDDsDw==	2025-04-11 13:47:30.948811
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2025-04-08 12:10:34.059328	2025-04-08 12:10:34.059331
\.


--
-- Data for Name: artifacts; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.artifacts (id, name, picture, user_id, created_at, updated_at, artimg, organization_id) FROM stdin;
30	artifact 1	pic 1	1	2025-04-12 08:03:49.6565	2025-04-12 08:03:51.541956	\N	1
31	artifact 2	pic 2	1	2025-04-12 08:05:50.179948	2025-04-12 08:05:51.274151	\N	1
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.items (id, name, key, project_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.organizations (id, user_id, name, created_at, updated_at, active_org, domain, subdomain, logo, plan_id) FROM stdin;
1	\N	C.H.O.A.M	2025-04-08 12:13:39.517769	2025-04-11 07:53:41.57315	t	choam.com	spice	\N	2
5	\N	Mega Corp	2025-04-10 22:20:11.237592	2025-04-11 07:53:52.976786	f	mega.com	things	\N	2
2	\N	Lumin Inc	2025-04-08 14:23:36.347405	2025-04-11 13:47:32.728805	f	lumin.com	innies	\N	2
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.payments (id, email, token, user_id, created_at, updated_at, organization_id) FROM stdin;
1	test_1@lumin.com	\N	2	2025-04-09 14:27:53.911249	2025-04-09 14:27:53.911249	2
2	test_2@choam.com	\N	3	2025-04-10 09:02:10.959367	2025-04-10 09:02:10.959367	1
3	test_2@lumin.com	\N	4	2025-04-10 09:59:05.711586	2025-04-10 09:59:05.711586	2
4	test_1@choam.com	\N	5	2025-04-10 13:51:58.621556	2025-04-10 13:51:58.621556	1
5	test_3@choam.com	\N	6	2025-04-10 17:53:29.279087	2025-04-10 17:53:29.279087	1
6	jsnow@lumin.com	\N	7	2025-04-10 18:01:45.792186	2025-04-10 18:01:45.792186	2
7	jsnow@mega.com	\N	8	2025-04-10 22:21:43.867366	2025-04-10 22:21:43.867366	5
\.


--
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.plans (id, name, amount, symbol, organization_id, created_at, updated_at) FROM stdin;
2	free	0.0	\N	1	2025-04-08 18:06:21.964434	2025-04-08 18:14:06.116759
1	premium	100.0	ret	1	2025-04-08 17:46:05.508338	2025-04-10 08:22:08.391741
3	middling	50.0	\N	1	2025-04-11 13:43:13.866893	2025-04-11 13:44:52.626195
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.projects (id, name, details, expected_completion_date, organization_id, created_at, updated_at, image, user_id) FROM stdin;
8	lumin 1	details here	2025-04-30	2	2025-04-09 14:34:40.788624	2025-04-10 09:56:33.66596	\N	\N
15	test 1	details here	2025-04-22	2	2025-04-10 18:03:08.010229	2025-04-10 18:03:10.631387	\N	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.schema_migrations (version) FROM stdin;
20250320120837
20250324120418
20250330104908
20250330110012
20250330120509
20250331161048
20250401211943
20250405123016
20250405123042
20250407084556
20250407090610
20250407090645
20250407143912
20250407215411
20250408174418
20250408180305
20250409115756
20250409133639
20250410084532
20250410092734
20250410133519
20250411081537
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, created_at, updated_at, avatar, username, organization_id, plan_id) FROM stdin;
2	test_1@lumin.com	$2a$12$jvM38WksghtIzlmRwq05lecsHtu7UrmOiK4QPfa7REPAKXUGs/8Ry	\N	\N	\N	\N	\N	\N	\N	2025-04-09 14:27:51.761709	2025-04-09 14:27:51.761709	\N	t1_lumin	2	\N
3	test_2@choam.com	$2a$12$yflWzHzEdMM9VzjSJ.cbpek41O2ZFVGa/kVBCmxURt0yRrFCZM82C	\N	\N	\N	\N	\N	\N	\N	2025-04-10 09:02:09.085614	2025-04-10 09:02:09.085614	\N	t2000	1	1
4	test_2@lumin.com	$2a$12$Fg2I3LjJ.TwanyENnbTwrOemCrFkN0eSE.V1cFT0C4NeXm8Q2HW.G	\N	\N	\N	\N	\N	\N	\N	2025-04-10 09:59:03.868618	2025-04-10 09:59:09.310555	\N	t2_lumin	2	2
5	test_1@choam.com	$2a$12$ibJPtuFWspnFnhkaRcM/Luv8Et9vSLhrS.9u4gAifvSd7PHkoBMt.	\N	\N	\N	\N	\N	\N	\N	2025-04-10 13:51:56.572906	2025-04-10 13:51:56.572906	\N	t1_choam	1	2
6	test_3@choam.com	$2a$12$Aek3AtEo1Hdo8x15Xy0gYOg0dZkj1ScODfOjxdbw7GjcV/6cH3jAq	\N	\N	\N	\N	\N	\N	\N	2025-04-10 17:53:27.344847	2025-04-10 17:53:30.29797	\N	t3_choam	1	2
7	jsnow@lumin.com	$2a$12$5Bxb.JbHMxH8tVYkTyE9zuZgJPAbenmVMNljB8NUiKbF5cjyQSkP6	\N	\N	\N	\N	\N	\N	\N	2025-04-10 18:01:44.059004	2025-04-10 18:01:47.554322	\N	js_lumin	2	2
8	jsnow@mega.com	$2a$12$6HrZSKYmBHSC5aJpB4kieODHA9M08BWIWPtqoaykLk.deN8uFshsS	\N	\N	\N	\N	\N	\N	\N	2025-04-10 22:21:42.316983	2025-04-11 06:53:27.671883	\N	js_mega	5	2
1	jsnow@choam.com	$2a$12$nM6e8rlseiL5cO56RSk4Ru30zKm6qSixiYsQGL53vD.eeKR9dEzFm	\N	\N	\N	\N	\N	\N	\N	2025-04-08 12:23:29.221126	2025-04-12 09:15:38.108922	\N	js_choam	1	2
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heidless
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 147, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heidless
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 147, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heidless
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: artifacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heidless
--

SELECT pg_catalog.setval('public.artifacts_id_seq', 31, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heidless
--

SELECT pg_catalog.setval('public.items_id_seq', 1, false);


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heidless
--

SELECT pg_catalog.setval('public.organizations_id_seq', 5, true);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heidless
--

SELECT pg_catalog.setval('public.payments_id_seq', 7, true);


--
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heidless
--

SELECT pg_catalog.setval('public.plans_id_seq', 3, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heidless
--

SELECT pg_catalog.setval('public.projects_id_seq', 61, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heidless
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: artifacts artifacts_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.artifacts
    ADD CONSTRAINT artifacts_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: plans plans_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: heidless
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: heidless
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: heidless
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_artifacts_on_organization_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_artifacts_on_organization_id ON public.artifacts USING btree (organization_id);


--
-- Name: index_artifacts_on_user_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_artifacts_on_user_id ON public.artifacts USING btree (user_id);


--
-- Name: index_items_on_project_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_items_on_project_id ON public.items USING btree (project_id);


--
-- Name: index_organizations_on_plan_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_organizations_on_plan_id ON public.organizations USING btree (plan_id);


--
-- Name: index_organizations_on_user_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_organizations_on_user_id ON public.organizations USING btree (user_id);


--
-- Name: index_payments_on_organization_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_payments_on_organization_id ON public.payments USING btree (organization_id);


--
-- Name: index_plans_on_organization_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_plans_on_organization_id ON public.plans USING btree (organization_id);


--
-- Name: index_projects_on_organization_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_projects_on_organization_id ON public.projects USING btree (organization_id);


--
-- Name: index_projects_on_user_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_projects_on_user_id ON public.projects USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: heidless
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_organization_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_users_on_organization_id ON public.users USING btree (organization_id);


--
-- Name: index_users_on_plan_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_users_on_plan_id ON public.users USING btree (plan_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: heidless
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: plans fk_rails_216ac8a975; Type: FK CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT fk_rails_216ac8a975 FOREIGN KEY (organization_id) REFERENCES public.organizations(id);


--
-- Name: artifacts fk_rails_5d0e3291dd; Type: FK CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.artifacts
    ADD CONSTRAINT fk_rails_5d0e3291dd FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: organizations fk_rails_7b93e0061c; Type: FK CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT fk_rails_7b93e0061c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: organizations fk_rails_7d8d2861ef; Type: FK CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT fk_rails_7d8d2861ef FOREIGN KEY (plan_id) REFERENCES public.plans(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: projects fk_rails_9aee26923d; Type: FK CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_rails_9aee26923d FOREIGN KEY (organization_id) REFERENCES public.organizations(id);


--
-- Name: projects fk_rails_b872a6760a; Type: FK CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_rails_b872a6760a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: users fk_rails_c7d01481e8; Type: FK CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_c7d01481e8 FOREIGN KEY (plan_id) REFERENCES public.plans(id);


--
-- Name: items fk_rails_f6abf55b81; Type: FK CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_f6abf55b81 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- PostgreSQL database dump complete
--

