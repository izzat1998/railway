--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: container_status_containerstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.container_status_containerstatus (
    id bigint NOT NULL,
    train_id bigint NOT NULL,
    container_in_terminal_id bigint
);


ALTER TABLE public.container_status_containerstatus OWNER TO postgres;

--
-- Name: container_status_containerstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.container_status_containerstatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.container_status_containerstatus_id_seq OWNER TO postgres;

--
-- Name: container_status_containerstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.container_status_containerstatus_id_seq OWNED BY public.container_status_containerstatus.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: railway_bill_container; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.railway_bill_container (
    id bigint NOT NULL,
    name character varying(13) NOT NULL,
    weight_type character varying(20) NOT NULL,
    weight_type_code character varying(20)
);


ALTER TABLE public.railway_bill_container OWNER TO postgres;

--
-- Name: railway_bill_container_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.railway_bill_container_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.railway_bill_container_id_seq OWNER TO postgres;

--
-- Name: railway_bill_container_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.railway_bill_container_id_seq OWNED BY public.railway_bill_container.id;


--
-- Name: railway_bill_railwaybill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.railway_bill_railwaybill (
    id bigint NOT NULL,
    railway_code character varying(100) NOT NULL,
    sender text NOT NULL,
    departure_station character varying(255) NOT NULL,
    sender_statement text NOT NULL,
    recipient text NOT NULL,
    destination_station text NOT NULL,
    border_crossing_stations text NOT NULL,
    railway_carriage text NOT NULL,
    shipping_name text NOT NULL,
    container_owner text NOT NULL,
    type_of_packaging character varying(100) NOT NULL,
    number_of_seats character varying(30),
    net character varying(50) NOT NULL,
    tara character varying(50) NOT NULL,
    gross character varying(50) NOT NULL,
    seals text NOT NULL,
    seal_quantity character varying(30),
    submerged character varying(100) NOT NULL,
    method_of_determining_mass character varying(100) NOT NULL,
    payment_of_legal_fees text NOT NULL,
    carriers text NOT NULL,
    documents_by_sender text NOT NULL,
    additional_information text NOT NULL,
    custom_seal character varying(100) NOT NULL,
    inspector_name character varying(50) NOT NULL,
    date character varying(50) NOT NULL,
    file character varying(100) NOT NULL,
    file_original character varying(100) NOT NULL,
    container_id bigint NOT NULL,
    train_id bigint NOT NULL
);


ALTER TABLE public.railway_bill_railwaybill OWNER TO postgres;

--
-- Name: railway_bill_railwaybill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.railway_bill_railwaybill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.railway_bill_railwaybill_id_seq OWNER TO postgres;

--
-- Name: railway_bill_railwaybill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.railway_bill_railwaybill_id_seq OWNED BY public.railway_bill_railwaybill.id;


--
-- Name: staff_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff_client (
    id bigint NOT NULL,
    phone_number character varying(20),
    user_id integer NOT NULL
);


ALTER TABLE public.staff_client OWNER TO postgres;

--
-- Name: staff_client_containers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff_client_containers (
    id bigint NOT NULL,
    client_id bigint NOT NULL,
    containerstatus_id bigint NOT NULL
);


ALTER TABLE public.staff_client_containers OWNER TO postgres;

--
-- Name: staff_client_containers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_client_containers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_client_containers_id_seq OWNER TO postgres;

--
-- Name: staff_client_containers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_client_containers_id_seq OWNED BY public.staff_client_containers.id;


--
-- Name: staff_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_client_id_seq OWNER TO postgres;

--
-- Name: staff_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_client_id_seq OWNED BY public.staff_client.id;


--
-- Name: staff_staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff_staff (
    id bigint NOT NULL,
    role character varying(40) NOT NULL,
    telegram_id character varying(20),
    user_id integer NOT NULL
);


ALTER TABLE public.staff_staff OWNER TO postgres;

--
-- Name: staff_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_staff_id_seq OWNER TO postgres;

--
-- Name: staff_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_staff_id_seq OWNED BY public.staff_staff.id;


--
-- Name: terminal_containerinterminal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terminal_containerinterminal (
    id bigint NOT NULL,
    laden boolean NOT NULL,
    date_of_arrived date,
    staff_id bigint NOT NULL,
    terminal_id bigint NOT NULL,
    container_id bigint,
    arrived boolean NOT NULL
);


ALTER TABLE public.terminal_containerinterminal OWNER TO postgres;

--
-- Name: terminal_containerinterminal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.terminal_containerinterminal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.terminal_containerinterminal_id_seq OWNER TO postgres;

--
-- Name: terminal_containerinterminal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.terminal_containerinterminal_id_seq OWNED BY public.terminal_containerinterminal.id;


--
-- Name: terminal_containerinterminaldocument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terminal_containerinterminaldocument (
    id bigint NOT NULL,
    document character varying(100) NOT NULL,
    container_in_terminal_id bigint
);


ALTER TABLE public.terminal_containerinterminaldocument OWNER TO postgres;

--
-- Name: terminal_containerinterminaldocument_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.terminal_containerinterminaldocument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.terminal_containerinterminaldocument_id_seq OWNER TO postgres;

--
-- Name: terminal_containerinterminaldocument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.terminal_containerinterminaldocument_id_seq OWNED BY public.terminal_containerinterminaldocument.id;


--
-- Name: terminal_containerinterminalsealimage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terminal_containerinterminalsealimage (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    container_in_terminal_id bigint
);


ALTER TABLE public.terminal_containerinterminalsealimage OWNER TO postgres;

--
-- Name: terminal_containerinterminalsealimage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.terminal_containerinterminalsealimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.terminal_containerinterminalsealimage_id_seq OWNER TO postgres;

--
-- Name: terminal_containerinterminalsealimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.terminal_containerinterminalsealimage_id_seq OWNED BY public.terminal_containerinterminalsealimage.id;


--
-- Name: terminal_terminal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terminal_terminal (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.terminal_terminal OWNER TO postgres;

--
-- Name: terminal_terminal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.terminal_terminal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.terminal_terminal_id_seq OWNER TO postgres;

--
-- Name: terminal_terminal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.terminal_terminal_id_seq OWNED BY public.terminal_terminal.id;


--
-- Name: train_train; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.train_train (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(100) NOT NULL,
    terminal_id bigint
);


ALTER TABLE public.train_train OWNER TO postgres;

--
-- Name: train_train_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.train_train_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.train_train_id_seq OWNER TO postgres;

--
-- Name: train_train_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.train_train_id_seq OWNED BY public.train_train.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: container_status_containerstatus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_status_containerstatus ALTER COLUMN id SET DEFAULT nextval('public.container_status_containerstatus_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: railway_bill_container id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.railway_bill_container ALTER COLUMN id SET DEFAULT nextval('public.railway_bill_container_id_seq'::regclass);


--
-- Name: railway_bill_railwaybill id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.railway_bill_railwaybill ALTER COLUMN id SET DEFAULT nextval('public.railway_bill_railwaybill_id_seq'::regclass);


--
-- Name: staff_client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_client ALTER COLUMN id SET DEFAULT nextval('public.staff_client_id_seq'::regclass);


--
-- Name: staff_client_containers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_client_containers ALTER COLUMN id SET DEFAULT nextval('public.staff_client_containers_id_seq'::regclass);


--
-- Name: staff_staff id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_staff ALTER COLUMN id SET DEFAULT nextval('public.staff_staff_id_seq'::regclass);


--
-- Name: terminal_containerinterminal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal_containerinterminal ALTER COLUMN id SET DEFAULT nextval('public.terminal_containerinterminal_id_seq'::regclass);


--
-- Name: terminal_containerinterminaldocument id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal_containerinterminaldocument ALTER COLUMN id SET DEFAULT nextval('public.terminal_containerinterminaldocument_id_seq'::regclass);


--
-- Name: terminal_containerinterminalsealimage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal_containerinterminalsealimage ALTER COLUMN id SET DEFAULT nextval('public.terminal_containerinterminalsealimage_id_seq'::regclass);


--
-- Name: terminal_terminal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal_terminal ALTER COLUMN id SET DEFAULT nextval('public.terminal_terminal_id_seq'::regclass);


--
-- Name: train_train id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.train_train ALTER COLUMN id SET DEFAULT nextval('public.train_train_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add user	2	add_user
6	Can change user	2	change_user
7	Can delete user	2	delete_user
8	Can view user	2	view_user
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add permission	4	add_permission
14	Can change permission	4	change_permission
15	Can delete permission	4	delete_permission
16	Can view permission	4	view_permission
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add train	7	add_train
26	Can change train	7	change_train
27	Can delete train	7	delete_train
28	Can view train	7	view_train
29	Can add railway bill	8	add_railwaybill
30	Can change railway bill	8	change_railwaybill
31	Can delete railway bill	8	delete_railwaybill
32	Can view railway bill	8	view_railwaybill
33	Can add container	9	add_container
34	Can change container	9	change_container
35	Can delete container	9	delete_container
36	Can view container	9	view_container
37	Can add container document	10	add_containerdocument
38	Can change container document	10	change_containerdocument
39	Can delete container document	10	delete_containerdocument
40	Can view container document	10	view_containerdocument
41	Can add seal image	11	add_sealimage
42	Can change seal image	11	change_sealimage
43	Can delete seal image	11	delete_sealimage
44	Can view seal image	11	view_sealimage
45	Can add container status	12	add_containerstatus
46	Can change container status	12	change_containerstatus
47	Can delete container status	12	delete_containerstatus
48	Can view container status	12	view_containerstatus
49	Can add waiting list	13	add_waitinglist
50	Can change waiting list	13	change_waitinglist
51	Can delete waiting list	13	delete_waitinglist
52	Can view waiting list	13	view_waitinglist
53	Can add container in terminal	14	add_containerinterminal
54	Can change container in terminal	14	change_containerinterminal
55	Can delete container in terminal	14	delete_containerinterminal
56	Can view container in terminal	14	view_containerinterminal
57	Can add terminal	15	add_terminal
58	Can change terminal	15	change_terminal
59	Can delete terminal	15	delete_terminal
60	Can view terminal	15	view_terminal
61	Can add staff	16	add_staff
62	Can change staff	16	change_staff
63	Can delete staff	16	delete_staff
64	Can view staff	16	view_staff
65	Can add container in terminal seal image	17	add_containerinterminalsealimage
66	Can change container in terminal seal image	17	change_containerinterminalsealimage
67	Can delete container in terminal seal image	17	delete_containerinterminalsealimage
68	Can view container in terminal seal image	17	view_containerinterminalsealimage
69	Can add container in terminal document	18	add_containerinterminaldocument
70	Can change container in terminal document	18	change_containerinterminaldocument
71	Can delete container in terminal document	18	delete_containerinterminaldocument
72	Can view container in terminal document	18	view_containerinterminaldocument
73	Can add client	19	add_client
74	Can change client	19	change_client
75	Can delete client	19	delete_client
76	Can view client	19	view_client
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$260000$SwR4pEHzWEzSKtrRFlLEYi$TGLQnAOzXFSSeSdG4F02zqcYBAGy9o5R420kM5SoE6g=	\N	f	Jasur				f	t	2021-12-03 15:47:09.570248+05
4	pbkdf2_sha256$260000$YiPq1inBr0JD0JceYiDlsf$9QikMYtZrvf/Wr89QzhgFdK682nT7LBv+y7Txq9aHwo=	\N	f	QingdaoHYTrans				f	t	2021-12-07 13:01:36.868937+05
5	pbkdf2_sha256$260000$Ni0CetfkahVsNmSsxc1Kc0$FOT9a6qn178Bj4Eiowlz7lk1DKwaBKm3yG+BL/414FA=	\N	f	InterRailChina				f	t	2021-12-07 13:02:20.346428+05
3	pbkdf2_sha256$260000$XxvHiJLnA6rHQmpJwdGDYW$ivPz0SfV5eRhKWGIwlcRjd4U3L0/HpzbKr3zNW0GduE=	2021-12-09 10:00:41.149732+05	f	XIAN				f	t	2021-12-06 18:34:41.997202+05
1	pbkdf2_sha256$260000$qtHNNgCrVEdGwUObhT1OTo$5RSskXGPATl6FtNC1ShJpX+BF41/4bMNBZTh43teUGk=	2021-12-09 10:37:33.633336+05	t	admin				t	t	2021-12-03 15:12:01.244791+05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: container_status_containerstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.container_status_containerstatus (id, train_id, container_in_terminal_id) FROM stdin;
222	7	62
223	7	11
224	7	12
225	7	13
226	7	14
227	7	15
228	7	16
229	7	17
230	7	18
231	7	19
232	7	20
233	7	21
234	7	22
235	7	23
236	7	24
237	7	25
238	7	26
239	7	27
240	7	28
241	7	29
242	7	30
243	7	31
244	7	32
245	7	33
246	7	34
247	7	35
248	7	36
249	7	37
250	7	38
251	7	39
252	7	40
253	7	41
254	7	42
255	7	43
256	7	44
257	7	45
258	7	46
259	7	47
260	7	48
261	7	49
262	7	50
263	7	51
264	7	52
265	7	53
266	7	54
267	7	55
268	7	56
269	7	57
270	7	58
271	7	59
272	7	60
273	7	61
276	8	64
277	8	65
278	8	66
279	8	67
280	8	68
281	8	69
282	8	70
283	8	71
284	8	72
285	8	73
286	8	74
287	8	75
288	8	76
289	8	77
290	8	78
291	8	79
292	8	80
293	8	81
294	8	82
295	8	83
296	8	84
297	8	85
298	8	86
299	8	87
300	8	88
301	8	89
302	8	90
303	8	91
304	8	92
305	8	93
306	8	94
307	8	95
308	8	96
309	8	97
310	8	98
311	8	99
312	8	100
313	8	101
314	8	102
315	8	103
316	8	104
317	8	105
318	8	106
319	8	107
320	8	108
321	8	109
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-12-03 15:12:12.805567+05	1	ULS	1	[{"added": {}}]	15	1
2	2021-12-03 15:12:15.853337+05	2	FTT	1	[{"added": {}}]	15	1
3	2021-12-03 15:12:19.342406+05	3	FDTP	1	[{"added": {}}]	15	1
4	2021-12-03 15:47:09.7003+05	2	Jasur	1	[{"added": {}}]	2	1
5	2021-12-03 15:47:14.788403+05	1	Jasur	1	[{"added": {}}]	16	1
6	2021-12-03 15:47:17.155262+05	1	BHCU4923000	1	[{"added": {}}]	14	1
7	2021-12-03 15:47:25.175087+05	1	BHCU4923000	1	[{"added": {}}]	18	1
8	2021-12-03 15:48:21.066314+05	1	BHCU4923000	2	[]	18	1
9	2021-12-03 15:48:47.195981+05	1	BHCU4923000	2	[{"changed": {"fields": ["Date of arrived"]}}]	14	1
10	2021-12-03 16:02:12.348312+05	1	LYGU4020815	1	[{"added": {}}]	11	1
11	2021-12-03 16:02:40.872789+05	1	ContainerInTerminalSealImage object (1)	1	[{"added": {}}]	17	1
12	2021-12-03 16:19:29.542103+05	2	CAXU9837500	1	[{"added": {}}]	14	1
13	2021-12-06 10:19:14.846918+05	2	CAXU9837500	2	[{"changed": {"fields": ["Terminal"]}}]	14	1
14	2021-12-06 10:49:05.753961+05	46	WEDU8122800	3		13	1
15	2021-12-06 10:49:05.755961+05	45	SGRU5004828	3		13	1
16	2021-12-06 10:49:05.755961+05	44	TGHU8709068	3		13	1
17	2021-12-06 10:49:05.756974+05	43	WSCU9982040	3		13	1
18	2021-12-06 10:49:05.75796+05	42	TCKU9278821	3		13	1
19	2021-12-06 10:49:05.75796+05	41	GESU4963127	3		13	1
20	2021-12-06 10:49:05.75896+05	40	TRLU5511401	3		13	1
21	2021-12-06 10:49:05.75896+05	39	TGHU9031170	3		13	1
22	2021-12-06 10:49:05.75999+05	38	WSCU7820749	3		13	1
23	2021-12-06 10:49:05.75999+05	37	HDMU6482175	3		13	1
24	2021-12-06 10:49:05.760961+05	36	GESU5096843	3		13	1
25	2021-12-06 10:49:05.76196+05	35	CCLU6523612	3		13	1
26	2021-12-06 10:49:05.76196+05	34	CLHU8325827	3		13	1
27	2021-12-06 10:49:05.76296+05	33	SNBU7002133	3		13	1
28	2021-12-06 10:49:05.76296+05	32	BHCU4923000	3		13	1
29	2021-12-06 10:49:05.763976+05	31	CBHU1472750	3		13	1
30	2021-12-06 10:49:05.763976+05	30	YHLU1379191	3		13	1
31	2021-12-06 10:49:05.764962+05	29	CCLU6698729	3		13	1
32	2021-12-06 10:49:05.765962+05	28	HDMU6453304	3		13	1
33	2021-12-06 10:49:05.765962+05	27	INKU2624944	3		13	1
34	2021-12-06 10:49:05.76696+05	26	CBHU8228679	3		13	1
35	2021-12-06 10:49:05.76696+05	25	TRLU5789394	3		13	1
36	2021-12-06 10:49:05.76796+05	24	TDRU0621606	3		13	1
37	2021-12-06 10:49:05.76796+05	23	EMCU9738538	3		13	1
38	2021-12-06 10:49:05.768961+05	22	CBHU1483728	3		13	1
39	2021-12-06 10:49:05.768961+05	21	TCNU9499386	3		13	1
40	2021-12-06 10:49:05.76996+05	20	RJXU4014230	3		13	1
41	2021-12-06 10:49:05.76996+05	19	EISU9035585	3		13	1
42	2021-12-06 10:49:05.771047+05	18	YMLU8379240	3		13	1
43	2021-12-06 10:49:05.771047+05	17	EOLU8072350	3		13	1
44	2021-12-06 10:49:05.771047+05	16	TCKU9388602	3		13	1
45	2021-12-06 10:49:05.772055+05	15	TCNU9674473	3		13	1
46	2021-12-06 10:49:05.772055+05	14	TGHU8689510	3		13	1
47	2021-12-06 10:49:05.773056+05	13	TRIU9195797	3		13	1
48	2021-12-06 10:49:05.773884+05	12	HRSU4602033	3		13	1
49	2021-12-06 10:49:05.773884+05	11	CLHU8577027	3		13	1
50	2021-12-06 10:49:05.774891+05	10	PAAU4501960	3		13	1
51	2021-12-06 10:49:05.774891+05	9	MOLU1122652	3		13	1
52	2021-12-06 10:49:05.774891+05	8	LYGU4021067	3		13	1
53	2021-12-06 10:49:05.775891+05	7	OOLU8252979	3		13	1
54	2021-12-06 10:49:05.775891+05	6	TRLU6749375	3		13	1
55	2021-12-06 10:49:05.776891+05	5	CCLU6909858	3		13	1
56	2021-12-06 10:49:05.776891+05	4	INKU2227042	3		13	1
57	2021-12-06 10:49:05.777891+05	3	CKCU6000013	3		13	1
58	2021-12-06 10:49:05.777891+05	2	CAXU9837500	3		13	1
59	2021-12-06 10:49:05.778891+05	1	LYGU4020815	3		13	1
60	2021-12-06 10:51:25.14629+05	3	CCLU6909858	1	[{"added": {}}]	14	1
61	2021-12-06 10:55:12.169159+05	5	CCLU6909858	2	[{"changed": {"fields": ["Weight type"]}}]	9	1
62	2021-12-06 11:24:28.760372+05	46	WEDU8122800	3		12	1
63	2021-12-06 11:24:28.764338+05	45	SGRU5004828	3		12	1
64	2021-12-06 11:24:28.765335+05	44	TGHU8709068	3		12	1
65	2021-12-06 11:24:28.765335+05	43	WSCU9982040	3		12	1
66	2021-12-06 11:24:28.766369+05	42	TCKU9278821	3		12	1
67	2021-12-06 11:24:28.766369+05	41	GESU4963127	3		12	1
68	2021-12-06 11:24:28.767337+05	40	TRLU5511401	3		12	1
69	2021-12-06 11:24:28.76837+05	39	TGHU9031170	3		12	1
70	2021-12-06 11:24:28.768975+05	38	WSCU7820749	3		12	1
71	2021-12-06 11:24:28.769257+05	37	HDMU6482175	3		12	1
72	2021-12-06 11:24:28.769257+05	36	GESU5096843	3		12	1
73	2021-12-06 11:24:28.770293+05	35	CCLU6523612	3		12	1
74	2021-12-06 11:24:28.771265+05	34	CLHU8325827	3		12	1
75	2021-12-06 11:24:28.771265+05	33	SNBU7002133	3		12	1
76	2021-12-06 11:24:28.772265+05	32	BHCU4923000	3		12	1
77	2021-12-06 11:24:28.772265+05	31	CBHU1472750	3		12	1
78	2021-12-06 11:24:28.773265+05	30	YHLU1379191	3		12	1
79	2021-12-06 11:24:28.773265+05	29	CCLU6698729	3		12	1
80	2021-12-06 11:24:28.774264+05	28	HDMU6453304	3		12	1
81	2021-12-06 11:24:28.774264+05	27	INKU2624944	3		12	1
82	2021-12-06 11:24:28.775264+05	26	CBHU8228679	3		12	1
83	2021-12-06 11:24:28.776265+05	25	TRLU5789394	3		12	1
84	2021-12-06 11:24:28.776265+05	24	TDRU0621606	3		12	1
85	2021-12-06 11:24:28.777267+05	23	EMCU9738538	3		12	1
86	2021-12-06 11:24:28.778265+05	22	CBHU1483728	3		12	1
87	2021-12-06 11:24:28.778265+05	21	TCNU9499386	3		12	1
88	2021-12-06 11:24:28.779264+05	20	RJXU4014230	3		12	1
89	2021-12-06 11:24:28.779264+05	19	EISU9035585	3		12	1
90	2021-12-06 11:24:28.780263+05	18	YMLU8379240	3		12	1
91	2021-12-06 11:24:28.780263+05	17	EOLU8072350	3		12	1
92	2021-12-06 11:24:28.781264+05	16	TCKU9388602	3		12	1
93	2021-12-06 11:24:28.781264+05	15	TCNU9674473	3		12	1
94	2021-12-06 11:24:28.782293+05	14	TGHU8689510	3		12	1
95	2021-12-06 11:24:28.783266+05	13	TRIU9195797	3		12	1
96	2021-12-06 11:24:28.783266+05	12	HRSU4602033	3		12	1
97	2021-12-06 11:24:28.784265+05	11	CLHU8577027	3		12	1
98	2021-12-06 11:24:28.784265+05	10	PAAU4501960	3		12	1
99	2021-12-06 11:24:28.785265+05	9	MOLU1122652	3		12	1
100	2021-12-06 11:24:28.785806+05	8	LYGU4021067	3		12	1
101	2021-12-06 11:24:28.7863+05	7	OOLU8252979	3		12	1
102	2021-12-06 11:24:28.7863+05	6	TRLU6749375	3		12	1
103	2021-12-06 11:24:28.787306+05	5	CCLU6909858	3		12	1
104	2021-12-06 11:24:28.787306+05	4	INKU2227042	3		12	1
105	2021-12-06 11:24:28.788306+05	3	CKCU6000013	3		12	1
106	2021-12-06 11:24:28.789307+05	2	CAXU9837500	3		12	1
107	2021-12-06 11:24:28.790306+05	1	LYGU4020815	3		12	1
108	2021-12-06 11:24:53.23042+05	47	CAXU9837500	3		13	1
109	2021-12-06 11:25:05.257334+05	46	WEDU8122800	3		12	1
110	2021-12-06 11:25:05.259334+05	45	SGRU5004828	3		12	1
111	2021-12-06 11:25:05.260369+05	44	TGHU8709068	3		12	1
112	2021-12-06 11:25:05.261335+05	43	WSCU9982040	3		12	1
113	2021-12-06 11:25:05.262335+05	42	TCKU9278821	3		12	1
114	2021-12-06 11:25:05.262335+05	41	GESU4963127	3		12	1
115	2021-12-06 11:25:05.263334+05	40	TRLU5511401	3		12	1
116	2021-12-06 11:25:05.263334+05	39	TGHU9031170	3		12	1
117	2021-12-06 11:25:05.2649+05	38	WSCU7820749	3		12	1
118	2021-12-06 11:25:05.2649+05	37	HDMU6482175	3		12	1
119	2021-12-06 11:25:05.26591+05	36	GESU5096843	3		12	1
120	2021-12-06 11:25:05.266797+05	35	CCLU6523612	3		12	1
121	2021-12-06 11:25:05.266797+05	34	CLHU8325827	3		12	1
122	2021-12-06 11:25:05.267806+05	33	SNBU7002133	3		12	1
123	2021-12-06 11:25:05.267806+05	32	BHCU4923000	3		12	1
124	2021-12-06 11:25:05.268804+05	31	CBHU1472750	3		12	1
125	2021-12-06 11:25:05.268804+05	30	YHLU1379191	3		12	1
126	2021-12-06 11:25:05.269804+05	29	CCLU6698729	3		12	1
127	2021-12-06 11:25:05.270804+05	28	HDMU6453304	3		12	1
128	2021-12-06 11:25:05.270804+05	27	INKU2624944	3		12	1
129	2021-12-06 11:25:05.271804+05	26	CBHU8228679	3		12	1
130	2021-12-06 11:25:05.271804+05	25	TRLU5789394	3		12	1
131	2021-12-06 11:25:05.272803+05	24	TDRU0621606	3		12	1
132	2021-12-06 11:25:05.272803+05	23	EMCU9738538	3		12	1
133	2021-12-06 11:25:05.273804+05	22	CBHU1483728	3		12	1
134	2021-12-06 11:25:05.273804+05	21	TCNU9499386	3		12	1
135	2021-12-06 11:25:05.274804+05	20	RJXU4014230	3		12	1
136	2021-12-06 11:25:05.274804+05	19	EISU9035585	3		12	1
137	2021-12-06 11:25:05.275804+05	18	YMLU8379240	3		12	1
138	2021-12-06 11:25:05.275804+05	17	EOLU8072350	3		12	1
139	2021-12-06 11:25:05.276804+05	16	TCKU9388602	3		12	1
140	2021-12-06 11:25:05.276804+05	15	TCNU9674473	3		12	1
141	2021-12-06 11:25:05.277805+05	14	TGHU8689510	3		12	1
142	2021-12-06 11:25:05.277805+05	13	TRIU9195797	3		12	1
143	2021-12-06 11:25:05.278805+05	12	HRSU4602033	3		12	1
144	2021-12-06 11:25:05.278805+05	11	CLHU8577027	3		12	1
145	2021-12-06 11:25:05.279804+05	10	PAAU4501960	3		12	1
146	2021-12-06 11:25:05.279804+05	9	MOLU1122652	3		12	1
147	2021-12-06 11:25:05.280805+05	8	LYGU4021067	3		12	1
148	2021-12-06 11:25:05.280805+05	7	OOLU8252979	3		12	1
149	2021-12-06 11:25:05.280805+05	6	TRLU6749375	3		12	1
150	2021-12-06 11:25:05.281804+05	5	CCLU6909858	3		12	1
151	2021-12-06 11:25:05.281804+05	4	INKU2227042	3		12	1
152	2021-12-06 11:25:05.282804+05	3	CKCU6000013	3		12	1
153	2021-12-06 11:25:05.282804+05	2	CAXU9837500	3		12	1
154	2021-12-06 11:25:05.282804+05	1	LYGU4020815	3		12	1
155	2021-12-06 11:34:34.629263+05	46	WEDU8122800	3		12	1
156	2021-12-06 11:34:34.632469+05	45	SGRU5004828	3		12	1
157	2021-12-06 11:34:34.633952+05	44	TGHU8709068	3		12	1
158	2021-12-06 11:34:34.634347+05	43	WSCU9982040	3		12	1
159	2021-12-06 11:34:34.634347+05	42	TCKU9278821	3		12	1
160	2021-12-06 11:34:34.635355+05	41	GESU4963127	3		12	1
161	2021-12-06 11:34:34.636354+05	40	TRLU5511401	3		12	1
162	2021-12-06 11:34:34.636354+05	39	TGHU9031170	3		12	1
163	2021-12-06 11:34:34.637353+05	38	WSCU7820749	3		12	1
164	2021-12-06 11:34:34.637353+05	37	HDMU6482175	3		12	1
165	2021-12-06 11:34:34.638382+05	36	GESU5096843	3		12	1
166	2021-12-06 11:34:34.639354+05	35	CCLU6523612	3		12	1
167	2021-12-06 11:34:34.639354+05	34	CLHU8325827	3		12	1
168	2021-12-06 11:34:34.640353+05	33	SNBU7002133	3		12	1
169	2021-12-06 11:34:34.640353+05	32	BHCU4923000	3		12	1
170	2021-12-06 11:34:34.641354+05	31	CBHU1472750	3		12	1
171	2021-12-06 11:34:34.641354+05	30	YHLU1379191	3		12	1
172	2021-12-06 11:34:34.642353+05	29	CCLU6698729	3		12	1
173	2021-12-06 11:34:34.642353+05	28	HDMU6453304	3		12	1
174	2021-12-06 11:34:34.643353+05	27	INKU2624944	3		12	1
175	2021-12-06 11:34:34.643353+05	26	CBHU8228679	3		12	1
176	2021-12-06 11:34:34.644353+05	25	TRLU5789394	3		12	1
177	2021-12-06 11:34:34.644353+05	24	TDRU0621606	3		12	1
178	2021-12-06 11:34:34.645383+05	23	EMCU9738538	3		12	1
179	2021-12-06 11:34:34.646354+05	22	CBHU1483728	3		12	1
180	2021-12-06 11:34:34.646354+05	21	TCNU9499386	3		12	1
181	2021-12-06 11:34:34.647354+05	20	RJXU4014230	3		12	1
182	2021-12-06 11:34:34.647354+05	19	EISU9035585	3		12	1
183	2021-12-06 11:34:34.648352+05	18	YMLU8379240	3		12	1
184	2021-12-06 11:34:34.648352+05	17	EOLU8072350	3		12	1
185	2021-12-06 11:34:34.649357+05	16	TCKU9388602	3		12	1
186	2021-12-06 11:34:34.649357+05	15	TCNU9674473	3		12	1
187	2021-12-06 11:34:34.650807+05	14	TGHU8689510	3		12	1
188	2021-12-06 11:34:34.651303+05	13	TRIU9195797	3		12	1
189	2021-12-06 11:34:34.651303+05	12	HRSU4602033	3		12	1
190	2021-12-06 11:34:34.652309+05	11	CLHU8577027	3		12	1
191	2021-12-06 11:34:34.652309+05	10	PAAU4501960	3		12	1
192	2021-12-06 11:34:34.653309+05	9	MOLU1122652	3		12	1
193	2021-12-06 11:34:34.653309+05	8	LYGU4021067	3		12	1
194	2021-12-06 11:34:34.65431+05	7	OOLU8252979	3		12	1
195	2021-12-06 11:34:34.655312+05	6	TRLU6749375	3		12	1
196	2021-12-06 11:34:34.655312+05	5	CCLU6909858	3		12	1
197	2021-12-06 11:34:34.656309+05	4	INKU2227042	3		12	1
198	2021-12-06 11:34:34.656309+05	3	CKCU6000013	3		12	1
199	2021-12-06 11:34:34.657309+05	2	CAXU9837500	3		12	1
200	2021-12-06 11:34:34.657309+05	1	LYGU4020815	3		12	1
201	2021-12-06 11:47:28.059974+05	48	CCLU6909858	1	[{"added": {}}]	12	1
202	2021-12-06 11:59:55.302138+05	4	BHCU4923000	1	[{"added": {}}]	14	1
203	2021-12-06 12:00:10.231605+05	49	BHCU4923000	1	[{"added": {}}]	12	1
204	2021-12-06 12:10:06.833005+05	50	BHCU4923000	1	[{"added": {}}]	12	1
205	2021-12-06 12:22:44.324831+05	52	CCLU6909858	1	[{"added": {}}]	12	1
206	2021-12-06 12:34:44.471824+05	53	BHCU4923000	1	[{"added": {}}]	12	1
207	2021-12-06 12:38:27.280545+05	48	CCLU6909858	2	[]	13	1
208	2021-12-06 12:43:07.940089+05	49	CAXU9837500	1	[{"added": {}}]	13	1
209	2021-12-06 12:43:59.290569+05	54	CAXU9837500	1	[{"added": {}}]	12	1
210	2021-12-06 12:44:39.362351+05	53	BHCU4923000	2	[{"changed": {"fields": ["Arrived"]}}]	12	1
211	2021-12-06 12:45:02.019725+05	54	CAXU9837500	2	[{"changed": {"fields": ["Arrived"]}}]	12	1
212	2021-12-06 12:45:05.889619+05	53	BHCU4923000	2	[]	12	1
213	2021-12-06 12:45:27.756837+05	53	BHCU4923000	2	[{"changed": {"fields": ["Arrived"]}}]	12	1
214	2021-12-06 12:48:33.59836+05	49	CAXU9837500	2	[]	13	1
215	2021-12-06 12:58:37.186883+05	55	BHCU4923000	1	[{"added": {}}]	12	1
216	2021-12-06 12:59:14.619792+05	53	BHCU4923000	3		12	1
217	2021-12-06 13:11:54.902876+05	7	GESU5096843	1	[{"added": {}}]	14	1
218	2021-12-06 14:07:12.648733+05	11	BHCU4923000	3		18	1
219	2021-12-06 14:09:02.194119+05	56	CCLU6909858	1	[{"added": {}}]	12	1
220	2021-12-06 14:54:52.437452+05	53	GESU5096843	3		13	1
221	2021-12-06 14:54:52.446585+05	52	CAXU9837500	3		13	1
222	2021-12-06 14:54:52.446585+05	51	CCLU6909858	3		13	1
223	2021-12-06 14:57:11.717507+05	4	BHCU4923000	2	[{"changed": {"fields": ["Arrived"]}}]	14	1
224	2021-12-06 14:57:24.872492+05	9	CAXU9837500	1	[{"added": {}}]	14	1
225	2021-12-06 15:07:16.432053+05	57	BHCU4923000	1	[{"added": {}}]	12	1
226	2021-12-06 15:18:32.891312+05	58	CAXU9837500	1	[{"added": {}}]	12	1
227	2021-12-06 15:18:53.971757+05	2	Xian 100	1	[{"added": {}}]	7	1
228	2021-12-06 15:19:29.093816+05	57	BHCU4923000	2	[{"changed": {"fields": ["Train"]}}]	12	1
229	2021-12-06 15:19:31.983402+05	57	BHCU4923000	2	[{"changed": {"fields": ["Train"]}}]	12	1
230	2021-12-06 16:02:43.681189+05	58	CAXU9837500	3		12	1
231	2021-12-06 16:02:55.354675+05	9	CAXU9837500	2	[{"changed": {"fields": ["Arrived"]}}]	14	1
232	2021-12-06 16:03:00.721689+05	4	BHCU4923000	2	[{"changed": {"fields": ["Arrived"]}}]	14	1
233	2021-12-06 16:03:25.545196+05	59	CAXU9837500	1	[{"added": {}}]	12	1
234	2021-12-06 16:03:34.616502+05	60	BHCU4923000	1	[{"added": {}}]	12	1
235	2021-12-06 16:25:44.118612+05	3	test1	1	[{"added": {}}]	7	1
236	2021-12-06 16:25:46.822638+05	61	CAXU9837500	1	[{"added": {}}]	12	1
237	2021-12-06 16:25:54.570622+05	62	BHCU4923000	1	[{"added": {}}]	12	1
238	2021-12-06 17:06:21.587637+05	2	admin	1	[{"added": {}}]	16	1
239	2021-12-06 17:08:10.56574+05	4	BHCU4923000	2	[]	14	1
240	2021-12-06 17:13:00.927685+05	1	Jasur	2	[]	16	1
241	2021-12-06 18:34:42.127224+05	3	XIAN	1	[{"added": {}}]	2	1
242	2021-12-06 18:34:56.871559+05	1	XIAN	1	[{"added": {}}]	19	1
243	2021-12-07 13:01:37.185879+05	4	QingdaoHYTrans	1	[{"added": {}}]	2	1
244	2021-12-07 13:01:47.463832+05	2	QingdaoHYTrans	1	[{"added": {}}]	19	1
245	2021-12-07 13:02:20.594749+05	5	InterRailChina	1	[{"added": {}}]	2	1
246	2021-12-07 13:02:24.513189+05	3	InterRailChina	1	[{"added": {}}]	19	1
247	2021-12-07 16:14:00.795562+05	1	XIAN	2	[{"changed": {"fields": ["Containers"]}}]	19	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	user
3	auth	group
4	auth	permission
5	contenttypes	contenttype
6	sessions	session
7	train	train
8	railway_bill	railwaybill
9	railway_bill	container
10	container_status	containerdocument
11	container_status	sealimage
12	container_status	containerstatus
13	container_status	waitinglist
14	terminal	containerinterminal
15	terminal	terminal
16	staff	staff
17	terminal	containerinterminalsealimage
18	terminal	containerinterminaldocument
19	staff	client
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-12-03 13:06:59.223328+05
2	auth	0001_initial	2021-12-03 13:06:59.379741+05
3	admin	0001_initial	2021-12-03 13:06:59.410986+05
4	admin	0002_logentry_remove_auto_add	2021-12-03 13:06:59.426609+05
5	admin	0003_logentry_add_action_flag_choices	2021-12-03 13:06:59.442207+05
6	contenttypes	0002_remove_content_type_name	2021-12-03 13:06:59.47346+05
7	auth	0002_alter_permission_name_max_length	2021-12-03 13:06:59.489083+05
8	auth	0003_alter_user_email_max_length	2021-12-03 13:06:59.504708+05
9	auth	0004_alter_user_username_opts	2021-12-03 13:06:59.520333+05
10	auth	0005_alter_user_last_login_null	2021-12-03 13:06:59.535958+05
11	auth	0006_require_contenttypes_0002	2021-12-03 13:06:59.535958+05
12	auth	0007_alter_validators_add_error_messages	2021-12-03 13:06:59.551583+05
13	auth	0008_alter_user_username_max_length	2021-12-03 13:06:59.582832+05
14	auth	0009_alter_user_last_name_max_length	2021-12-03 13:06:59.582832+05
15	auth	0010_alter_group_name_max_length	2021-12-03 13:06:59.598456+05
16	auth	0011_update_proxy_permissions	2021-12-03 13:06:59.614081+05
17	auth	0012_alter_user_first_name_max_length	2021-12-03 13:06:59.629705+05
18	sessions	0001_initial	2021-12-03 13:06:59.645328+05
19	staff	0001_initial	2021-12-03 15:10:32.799052+05
20	terminal	0001_initial	2021-12-03 15:10:32.823702+05
21	train	0001_initial	2021-12-03 15:10:32.854951+05
22	railway_bill	0001_initial	2021-12-03 15:10:32.886235+05
23	container_status	0001_initial	2021-12-03 15:11:18.447209+05
24	terminal	0002_containerinterminal_container	2021-12-03 15:14:47.202498+05
25	terminal	0003_containerinterminaldocument_containerinterminalsealimage	2021-12-03 15:41:52.412618+05
26	railway_bill	0002_alter_container_weight_type_code	2021-12-06 11:33:00.47147+05
27	container_status	0002_auto_20211206_1140	2021-12-06 11:40:27.391399+05
28	container_status	0003_auto_20211206_1219	2021-12-06 12:19:18.110978+05
29	container_status	0004_auto_20211206_1259	2021-12-06 12:59:22.132102+05
30	container_status	0005_alter_containerstatus_container_in_waiting_list	2021-12-06 12:59:48.852878+05
31	container_status	0006_auto_20211206_1422	2021-12-06 14:49:16.666334+05
32	terminal	0004_containerinterminal_arrived	2021-12-06 14:49:16.684366+05
33	container_status	0007_delete_waitinglist	2021-12-06 17:54:07.441136+05
34	staff	0002_auto_20211206_1832	2021-12-06 18:32:24.89616+05
35	staff	0003_alter_client_containers	2021-12-06 18:32:24.908354+05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
10m0lcke6zy44amfd1zvkr0276vm7q3i	.eJxVjMsOwiAQRf-FtSFQKA-X7v0GMsMMUjU0Ke3K-O_apAvd3nPOfYkE21rT1nlJE4mz0OL0uyHkB7cd0B3abZZ5busyodwVedAurzPx83K4fwcVev3W0QYDABwjGwU4IjmjGFwogFkTlMErMF7ZgjgYbVGzIraBPOrRuCLeHwWNOKU:1muyU8:cslt2EMDN52KiN4UvEyZUjceFF0dxmcDpA_PUoyiFno	2021-12-22 20:03:56.53491+05
lly5ux3y2ecxczbr1s14ivvt1zbcb8o8	.eJxVjMsOwiAQRf-FtSFQKA-X7v0GMsMMUjU0Ke3K-O_apAvd3nPOfYkE21rT1nlJE4mz0OL0uyHkB7cd0B3abZZ5busyodwVedAurzPx83K4fwcVev3W0QYDABwjGwU4IjmjGFwogFkTlMErMF7ZgjgYbVGzIraBPOrRuCLeHwWNOKU:1mvC7Z:O7bXBrtDjDotqF0NhSyvd50GTej_eD5u3AJROjF7n_I	2021-12-23 10:37:33.634337+05
\.


--
-- Data for Name: railway_bill_container; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.railway_bill_container (id, name, weight_type, weight_type_code) FROM stdin;
5	CCLU6909858	(40,)	45G1
6	TRLU6749375	(40,)	45G1
7	OOLU8252979	(40,)	45G1
8	LYGU4021067	(40,)	45G1
50	PCIU4588232	(40,)	45G1
23	EMCU9738538	(40,)	45G1
24	TDRU0621606	(40,)	45G1
25	TRLU5789394	(40,)	45G1
26	CBHU8228679	(40,)	45G1
27	INKU2624944	(40,)	45G1
28	HDMU6453304	(40,)	45G1
29	CCLU6698729	(40,)	45G1
30	YHLU1379191	(40,)	45G1
31	CBHU1472750	(40,)	45G1
32	BHCU4923000	(40,)	45G1
33	SNBU7002133	(40,)	45G1
34	CLHU8325827	(40,)	45G1
35	CCLU6523612	(40,)	45G1
36	GESU5096843	(40,)	45G1
37	HDMU6482175	(40,)	45G1
38	WSCU7820749	(40,)	45G1
39	TGHU9031170	(40,)	45G1
41	GESU4963127	(40,)	45G1
42	TCKU9278821	(40,)	45G1
43	WSCU9982040	(40,)	45G1
44	TGHU8709068	(40,)	45G1
45	SGRU5004828	(40,)	45G1
46	WEDU8122800	(40,)	45G1
68	TDRU5482801	(40,)	45G1
40	TRLU5511401	(40,)	45G1
69	CBHU8170031	(40,)	45G1
70	UESU5259287	(40,)	45G1
9	MOLU1122652	(40,)	45G1
71	TRLU5918378	(40,)	45G1
72	EMCU9458223	(40,)	45G1
73	HMCU9026665	(40,)	45G1
74	TGHU8569156	(40,)	45G1
75	CRXU9274696	(40,)	45G1
76	ZNU8014001	(40,)	45G1
77	CZZU0428201	(40,)	45G1
78	ZCSU8389202	(40,)	45G1
79	TGHU9301933	(40,)	45G1
80	MIGU5417894	(40,)	45G1
81	FSCU9067200	(40,)	45G1
82	PCIU9954756	(40,)	45G1
83	CCLU6050422	(40,)	45G1
84	CCLU6885020	(40,)	45G1
86	WCIU8317848	(40,)	45G1
87	NYKU5432618	(40,)	45G1
88	CLHU8940322	(40,)	45G1
89	EGSU9029552	(40,)	45G1
90	GESU5980598	(40,)	45G1
91	EKBU9466467	(40,)	45G1
92	HJMU1931103	(40,)	45G1
93	WSCU9910224	(40,)	45G1
94	TGHU8958965	(40,)	45G1
95	BSIU9069113	(40,)	45G1
96	YMLU8413895	(40,)	45G1
97	MCIU8268026	(40,)	45G1
98	KFSU6207540	(40,)	45G1
10	PAAU4501960	(40,)	45G1
1	LYGU4020815	(40,)	45G1
2	CAXU9837500	(40,)	45G1
3	CKCU6000013	(40,)	45G1
11	CLHU8577027	(40,)	45G1 (32500)
12	HRSU4602033	(40,)	45G1 (32500)
13	TRIU9195797	(40,)	45G1
14	TGHU8689510	(40,)	45G1
15	TCNU9674473	(40,)	45G1
16	TCKU9388602	(40,)	45G1
17	EOLU8072350	(40,)	45G1
18	YMLU8379240	(40,)	45G1
19	EISU9035585	(40,)	42G1
20	RJXU4014230	(40,)	42G1
21	TCNU9499386	(40,)	42G1
22	CBHU1483728	(40,)	42G1
51	TGHU4081775	(40,)	45G1
52	TDRU8244767	(40,)	45G1
47	CAXU9616238	(40,)	45G1
48	WSCU7624999	(40,)	45G1
49	EPHU6005135	(40,)	45G1
53	WSCU9913590	(40,)	45G1
54	EMCU9735312	(40,)	45G1
55	CCLU6931580	(40,)	45G1
56	SFCU2122874	(40,)	45G1
57	CCLU7535285	(40,)	45G1
58	TCKU9040598	(40,)	45G1
59	CCLU7128628	(40,)	45G1
60	RRMU8501815	(40,)	45G1
61	CRXU9805658	(40,)	45G1
62	HDMU6499603	(40,)	45G1
63	JZPU5006355	(40,)	45G1
85	HJCU1402440	(40,)	45G1
64	HJMU1919828	(40,)	45G1
4	INKU2227042	(40,)	45G1
65	BYWU8111776	(40,)	45G1
66	PXDU1931172	(40,)	45G1
67	GESU5254297	(40,)	45G1
\.


--
-- Data for Name: railway_bill_railwaybill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.railway_bill_railwaybill (id, railway_code, sender, departure_station, sender_statement, recipient, destination_station, border_crossing_stations, railway_carriage, shipping_name, container_owner, type_of_packaging, number_of_seats, net, tara, gross, seals, seal_quantity, submerged, method_of_determining_mass, payment_of_legal_fees, carriers, documents_by_sender, additional_information, custom_seal, inspector_name, date, file, file_original, container_id, train_id) FROM stdin;
307		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530/10	26558.3	3900	30458.3	U2525706-21  0009837		Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47047\nПо КЗХ ТОО «PTC Cargo» код 2744590/3672\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2688152	Уроков Ж.	04       2021    11    12	documents/draft/test4_CAXU9616238.docx	documents/original/test4_CAXU9616238.docx	47	7
308		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525710-21  0009834		Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47048\nПо КЗХ ТОО «PTC Cargo» код 2744590/3673\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2688151	Уроков Ж.	04       2021    11    12	documents/draft/test4_WSCU7624999.docx	documents/original/test4_WSCU7624999.docx	48	7
309		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525997-21  0009738		Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47049\nПо КЗХ ТОО «PTC Cargo» код 2744590/3674\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2583392	Уроков Ж.	04       2021    11    12	documents/draft/test4_EPHU6005135.docx	documents/original/test4_EPHU6005135.docx	49	7
310		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525993-21  0009772	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47050\nПо КЗХ ТОО «PTC Cargo» код 2744590/3675\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2583440	Уроков Ж.	04       2021    11    12	documents/draft/test4_PCIU4588232.docx	documents/original/test4_PCIU4588232.docx	50	7
311		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525982-21  0009756	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47051\nПо КЗХ ТОО «PTC Cargo» код 2744590/3676\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2583438	Уроков Ж.	04       2021    11    12	documents/draft/test4_TGHU4081775.docx	documents/original/test4_TGHU4081775.docx	51	7
312		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525981-21  0009774	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47052\nПо КЗХ ТОО «PTC Cargo» код 2744590/3677\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2583437	Уроков Ж.	04       2021    11    12	documents/draft/test4_TDRU8244767.docx	documents/original/test4_TDRU8244767.docx	52	7
313		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525985-21  0009752	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47053\nПо КЗХ ТОО «PTC Cargo» код 2744590/3678\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2583436	Уроков Ж.	04       2021    11    12	documents/draft/test4_WSCU9913590.docx	documents/original/test4_WSCU9913590.docx	53	7
314		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525971-21  0009757	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47054\nПо КЗХ ТОО «PTC Cargo» код 2744590/3679\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2583444	Уроков Ж.		documents/draft/test4_EMCU9735312.docx	documents/original/test4_EMCU9735312.docx	54	7
315		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525954-21  0009755	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47055\nПо КЗХ ТОО «PTC Cargo» код 2744590/3680\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2583443	Уроков Ж.		documents/draft/test4_CCLU6931580.docx	documents/original/test4_CCLU6931580.docx	55	7
316		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525958-21  0009782	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47056\nПо КЗХ ТОО «PTC Cargo» код 2744590/3681\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2583483	Уроков Ж.	04       2021    11    12	documents/draft/test4_SFCU2122874.docx	documents/original/test4_SFCU2122874.docx	56	7
317		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525725-21  0009783	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47057\nПо КЗХ ТОО «PTC Cargo» код 2744590/3682\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2583484	Уроков Ж.	04       2021    11    12	documents/draft/test4_CCLU7535285.docx	documents/original/test4_CCLU7535285.docx	57	7
318		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525702-21  0009815	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47058\nПо КЗХ ТОО «PTC Cargo» код 2744590/3683\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2688077	Уроков Ж.	04       2021    11    12	documents/draft/test4_TCKU9040598.docx	documents/original/test4_TCKU9040598.docx	58	7
319		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526974-21  0010133	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47059\nПо КЗХ ТОО «PTC Cargo» код 2744590/3684\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689443	Уроков Ж.	04       2021    11    12	documents/draft/test4_CCLU7128628.docx	documents/original/test4_CCLU7128628.docx	59	7
320		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526997-21  0010131	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47060\nПо КЗХ ТОО «PTC Cargo» код 2744590/3685\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689441	Уроков Ж.	04       2021    11    12	documents/draft/test4_RRMU8501815.docx	documents/original/test4_RRMU8501815.docx	60	7
321		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525852-21  0010161	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47061\nПо КЗХ ТОО «PTC Cargo» код 2744590/3686\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2746022	Уроков Ж.	04       2021    11    12	documents/draft/test4_CRXU9805658.docx	documents/original/test4_CRXU9805658.docx	61	7
322		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往菲律宾达沃 Transport  to Davao city, Philippines via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2748643-21\n0010202	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47062\nПо КЗХ ТОО «PTC Cargo» код 2744590/3687\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2746052	Уроков Ж.	04       2021    11    12	documents/draft/test4_HDMU6499603.docx	documents/original/test4_HDMU6499603.docx	62	7
323		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526995-21  0010128	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47063\nПо КЗХ ТОО «PTC Cargo» код 2744590/3688\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689438	Уроков Ж.	04       2021    11    12	documents/draft/test4_JZPU5006355.docx	documents/original/test4_JZPU5006355.docx	63	7
324		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526977-21  0010140	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47064\nПо КЗХ ТОО «PTC Cargo» код 2744590/3689\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689452	Уроков Ж.	04       2021    11    12	documents/draft/test4_HJMU1919828.docx	documents/original/test4_HJMU1919828.docx	64	7
325		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526969-21  0010132	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47065\nПо КЗХ ТОО «PTC Cargo» код 2744590/3690\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689439	Уроков Ж.	04       2021    11    12	documents/draft/test4_BYWU8111776.docx	documents/original/test4_BYWU8111776.docx	65	7
326		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526994-21  0010146	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47066\nПо КЗХ ТОО «PTC Cargo» код 2744590/3691\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689457	Уроков Ж.	04       2021    11    12	documents/draft/test4_PXDU1931172.docx	documents/original/test4_PXDU1931172.docx	66	7
327		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2527259-21  0010136	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47067\nПо КЗХ ТОО «PTC Cargo» код 2744590/3692\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689442	Уроков Ж.	04       2021    11    12	documents/draft/test4_GESU5254297.docx	documents/original/test4_GESU5254297.docx	67	7
328		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2478639-21  0010143	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47068\nПо КЗХ ТОО «PTC Cargo» код 2744590/3693\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689453	Уроков Ж.	04       2021    11    12	documents/draft/test4_TDRU5482801.docx	documents/original/test4_TDRU5482801.docx	68	7
329		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526976-21  0010142	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47069\nПо КЗХ ТОО «PTC Cargo» код 2744590/3694\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689454	Уроков Ж.	04       2021    11    12	documents/draft/test4_CBHU8170031.docx	documents/original/test4_CBHU8170031.docx	69	7
330		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526998-21  0010135	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47070\nПо КЗХ ТОО «PTC Cargo» код 2744590/3695\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689445	Уроков Ж.	04       2021    11    12	documents/draft/test4_UESU5259287.docx	documents/original/test4_UESU5259287.docx	70	7
331		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526981-21  0010138	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47071\nПо КЗХ ТОО «PTC Cargo» код 2744590/3696\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689449	Уроков Ж.	04       2021    11    12	documents/draft/test4_TRLU5918378.docx	documents/original/test4_TRLU5918378.docx	71	7
332		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526958-21  0010169	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47072\nПо КЗХ ТОО «PTC Cargo» код 2744590/3697\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689495	Уроков Ж.	04       2021    11    12	documents/draft/test4_EMCU9458223.docx	documents/original/test4_EMCU9458223.docx	72	7
333		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2522448-21  0010134	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47073\nПо КЗХ ТОО «PTC Cargo» код 2744590/3698\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689444	Уроков Ж.	04       2021    11    12	documents/draft/test4_HMCU9026665.docx	documents/original/test4_HMCU9026665.docx	73	7
334		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526988-21  0010118	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47074\nПо КЗХ ТОО «PTC Cargo» код 2744590/3699\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689416	Уроков Ж.		documents/draft/test4_TGHU8569156.docx	documents/original/test4_TGHU8569156.docx	74	7
335		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2527232-21  0010119	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47075\nПо КЗХ ТОО «PTC Cargo» код 2744590/3700\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689415	Уроков Ж.	04       2021    11    12	documents/draft/test4_CRXU9274696.docx	documents/original/test4_CRXU9274696.docx	75	7
336		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2527224-21  0010120	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47076\nПо КЗХ ТОО «PTC Cargo» код 2744590/3701\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689414	Уроков Ж.	04       2021    11    12	documents/draft/test4_ZNU8014001.docx	documents/original/test4_ZNU8014001.docx	76	7
337		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526965-21  0010167	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47077\nПо КЗХ ТОО «PTC Cargo» код 2744590/3702\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689496	Уроков Ж.	04       2021    11    12	documents/draft/test4_CZZU0428201.docx	documents/original/test4_CZZU0428201.docx	77	7
338		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526978-21  0010141	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47078\nПо КЗХ ТОО «PTC Cargo» код 2744590/3703\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689455	Уроков Ж.	04       2021    11    12	documents/draft/test4_ZCSU8389202.docx	documents/original/test4_ZCSU8389202.docx	78	7
339		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526957-21  0010168	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47079\nПо КЗХ ТОО «PTC Cargo» код 2744590/3704\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689499	Уроков Ж.	04       2021    11    12	documents/draft/test4_TGHU9301933.docx	documents/original/test4_TGHU9301933.docx	79	7
340		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525896-21  0010185	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47080\nПо КЗХ ТОО «PTC Cargo» код 2744590/3705\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2746002	Уроков Ж.	04       2021    11    12	documents/draft/test4_MIGU5417894.docx	documents/original/test4_MIGU5417894.docx	80	7
341		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525895-21  0010184	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47081\nПо КЗХ ТОО «PTC Cargo» код 2744590/3706\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2746003	Уроков Ж.	04       2021    11    12	documents/draft/test4_FSCU9067200.docx	documents/original/test4_FSCU9067200.docx	81	7
342		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2527206-21  0010000	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47082\nПо КЗХ ТОО «PTC Cargo» код 2744590/3707\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689417	Уроков Ж.	04       2021    11    12	documents/draft/test4_PCIU9954756.docx	documents/original/test4_PCIU9954756.docx	82	7
343		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525899-21 U2525900-21  0010176	4.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47083\nПо КЗХ ТОО «PTC Cargo» код 2744590/3708\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2746004	Уроков Ж.	04       2021    11    12	documents/draft/test4_CCLU6050422.docx	documents/original/test4_CCLU6050422.docx	83	7
344		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526951-21  0010144	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47084\nПо КЗХ ТОО «PTC Cargo» код 2744590/3709\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689456	Уроков Ж.	04       2021    11    12	documents/draft/test4_CCLU6885020.docx	documents/original/test4_CCLU6885020.docx	84	7
345		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525866-21  0010190	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47085\nПо КЗХ ТОО «PTC Cargo» код 2744590/3710\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2746015	Уроков Ж.	04       2021    11    12	documents/draft/test4_HJCU1402440.docx	documents/original/test4_HJCU1402440.docx	85	7
346		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526959-21  0010176	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47086\nПо КЗХ ТОО «PTC Cargo» код 2744590/3711\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689491	Уроков Ж.	04       2021    11    12	documents/draft/test4_WCIU8317848.docx	documents/original/test4_WCIU8317848.docx	86	7
347		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525894-21  0010183	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47087\nПо КЗХ ТОО «PTC Cargo» код 2744590/3712\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2746014	Уроков Ж.	04       2021    11    12	documents/draft/test4_NYKU5432618.docx	documents/original/test4_NYKU5432618.docx	87	7
348		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526956-21  0010171	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47088\nПо КЗХ ТОО «PTC Cargo» код 2744590/3713\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689494	Уроков Ж.	04       2021    11    12	documents/draft/test4_CLHU8940322.docx	documents/original/test4_CLHU8940322.docx	88	7
349		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526954-21  0010178	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47089\nПо КЗХ ТОО «PTC Cargo» код 2744590/3714\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2746006	Уроков Ж.	04       2021    11    12	documents/draft/test4_EGSU9029552.docx	documents/original/test4_EGSU9029552.docx	89	7
350		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525890-21  0010177	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47090\nПо КЗХ ТОО «PTC Cargo» код 2744590/3715\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2746005	Уроков Ж.	04       2021    11    12	documents/draft/test4_GESU5980598.docx	documents/original/test4_GESU5980598.docx	90	7
351		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526972-21  0010173	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47091\nПо КЗХ ТОО «PTC Cargo» код 2744590/3716\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689493	Уроков Ж.	04       2021    11    12	documents/draft/test4_EKBU9466467.docx	documents/original/test4_EKBU9466467.docx	91	7
352		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525886-21  0010175	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47092\nПо КЗХ ТОО «PTC Cargo» код 2744590/3717\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689492	Уроков Ж.	04       2021    11    12	documents/draft/test4_HJMU1931103.docx	documents/original/test4_HJMU1931103.docx	92	7
353		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526953-21  0010172	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47093\nПо КЗХ ТОО «PTC Cargo» код 2744590/3718\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689497	Уроков Ж.	04       2021    11    12	documents/draft/test4_WSCU9910224.docx	documents/original/test4_WSCU9910224.docx	93	7
354		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525898-21  0010186	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47094\nПо КЗХ ТОО «PTC Cargo» код 2744590/3719\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2746016	Уроков Ж.	04       2021    11    12	documents/draft/test4_TGHU8958965.docx	documents/original/test4_TGHU8958965.docx	94	7
355		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525874-21  0010187	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47095\nПо КЗХ ТОО «PTC Cargo» код 2744590/3720\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2746017	Уроков Ж.	04       2021    11    12	documents/draft/test4_BSIU9069113.docx	documents/original/test4_BSIU9069113.docx	95	7
356		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2525891-21   U2525872-21   U2525884-21  0010189	5.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47096\nПо КЗХ ТОО «PTC Cargo» код 2744590/3721\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2746021	Уроков Ж.	04       2021    11    12	documents/draft/test4_YMLU8413895.docx	documents/original/test4_YMLU8413895.docx	96	7
357		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2526955-21  0010174	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47097\nПо КЗХ ТОО «PTC Cargo» код 2744590/3722\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2689498	Уроков Ж.	04       2021    11    12	documents/draft/test4_MCIU8268026.docx	documents/original/test4_MCIU8268026.docx	97	7
358		ООО"Uzkimyoimpeks" Республика Узбекистан, 100011, г.Ташкент, Шайхантахурский р-н,ул.Навои № 38.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal TransportCo.，Ltd. (002) SHILEI 18509005000 委托中铁国际多式联运有限公司(002) 负责转关，经中国过境运往越南胡志明 Transport to Ho Chi Minh City,Viet Nam via China 博报 石磊 18509005000	Lianyungang China-Kazakhstan International Logistics Co.,Ltd Xugoumiaoling area lianyungang city jiangsu province china. TEL:86 0518 8238 2660 连云港中哈国际物流有限公司	27 КЗХ ст.Алтынколь-эксп КЗХ далее в Китай КЖД/ст. порт Ляньюньган port station 385050 连云港港口, для дальнейшей отправки морским транспортом в порт Лаем Чабанг, Таиланд	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230		Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500	This empty container belongs to “Beijing Silk Road International Logisitcs Co. Ltd“ . Contact number: 18601957903	мешки	530	26558.3	3900	30458.3	U2478611-21  0010224	3.0	Отправитель	на весах	По УТИ УЗЖДК код 2915557 / 47098\nПо КЗХ ТОО «PTC Cargo» код 2744590/3723\nПо КЖД ч/з CRIMT	30   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Ляньюньган       385050	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Сертификат качества\n6. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г.                                                                                                                                       中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（002）办理转关手续	2746068	Уроков Ж.	04       2021    11    12	documents/draft/test4_KFSU6207540.docx	documents/original/test4_KFSU6207540.docx	98	7
359		“JIZZAKH AGRITRADE”JV LLC\nAddress: 16-14,Sh.Rashidov street,DustlikMFY,Pakhtakor District,Jizzakh,Republic of Uzbekistan	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	北京奥信化工科技发展有限责任公司 <<BEIJING AUXIN CHEMICAL TECHNOLOGY LTD>> Floor 17 Norinco International Plaza,No.6 zhengda Road Shijingshan District Beijing China	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Очищенный маш\nPurified Green Mung Beans\nЕТСНГ-583046                                         \nГНГ-0713310001 \nТНВЭД-0713310001		мешки	520	20652.0	3730	24382.0	U2541201-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2728230			documents/draft/test5_LYGU4020815.docx	documents/original/test5_LYGU4020815.docx	1	8
360		“JIZZAKH AGRITRADE”JV LLC\nAddress: 16-14,Sh.Rashidov street,DustlikMFY,Pakhtakor District,Jizzakh,Republic of Uzbekistan	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	北京奥信化工科技发展有限责任公司 <<BEIJING AUXIN CHEMICAL TECHNOLOGY LTD>> Floor 17 Norinco International Plaza,No.6 zhengda Road Shijingshan District Beijing China	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Очищенный маш\nPurified Green Mung Beans\nЕТСНГ-583046                                         \nГНГ-0713310001 \nТНВЭД-0713310001		мешки	520	20652.0	3920	24572.0	U2541225-21\nU2541205-21	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2728221			documents/draft/test5_CAXU9837500.docx	documents/original/test5_CAXU9837500.docx	2	8
361		“JIZZAKH AGRITRADE”JV LLC\nAddress: 16-14,Sh.Rashidov street,DustlikMFY,Pakhtakor District,Jizzakh,Republic of Uzbekistan	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	北京奥信化工科技发展有限责任公司 <<BEIJING AUXIN CHEMICAL TECHNOLOGY LTD>> Floor 17 Norinco International Plaza,No.6 zhengda Road Shijingshan District Beijing China	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Очищенный маш\nPurified Green Mung Beans\nЕТСНГ-583046                                         \nГНГ-0713310001 \nТНВЭД-0713310001		мешки	520	20652.0	3930	24582.0	U2554926-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2728228			documents/draft/test5_CKCU6000013.docx	documents/original/test5_CKCU6000013.docx	3	8
362		“JIZZAKH AGRITRADE”JV LLC\nAddress: 16-14,Sh.Rashidov street,DustlikMFY,Pakhtakor District,Jizzakh,Republic of Uzbekistan	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	北京奥信化工科技发展有限责任公司 <<BEIJING AUXIN CHEMICAL TECHNOLOGY LTD>> Floor 17 Norinco International Plaza,No.6 zhengda Road Shijingshan District Beijing China	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Очищенный маш\nPurified Green Mung Beans\nЕТСНГ-583046                                         \nГНГ-0713310001 \nТНВЭД-0713310001		мешки	520	20652.0	3900	24552.0	U2550794-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2728229			documents/draft/test5_INKU2227042.docx	documents/original/test5_INKU2227042.docx	4	8
363		“JIZZAKH AGRITRADE”JV LLC\nAddress: 16-14,Sh.Rashidov street,DustlikMFY,Pakhtakor District,Jizzakh,Republic of Uzbekistan	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	北京奥信化工科技发展有限责任公司 <<BEIJING AUXIN CHEMICAL TECHNOLOGY LTD>> Floor 17 Norinco International Plaza,No.6 zhengda Road Shijingshan District Beijing China	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Очищенный маш\nPurified Green Mung Beans\nЕТСНГ-583046                                         \nГНГ-0713310001 \nТНВЭД-0713310001		мешки	520	20652.0	3890	24542.0	U2554905-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2728223			documents/draft/test5_CCLU6909858.docx	documents/original/test5_CCLU6909858.docx	5	8
364		“JIZZAKH AGRITRADE”JV LLC\nAddress: 16-14,Sh.Rashidov street,DustlikMFY,Pakhtakor District,Jizzakh,Republic of Uzbekistan	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	北京奥信化工科技发展有限责任公司 <<BEIJING AUXIN CHEMICAL TECHNOLOGY LTD>> Floor 17 Norinco International Plaza,No.6 zhengda Road Shijingshan District Beijing China	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Очищенный маш\nPurified Green Mung Beans\nЕТСНГ-583046                                         \nГНГ-0713310001 \nТНВЭД-0713310001		мешки	520	20652.0	3860	24512.0	U2554925-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2728227			documents/draft/test5_TRLU6749375.docx	documents/original/test5_TRLU6749375.docx	6	8
365		“JIZZAKH AGRITRADE”JV LLC\nAddress: 16-14,Sh.Rashidov street,DustlikMFY,Pakhtakor District,Jizzakh,Republic of Uzbekistan	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	北京奥信化工科技发展有限责任公司 <<BEIJING AUXIN CHEMICAL TECHNOLOGY LTD>> Floor 17 Norinco International Plaza,No.6 zhengda Road Shijingshan District Beijing China	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Очищенный маш\nPurified Green Mung Beans\nЕТСНГ-583046                                         \nГНГ-0713310001 \nТНВЭД-0713310001		мешки	520	20652.0	3820	24472.0	U2554975-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2728224			documents/draft/test5_OOLU8252979.docx	documents/original/test5_OOLU8252979.docx	7	8
366		“JIZZAKH AGRITRADE”JV LLC\nAddress: 16-14,Sh.Rashidov street,DustlikMFY,Pakhtakor District,Jizzakh,Republic of Uzbekistan	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	北京奥信化工科技发展有限责任公司 <<BEIJING AUXIN CHEMICAL TECHNOLOGY LTD>> Floor 17 Norinco International Plaza,No.6 zhengda Road Shijingshan District Beijing China	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Очищенный маш\nPurified Green Mung Beans\nЕТСНГ-583046                                         \nГНГ-0713310001 \nТНВЭД-0713310001		мешки	520	20652.0	3730	24382.0	U2554941-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2728225			documents/draft/test5_LYGU4021067.docx	documents/original/test5_LYGU4021067.docx	8	8
367		“JIZZAKH AGRITRADE”JV LLC\nAddress: 16-14,Sh.Rashidov street,DustlikMFY,Pakhtakor District,Jizzakh,Republic of Uzbekistan	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	北京奥信化工科技发展有限责任公司 <<BEIJING AUXIN CHEMICAL TECHNOLOGY LTD>> Floor 17 Norinco International Plaza,No.6 zhengda Road Shijingshan District Beijing China	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Очищенный маш\nPurified Green Mung Beans\nЕТСНГ-583046                                         \nГНГ-0713310001 \nТНВЭД-0713310001		мешки	520	20652.0	3970	24622.0	U2555103-21\nU2541203-21	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2728226			documents/draft/test5_MOLU1122652.docx	documents/original/test5_MOLU1122652.docx	9	8
368		“JIZZAKH AGRITRADE”JV LLC\nAddress: 16-14,Sh.Rashidov street,DustlikMFY,Pakhtakor District,Jizzakh,Republic of Uzbekistan	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	北京奥信化工科技发展有限责任公司 <<BEIJING AUXIN CHEMICAL TECHNOLOGY LTD>> Floor 17 Norinco International Plaza,No.6 zhengda Road Shijingshan District Beijing China	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Очищенный маш\nPurified Green Mung Beans\nЕТСНГ-583046                                         \nГНГ-0713310001 \nТНВЭД-0713310001		мешки	520	20652.0	3890	24542.0	U2541204-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Сертификат происхождения\n5. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2728222			documents/draft/test5_PAAU4501960.docx	documents/original/test5_PAAU4501960.docx	10	8
369		JV LLS 《SOFITEL》\n\nRepublic of Uzbekistan ，Jizzakh region , Jizzakh city,the territory of free economic zones.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	SHANDONG ZHONGTIAN QUNQING NEW MATERIAL CO.,LTD\n山东中天群青新材料有限公司 \nRoom 1904,Office building, Bond zone, high technology Zone, Zibo GitY, Shandong Province, China  \n13581041926	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Ультрамарин\nBlue，powder，bag  群青：蓝色 粉末 袋装\nЕТСНГ-466533\nГНГ-3206410000\nТНВЭД-3206410000	Контейнер является собственностью  «HONGKONG TFP SUPPLY CHAIN CO.,LIMITED»  liucheng 13701744250	мешки	1056	26611.0	3900	30511.0	U2541239-21\nU2550551-21	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2728394			documents/draft/test5_CLHU8577027.docx	documents/original/test5_CLHU8577027.docx	11	8
370		JV LLS 《SOFITEL》\n\nRepublic of Uzbekistan ，Jizzakh region , Jizzakh city,the territory of free economic zones.	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	SHANDONG ZHONGTIAN QUNQING NEW MATERIAL CO.,LTD\n山东中天群青新材料有限公司 \nRoom 1904,Office building, Bond zone, high technology Zone, Zibo GitY, Shandong Province, China  \n13581041926	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Ультрамарин\nBlue，powder，bag  群青：蓝色 粉末 袋装\nЕТСНГ-466533\nГНГ-3206410000\nТНВЭД-3206410000	Контейнер является собственностью  «HONGKONG TFP SUPPLY CHAIN CO.,LIMITED»  liucheng 13701744250	мешки	1056	26611.0	3800	30411.0	U2555094-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2728219			documents/draft/test5_HRSU4602033.docx	documents/original/test5_HRSU4602033.docx	12	8
371		FE "NORTEX STYLE" LLC\nRepublic of Uzbekistan,Surxandarya Region,Jarkurgan city,N.Baymuradov street,№1	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	浙江义乌中国小商品城进出口有限公司 浙江省义乌市福田街道国际商务中心（银海路399号）2107-2110室\n“Zhejiang Yiwu China Commodity City Import and Export CO.,LTD.”\nAddress:Room 2107-2110,Futian street International Business Center,Yiwu City,Zhejiang Province,China(No.399 Yinhai Road)	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Х/б пряжа\ncotton yarn 棉纱\nЕТСНГ - 622132\nГНГ - 5205140000\nТНВЭД - 5205140000		мешки	882	20970.12	3840	24810.12	U2541300-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2686424			documents/draft/test5_TRIU9195797.docx	documents/original/test5_TRIU9195797.docx	13	8
372		FE "NORTEX STYLE" LLC\nRepublic of Uzbekistan,Surxandarya Region,Jarkurgan city,N.Baymuradov street,№1	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	浙江义乌中国小商品城进出口有限公司 浙江省义乌市福田街道国际商务中心（银海路399号）2107-2110室\n“Zhejiang Yiwu China Commodity City Import and Export CO.,LTD.”\nAddress:Room 2107-2110,Futian street International Business Center,Yiwu City,Zhejiang Province,China(No.399 Yinhai Road)	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Х/б пряжа\ncotton yarn 棉纱\nЕТСНГ - 622132\nГНГ - 5205140000\nТНВЭД - 5205140000		мешки	882	20970.12	3870	24840.12	U2541280-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2686425			documents/draft/test5_TGHU8689510.docx	documents/original/test5_TGHU8689510.docx	14	8
373		FE "NORTEX STYLE" LLC\nRepublic of Uzbekistan,Surxandarya Region,Jarkurgan city,N.Baymuradov street,№1	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	浙江义乌中国小商品城进出口有限公司 浙江省义乌市福田街道国际商务中心（银海路399号）2107-2110室\n“Zhejiang Yiwu China Commodity City Import and Export CO.,LTD.”\nAddress:Room 2107-2110,Futian street International Business Center,Yiwu City,Zhejiang Province,China(No.399 Yinhai Road)	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Х/б пряжа\ncotton yarn 棉纱\nЕТСНГ - 622132\nГНГ - 5205140000\nТНВЭД - 5205140000		мешки	882	20970.12	3840	24810.12	U2540966-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2686406			documents/draft/test5_TCNU9674473.docx	documents/original/test5_TCNU9674473.docx	15	8
374		FE "NORTEX STYLE" LLC\nRepublic of Uzbekistan,Surxandarya Region,Jarkurgan city,N.Baymuradov street,№1	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	浙江义乌中国小商品城进出口有限公司 浙江省义乌市福田街道国际商务中心（银海路399号）2107-2110室\n“Zhejiang Yiwu China Commodity City Import and Export CO.,LTD.”\nAddress:Room 2107-2110,Futian street International Business Center,Yiwu City,Zhejiang Province,China(No.399 Yinhai Road)	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Х/б пряжа\ncotton yarn 棉纱\nЕТСНГ - 622132\nГНГ - 5205140000\nТНВЭД - 5205140000		мешки	882	20970.12	3840	24810.12	U2540982-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2278844			documents/draft/test5_TCKU9388602.docx	documents/original/test5_TCKU9388602.docx	16	8
375		ООО"Uzkimyoimpeks"республика Узбекистан,100011,г.Ташкент, шайхантахурский р-н,ул.Навои №38.тел99878147-90-90	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	RD STUDIO PTE.LTD，RD工作室私营有限公司	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500		мешки	530	26558.3	3860	30418.3	U2527201-21\n0010109	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2689370			documents/draft/test5_EOLU8072350.docx	documents/original/test5_EOLU8072350.docx	17	8
376		ООО"Uzkimyoimpeks"республика Узбекистан,100011,г.Ташкент, шайхантахурский р-н,ул.Навои №38.тел99878147-90-90	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	RD STUDIO PTE.LTD，RD工作室私营有限公司	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500		мешки	530	26558.3	3860	30418.3	U2527214-21\n0010108	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2689371			documents/draft/test5_YMLU8379240.docx	documents/original/test5_YMLU8379240.docx	18	8
377		ООО"Uzkimyoimpeks"республика Узбекистан,100011,г.Ташкент, шайхантахурский р-н,ул.Навои №38.тел99878147-90-90	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	RD STUDIO PTE.LTD，RD工作室私营有限公司	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500		мешки	530	26558.3	3860	30418.3	U2527246-21\n0010115	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2689373			documents/draft/test5_EISU9035585.docx	documents/original/test5_EISU9035585.docx	19	8
378		ООО"Uzkimyoimpeks"республика Узбекистан,100011,г.Ташкент, шайхантахурский р-н,ул.Навои №38.тел99878147-90-90	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	RD STUDIO PTE.LTD，RD工作室私营有限公司	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500		мешки	530	26558.3	3860	30418.3	U2526992-21\n0010116	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2689372			documents/draft/test5_RJXU4014230.docx	documents/original/test5_RJXU4014230.docx	20	8
379		ООО"Uzkimyoimpeks"республика Узбекистан,100011,г.Ташкент, шайхантахурский р-н,ул.Навои №38.тел99878147-90-90	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	RD STUDIO PTE.LTD，RD工作室私营有限公司	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500		мешки	530	26558.3	3860	30418.3	U2527249-210010114\n	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2689374			documents/draft/test5_TCNU9499386.docx	documents/original/test5_TCNU9499386.docx	21	8
380		ООО"Uzkimyoimpeks"республика Узбекистан,100011,г.Ташкент, шайхантахурский р-н,ул.Навои №38.тел99878147-90-90	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	RD STUDIO PTE.LTD，RD工作室私营有限公司	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500		мешки	530	26558.3	3860	30418.3	U2527204-210010105	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2689375			documents/draft/test5_CBHU1483728.docx	documents/original/test5_CBHU1483728.docx	22	8
381		ООО"Uzkimyoimpeks"республика Узбекистан,100011,г.Ташкент, шайхантахурский р-н,ул.Навои №38.тел99878147-90-90	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	RD STUDIO PTE.LTD，RD工作室私营有限公司	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500		мешки	530	26558.3	3860	30418.3	U2527243-210010094	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2689356			documents/draft/test5_EMCU9738538.docx	documents/original/test5_EMCU9738538.docx	23	8
382		ООО"Uzkimyoimpeks"республика Узбекистан,100011,г.Ташкент, шайхантахурский р-н,ул.Навои №38.тел99878147-90-90	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	RD STUDIO PTE.LTD，RD工作室私营有限公司	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500		мешки	530	26558.3	3860	30418.3	U2527244-210010104	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2689353			documents/draft/test5_TDRU0621606.docx	documents/original/test5_TDRU0621606.docx	24	8
383		ООО"Uzkimyoimpeks"республика Узбекистан,100011,г.Ташкент, шайхантахурский р-н,ул.Навои №38.тел99878147-90-90	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	RD STUDIO PTE.LTD，RD工作室私营有限公司	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500		мешки	530	26558.3	3860	30418.3	U2527203-21\n0010103	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2689355			documents/draft/test5_TRLU5789394.docx	documents/original/test5_TRLU5789394.docx	25	8
384		ООО"Uzkimyoimpeks"республика Узбекистан,100011,г.Ташкент, шайхантахурский р-н,ул.Навои №38.тел99878147-90-90	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	RD STUDIO PTE.LTD，RD工作室私营有限公司	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500		мешки	530	26558.3	3860	30418.3	U2527216-21\n0010101	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2689354			documents/draft/test5_CBHU8228679.docx	documents/original/test5_CBHU8228679.docx	26	8
385		ООО"Uzkimyoimpeks"республика Узбекистан,100011,г.Ташкент, шайхантахурский р-н,ул.Навои №38.тел99878147-90-90	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	RD STUDIO PTE.LTD，RD工作室私营有限公司	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500		мешки	530	26558.3	3860	30418.3	U2527209-21\nU2527208-21\n0010107	4	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2689359			documents/draft/test5_INKU2624944.docx	documents/original/test5_INKU2624944.docx	27	8
386		ООО"Uzkimyoimpeks"республика Узбекистан,100011,г.Ташкент, шайхантахурский р-н,ул.Навои №38.тел99878147-90-90	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	RD STUDIO PTE.LTD，RD工作室私营有限公司	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500		мешки	530	26558.3	3860	30418.3	U2527210-21\n0010097	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2689360			documents/draft/test5_HDMU6453304.docx	documents/original/test5_HDMU6453304.docx	28	8
387		ООО"Uzkimyoimpeks"республика Узбекистан,100011,г.Ташкент, шайхантахурский р-н,ул.Навои №38.тел99878147-90-90	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	RD STUDIO PTE.LTD，RD工作室私营有限公司	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500		мешки	530	26558.3	3860	30418.3	U2527211-21\n0010098	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2689358			documents/draft/test5_CCLU6698729.docx	documents/original/test5_CCLU6698729.docx	29	8
388		ООО"Uzkimyoimpeks"республика Узбекистан,100011,г.Ташкент, шайхантахурский р-н,ул.Навои №38.тел99878147-90-90	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	RD STUDIO PTE.LTD，RD工作室私营有限公司	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500		мешки	530	26558.3	3860	30418.3	U2527245-21\n0010102	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2689357			documents/draft/test5_YHLU1379191.docx	documents/original/test5_YHLU1379191.docx	30	8
389		ООО"Uzkimyoimpeks"республика Узбекистан,100011,г.Ташкент, шайхантахурский р-н,ул.Навои №38.тел99878147-90-90	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	RD STUDIO PTE.LTD，RD工作室私营有限公司	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Хлорид калий 钾肥\nЕТСНГ- 434034\nГНГ - 310420500\nТНВЭД - 310420500		мешки	530	26558.3	3860	30418.3	U2527000-21\n0010129	3	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2689440			documents/draft/test5_CBHU1472750.docx	documents/original/test5_CBHU1472750.docx	31	8
390		URG TEX LLC 乌尔格纺织公司\nADD：Republic of Uzbekistan,Khorazem region,Urganch district by order of the Seller.\nJamshid，998 9099 37454	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	CHINA CHENGTONG INTERNATIONAL CO.,LTD.中国诚通国际贸易有限公司\n杭州市下城区东健康路1号707室\n刘娇 15071471336	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Х/б пряжа 100% cotton yarn 100%棉纱\nЕТСНГ-622132\nГНГ-5205120000\nТНВЭД-5205120000		мешки	784	22921.6	3800	26721.6	U2555119-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	1251387\n1251386			documents/draft/test5_BHCU4923000.docx	documents/original/test5_BHCU4923000.docx	32	8
391		URG TEX LLC 乌尔格纺织公司\nADD：Republic of Uzbekistan,Khorazem region,Urganch district by order of the Seller.\nJamshid，998 9099 37454	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	CHINA CHENGTONG INTERNATIONAL CO.,LTD.中国诚通国际贸易有限公司\n杭州市下城区东健康路1号707室\n刘娇 15071471336	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Х/б пряжа 100% cotton yarn 100%棉纱\nЕТСНГ-622132\nГНГ-5205120000\nТНВЭД-5205120000		мешки	784	23368.5	3800	27168.5	U2555142-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	1251408			documents/draft/test5_SNBU7002133.docx	documents/original/test5_SNBU7002133.docx	33	8
392		URG TEX LLC 乌尔格纺织公司\nADD：Republic of Uzbekistan,Khorazem region,Urganch district by order of the Seller.\nJamshid，998 9099 37454	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	CHINA CHENGTONG INTERNATIONAL CO.,LTD.中国诚通国际贸易有限公司\n杭州市下城区东健康路1号707室\n刘娇 15071471336	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Х/б пряжа 100% cotton yarn 100%棉纱\nЕТСНГ-622132\nГНГ-5205130000\nТНВЭД-5205130000		мешки	820	23398.0	3800	27198.0	U2555112-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	1251377			documents/draft/test5_CLHU8325827.docx	documents/original/test5_CLHU8325827.docx	34	8
393		NAMANGAN TO'QIMACHI LLC  纳曼干齐玛兹纺织公司\nADD:str.NAMANGAN TO'QIMACHI LLC by order of the Seller\nUmid, 998 9090 16688	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	CHINA CHENGTONG INTERNATIONAL CO.,LTD.中国诚通国际贸易有限公司\n杭州市下城区东健康路1号707室\n刘娇 15071471336	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Х/б пряжа 100% cotton yarn 100%棉纱\nЕТСНГ-622132\nГНГ-5205120000\nТНВЭД-5205120000		мешки	709	24237.06	3800	28037.06	U2531648-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	1219714			documents/draft/test5_CCLU6523612.docx	documents/original/test5_CCLU6523612.docx	35	8
394		《MIRISHKOR TEKSTIL GROUP CLUSTER》LTD\nADD: Republic of Uzbekistan,Qashqadaryo region,Mirishkor district by order of Seller\n平景，998 9733 37098	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	QINGDAO PORUN INDUSTRIAL TRADING CO., LTD\n青岛宝润兴业贸易有限公司\n中国(山东)自由贸易试验区青岛片区前湾保税港区莫斯科路44号乾通源办公楼三楼8305室(A)\n陈春玲 15860747078	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Х/б пряжа\ncotton yarn 棉纱\nЕТСНГ - 622132\nГНГ - 5205140000\nТНВЭД - 5205140000		мешки	856	23663.97	3800	27463.97	U2555079-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2778906			documents/draft/test5_GESU5096843.docx	documents/original/test5_GESU5096843.docx	36	8
395		NAMANGAN TO'QIMACHI LLC \nADD: Namangan Region,C,Namangan,4-Kichik Nohiya,ST,To'qimachilar Namangan Branch\n平景，998 9733 37098	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	QINGDAO PORUN INDUSTRIAL TRADING CO., LTD\n青岛宝润兴业贸易有限公司\n中国(山东)自由贸易试验区青岛片区前湾保税港区莫斯科路44号乾通源办公楼三楼8305室(A)\n陈春玲 15860747078	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Х/б пряжа\ncotton yarn 棉纱\nЕТСНГ - 622132\nГНГ - 5205140000\nТНВЭД - 5205140000		мешки	709	24248.52	3800	28048.52	U2541238-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	1220941			documents/draft/test5_HDMU6482175.docx	documents/original/test5_HDMU6482175.docx	37	8
396		《MIRISHKOR TEKSTIL GROUP CLUSTER》LTD\nADD: Republic of Uzbekistan,Qashqadaryo region,Mirishkor district by order of Seller\n平景，998 9733 37098	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	QINGDAO PORUN INDUSTRIAL TRADING CO., LTD\n青岛宝润兴业贸易有限公司\n中国(山东)自由贸易试验区青岛片区前湾保税港区莫斯科路44号乾通源办公楼三楼8305室(A)\n陈春玲 15860747078	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Х/б пряжа\ncotton yarn 棉纱\nЕТСНГ - 622132\nГНГ - 5205140000\nТНВЭД - 5205140000		мешки	860	23746.06	3800	27546.06	U2550479-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2778663			documents/draft/test5_WSCU7820749.docx	documents/original/test5_WSCU7820749.docx	38	8
397		JV LLC 《MILI TEKS SIRDARYO》\nADD:warehouse of JV LLC《MILI TEKS SIRDARYO》LLC,Republic of Uzbekistan,Sirdarya region, by order of the Seller\nJamshid，998 9099 37454	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	CHINA CHENGTONG INTERNATIONAL CO.,LTD.中国诚通国际贸易有限公司\n杭州市下城区东健康路1号707室\n刘娇 15071471336	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Х/б пряжа\ncotton yarn 棉纱\nЕТСНГ - 622132\nГНГ - 5205140000\nТНВЭД - 5205140000		мешки	945	26150.5	3800	29950.5	U2541326-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2791063			documents/draft/test5_TGHU9031170.docx	documents/original/test5_TGHU9031170.docx	39	8
398		\nLLC "SIRDARYA LICORICE EXTRACT"\nRepublic of Karakalpakstan, Uzbekistan, Buzatov district, Kuskhanatay Kozonketken aholi elati\n	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	QINGDAO TAITONG PHARMACEUTICAL CO., LTD 青岛泰东制药有限公司\nNO.22 HUAHAI ROAD, CHENGYANG DISTRICT,QINGDAO, R.P. CHINA中国青岛市城阳区华海路22号  	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Солодковый корень\nЕТСНГ - 074165\nГНГ - 1211908600\nТНВЭД - 1211908600		мешки	1040	26065.0	3840	29905.0	U2555139-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2810658			documents/draft/test5_TRLU5511401.docx	documents/original/test5_TRLU5511401.docx	40	8
399		费尔干纳化学工厂有限责任公司                            FAGR'ONA KIMYO ZAVODI LLCC.,Republic of Uzbekistan,150100, Fergana city,N.Hikmet st. -15	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	河北喀翔商贸有限公司                                  HEBEI KAXIANG TRADING CO., LTD                 dress:south of beach villge  ,dongzhuosu  town,jinzhou city ,shijiazhuang city,heibei province prc	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Cotton cellulose\nsheet 650 marks棉桨纤维\nЕТСНГ-                                         \nГНГ-4706100 \nТНВЭД-4706100	Containers belong to LIANYUNGANG  HENGAN  INTERNATIONAL FORWARDING  AGENCY  CO., LTD	мешки	114	24752.0	3900	28652.0	U2555063-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2813655			documents/draft/test5_GESU4963127.docx	documents/original/test5_GESU4963127.docx	41	8
400		费尔干纳化学工厂有限责任公司                            FAGR'ONA KIMYO ZAVODI LLCC.,Republic of Uzbekistan,150100, Fergana city,N.Hikmet st. -15	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	河北喀翔商贸有限公司                                  HEBEI KAXIANG TRADING CO., LTD                 dress:south of beach villge  ,dongzhuosu  town,jinzhou city ,shijiazhuang city,heibei province prc	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Cotton cellulose\nsheet 650 marks棉桨纤维\nЕТСНГ-                                         \nГНГ-4706100 \nТНВЭД-4706100	Containers belong to LIANYUNGANG  HENGAN  INTERNATIONAL FORWARDING  AGENCY  CO., LTD	мешки	115	25397.0	3950	29347.0	U2555105-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2834307			documents/draft/test5_TCKU9278821.docx	documents/original/test5_TCKU9278821.docx	42	8
401		费尔干纳化学工厂有限责任公司                            FAGR'ONA KIMYO ZAVODI LLCC.,Republic of Uzbekistan,150100, Fergana city,N.Hikmet st. -15	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	河北喀翔商贸有限公司\nHEBEI KAXIANG TRADING CO., LTD Аdress: south of beach villge  ,dongzhuosu  town,jinzhou city ,shijiazhuang city,heibei province prc	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Cotton cellulose\nsheet 650 marks棉桨纤维\nЕТСНГ-                                         \nГНГ-4706100 \nТНВЭД-4706100	Containers belong to LIANYUNGANG  HENGAN  INTERNATIONAL FORWARDING  AGENCY  CO., LTD	мешки	114	25157.0	3940	29097.0	U2555121-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2813657			documents/draft/test5_WSCU9982040.docx	documents/original/test5_WSCU9982040.docx	43	8
402		费尔干纳化学工厂有限责任公司                            FAGR'ONA KIMYO ZAVODI LLCC.,Republic of Uzbekistan,150100, Fergana city,N.Hikmet st. -15	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	河北喀翔商贸有限公司\nHEBEI KAXIANG TRADING CO., LTD Adress: South of beach villge  ,dongzhuosu  town,jinzhou city ,shijiazhuang city,heibei province prc	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Cotton cellulose\nsheet 650 marks棉桨纤维\nЕТСНГ-                                         \nГНГ-4706100 \nТНВЭД-4706100	Containers belong to LIANYUNGANG  HENGAN  INTERNATIONAL FORWARDING  AGENCY  CO., LTD	мешки	115	25037.0	3870	28907.0	U2554939-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2813656			documents/draft/test5_TGHU8709068.docx	documents/original/test5_TGHU8709068.docx	44	8
403		"Guangzhou Export" LTD\nRepublic of Uzbekistan Chilanzar, str.83,Tashkent City\n	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	ANHUI MINGZE PHARMACEUTICAL CO., LTD ,\n1092, Boju Road, traditional Chinese medicine decoction pieces Industrial Parlq Qiaocheng Economic Development Zone, Anhui Province\n安徽铭泽药业有限公司\n安徽省谯城经济开发区中药饮片产业园柏居路1092号	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Солодковый корень\nЕТСНГ - 074165\nГНГ - 1211908600\nТНВЭД - 1211908600	Контейнер является собственностью компании“Xi'an Heyday International Freight Agency Co.,LTD.”и после отгруза товара подлежит к возврату на терминал по адресу: Международный парораспределительный порт Джонюаня (г. Сиань, район.Бацяо)   Container belongs to “Xi'an Heyday International Freight Agency Co.,LTD.”after discharge the container should be returned to address: Xi'an Baqiao District Zhongyuan International Auto Parts port  TEL:86+18220714158	мешки	1040	26052.0	3830	29882.0	U2541209-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	2810683			documents/draft/test5_SGRU5004828.docx	documents/original/test5_SGRU5004828.docx	45	8
404		"UMIDA SHA.XJAXON EKSI'ORT" LLC,\nRepubLic of Uzbckistan, Khorezm region, Urgench city, 3-\nDaha, l8	ЧУКУРСАЙ    УТИ       720000	China Railway International Multimodal Transport Co.,Ltd.（023）WANGYUPING 18129198676\n委托中铁国际多式联运有限公司（023）负责转关\n王玉萍 18129198676	ANHUI MINGZE PHARMACEUTICAL CO., LTD ,\n1092, Boju Road, traditional Chinese medicine decoction\npieces Industrial Parlq Qiaocheng Economic Development\nZone, Anhui Province\n安徽铭泽药业有限公司\n安徽省谯城经济开发区中药饮片产业园柏居路1092号	Алтынколь-экс КЗХ далее в Китай КЖД ст. Сианьгоцзиган / st: Xianguojigang 西安国际港 384500	29 УТИ  Келес (эксп.) 720602\n27 КЗХ  Сары-агаш (эксп.) 704101\n27 КЗХ  Алтынколь (эксп.) 707701\n33 КЖД  Хоргос (эксп.) 431230	Вагон не принадлежит перевозчику.                         Арендован АО "Кедентранссервис". После выгрузки вернуть на станцию Алтынколь в распоряжение АО "Кедентранссервис"	Солодковый корень\nЕТСНГ - 074165\nГНГ - 1211908600\nТНВЭД - 1211908600	Контейнер является собственностью компании“Xi'an Heyday International Freight Agency Co.,LTD.”и после отгруза товара подлежит к возврату на терминал по адресу: Международный парораспределительный порт Джонюаня (г. Сиань, район.Бацяо)   Container belongs to “Xi'an Heyday International Freight Agency Co.,LTD.”after discharge the container should be returned to address: Xi'an Baqiao District Zhongyuan International Auto Parts port  TEL:86+18220714158	мешки	1134	22737.0	3940	26677.0	U2526027-21	2	Отправитель	на весах	По УТИ УЗЖДК\nПо КЗХ АО Кедентранссервис\n По КЖД ч/з CRIMT	29   УТИ  Чукурсай  УЗБК    720000\n29   УТИ  Келес (эксп.)        720602\n27   КЗХ  Сары-агаш (эксп.)    704101\n27  КЗХ  Алтынколь (эксп.)       707701\n0033    КЖД  Хоргос (эксп.)       431230\n0033    КЖД Сианьгоцзиган       384500	1. Таможенная декларация\n2. Инвойс; 3. Упаковочный лист\n4. Фитосанитарный сертификат\n5. Акт обеззараживания\n6. Сертификат происхождения\n7. Дополнительная дорожная ведомость	Оформление ТД по РК осуществляет ТОО «Жибек Жолы Express» договор № 22 от 04.06.2021 г. \n中国段铁路运输委托中铁国际多式联运有限公司（CRIMT）代理\n委托中铁国际多式联运有限公司（023）负责转关	1251320			documents/draft/test5_WEDU8122800.docx	documents/original/test5_WEDU8122800.docx	46	8
\.


--
-- Data for Name: staff_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff_client (id, phone_number, user_id) FROM stdin;
2	\N	4
3	\N	5
1	+998977077707	3
\.


--
-- Data for Name: staff_client_containers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff_client_containers (id, client_id, containerstatus_id) FROM stdin;
5	1	228
8	2	222
9	3	225
11	3	222
13	2	228
14	3	228
17	1	222
18	3	223
19	1	223
21	1	225
22	3	227
23	1	227
24	3	230
25	1	230
26	3	247
27	1	247
28	1	224
61	1	276
\.


--
-- Data for Name: staff_staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff_staff (id, role, telegram_id, user_id) FROM stdin;
2	level 1	575622821	1
1	level 1	2484640	2
\.


--
-- Data for Name: terminal_containerinterminal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.terminal_containerinterminal (id, laden, date_of_arrived, staff_id, terminal_id, container_id, arrived) FROM stdin;
24	f	\N	1	1	61	f
25	f	\N	1	1	62	f
26	f	\N	1	1	63	f
27	f	\N	1	1	64	f
28	f	\N	1	1	65	f
29	f	\N	1	1	66	f
30	f	\N	1	1	67	f
31	f	\N	1	1	68	f
32	f	\N	1	1	69	f
33	f	\N	1	1	70	f
34	f	\N	1	1	71	f
35	f	\N	1	1	72	f
36	f	\N	1	1	73	f
37	f	\N	1	1	74	f
38	f	\N	1	1	75	f
64	f	\N	1	1	1	f
39	f	\N	1	1	76	f
40	f	\N	1	1	77	f
41	f	\N	1	1	78	f
42	f	\N	1	1	79	f
43	f	\N	1	1	80	f
44	f	\N	1	1	81	f
65	f	\N	1	1	2	f
66	f	\N	1	1	3	f
67	f	\N	1	1	4	f
68	f	\N	1	1	5	f
69	f	\N	1	1	6	f
70	f	\N	1	1	7	f
71	f	\N	1	1	8	f
72	f	\N	1	1	9	f
73	f	\N	1	1	10	f
74	f	\N	1	1	11	f
75	f	\N	1	1	12	f
76	f	\N	1	1	13	f
77	f	\N	1	1	14	f
78	f	\N	1	1	15	f
79	f	\N	1	1	16	f
80	f	\N	1	1	17	f
81	f	\N	1	1	18	f
82	f	\N	1	1	19	f
83	f	\N	1	1	20	f
84	f	\N	1	1	21	f
85	f	\N	1	1	22	f
86	f	\N	1	1	23	f
87	f	\N	1	1	24	f
88	f	\N	1	1	25	f
89	f	\N	1	1	26	f
90	f	\N	1	1	27	f
91	f	\N	1	1	28	f
45	f	\N	1	1	82	f
92	f	\N	1	1	29	f
93	f	\N	1	1	30	f
94	f	\N	1	1	31	f
95	f	\N	1	1	32	f
96	f	\N	1	1	33	f
97	f	\N	1	1	34	f
46	f	\N	1	1	83	f
47	f	\N	1	1	84	f
48	f	\N	1	1	85	f
49	f	\N	1	1	86	f
98	f	\N	1	1	35	f
50	f	\N	1	1	87	f
51	f	\N	1	1	88	f
52	f	\N	1	1	89	f
104	f	\N	1	1	41	f
99	f	\N	1	1	36	f
100	f	\N	1	1	37	f
101	f	\N	1	1	38	f
102	f	\N	1	1	39	f
62	f	\N	1	1	47	t
103	f	\N	1	1	40	t
17	f	\N	1	1	54	f
18	f	\N	1	1	55	f
19	f	\N	1	1	56	f
20	f	\N	1	1	57	f
21	f	\N	1	1	58	f
22	f	\N	1	1	59	f
53	f	\N	1	1	90	f
54	f	\N	1	1	91	f
55	f	\N	1	1	92	f
56	f	\N	1	1	93	f
57	f	\N	1	1	94	f
58	f	\N	1	1	95	f
59	f	\N	1	1	96	f
60	f	\N	1	1	97	f
61	f	\N	1	1	98	f
11	f	\N	1	1	48	t
12	f	\N	1	1	49	t
13	f	\N	1	1	50	t
14	f	\N	1	1	51	t
23	f	\N	1	1	60	f
105	f	\N	1	1	42	f
106	f	\N	1	1	43	f
107	f	\N	1	1	44	f
108	f	\N	1	1	45	f
109	f	\N	1	1	46	f
15	f	\N	1	1	52	t
16	f	\N	1	1	53	t
\.


--
-- Data for Name: terminal_containerinterminaldocument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.terminal_containerinterminaldocument (id, document, container_in_terminal_id) FROM stdin;
15	documents/containers/BYWU8111776_K9XPez3.pdf	55
16	documents/containers/Программа_хакатона.pdf	16
\.


--
-- Data for Name: terminal_containerinterminalsealimage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.terminal_containerinterminalsealimage (id, image, container_in_terminal_id) FROM stdin;
10	seal_images/abstract_f0rclNu.png	55
14	seal_images/abstract_dTx8ctT.png	16
\.


--
-- Data for Name: terminal_terminal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.terminal_terminal (id, name) FROM stdin;
1	ULS
2	FTT
3	FDTP
\.


--
-- Data for Name: train_train; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.train_train (id, name, type, terminal_id) FROM stdin;
7	test4	export	1
8	test5	export	1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 76, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: container_status_containerstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.container_status_containerstatus_id_seq', 321, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 247, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 19, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 35, true);


--
-- Name: railway_bill_container_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.railway_bill_container_id_seq', 98, true);


--
-- Name: railway_bill_railwaybill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.railway_bill_railwaybill_id_seq', 404, true);


--
-- Name: staff_client_containers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_client_containers_id_seq', 62, true);


--
-- Name: staff_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_client_id_seq', 3, true);


--
-- Name: staff_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_staff_id_seq', 2, true);


--
-- Name: terminal_containerinterminal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.terminal_containerinterminal_id_seq', 109, true);


--
-- Name: terminal_containerinterminaldocument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.terminal_containerinterminaldocument_id_seq', 16, true);


--
-- Name: terminal_containerinterminalsealimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.terminal_containerinterminalsealimage_id_seq', 14, true);


--
-- Name: terminal_terminal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.terminal_terminal_id_seq', 3, true);


--
-- Name: train_train_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.train_train_id_seq', 8, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: container_status_containerstatus container_status_contain_container_in_terminal_id_dd5b0202_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_status_containerstatus
    ADD CONSTRAINT container_status_contain_container_in_terminal_id_dd5b0202_uniq UNIQUE (container_in_terminal_id);


--
-- Name: container_status_containerstatus container_status_containerstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_status_containerstatus
    ADD CONSTRAINT container_status_containerstatus_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: railway_bill_container railway_bill_container_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.railway_bill_container
    ADD CONSTRAINT railway_bill_container_name_key UNIQUE (name);


--
-- Name: railway_bill_container railway_bill_container_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.railway_bill_container
    ADD CONSTRAINT railway_bill_container_pkey PRIMARY KEY (id);


--
-- Name: railway_bill_railwaybill railway_bill_railwaybill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.railway_bill_railwaybill
    ADD CONSTRAINT railway_bill_railwaybill_pkey PRIMARY KEY (id);


--
-- Name: staff_client_containers staff_client_containers_client_id_containerstatu_e7bbbbb2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_client_containers
    ADD CONSTRAINT staff_client_containers_client_id_containerstatu_e7bbbbb2_uniq UNIQUE (client_id, containerstatus_id);


--
-- Name: staff_client_containers staff_client_containers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_client_containers
    ADD CONSTRAINT staff_client_containers_pkey PRIMARY KEY (id);


--
-- Name: staff_client staff_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_client
    ADD CONSTRAINT staff_client_pkey PRIMARY KEY (id);


--
-- Name: staff_client staff_client_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_client
    ADD CONSTRAINT staff_client_user_id_key UNIQUE (user_id);


--
-- Name: staff_staff staff_staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_staff
    ADD CONSTRAINT staff_staff_pkey PRIMARY KEY (id);


--
-- Name: staff_staff staff_staff_user_id_abd8ba40_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_staff
    ADD CONSTRAINT staff_staff_user_id_abd8ba40_uniq UNIQUE (user_id);


--
-- Name: terminal_containerinterminal terminal_containerinterminal_container_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal_containerinterminal
    ADD CONSTRAINT terminal_containerinterminal_container_id_key UNIQUE (container_id);


--
-- Name: terminal_containerinterminal terminal_containerinterminal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal_containerinterminal
    ADD CONSTRAINT terminal_containerinterminal_pkey PRIMARY KEY (id);


--
-- Name: terminal_containerinterminaldocument terminal_containerinterminaldocument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal_containerinterminaldocument
    ADD CONSTRAINT terminal_containerinterminaldocument_pkey PRIMARY KEY (id);


--
-- Name: terminal_containerinterminalsealimage terminal_containerinterminalsealimage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal_containerinterminalsealimage
    ADD CONSTRAINT terminal_containerinterminalsealimage_pkey PRIMARY KEY (id);


--
-- Name: terminal_terminal terminal_terminal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal_terminal
    ADD CONSTRAINT terminal_terminal_pkey PRIMARY KEY (id);


--
-- Name: train_train train_train_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.train_train
    ADD CONSTRAINT train_train_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: container_status_containerstatus_train_id_574dde33; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX container_status_containerstatus_train_id_574dde33 ON public.container_status_containerstatus USING btree (train_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: railway_bill_container_name_00c82963_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX railway_bill_container_name_00c82963_like ON public.railway_bill_container USING btree (name varchar_pattern_ops);


--
-- Name: railway_bill_railwaybill_container_id_af7dce41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX railway_bill_railwaybill_container_id_af7dce41 ON public.railway_bill_railwaybill USING btree (container_id);


--
-- Name: railway_bill_railwaybill_train_id_58c41b13; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX railway_bill_railwaybill_train_id_58c41b13 ON public.railway_bill_railwaybill USING btree (train_id);


--
-- Name: staff_client_containers_client_id_51fd9d8f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX staff_client_containers_client_id_51fd9d8f ON public.staff_client_containers USING btree (client_id);


--
-- Name: staff_client_containers_containerstatus_id_062bb4e0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX staff_client_containers_containerstatus_id_062bb4e0 ON public.staff_client_containers USING btree (containerstatus_id);


--
-- Name: terminal_containerintermin_container_in_terminal_id_109495ec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX terminal_containerintermin_container_in_terminal_id_109495ec ON public.terminal_containerinterminalsealimage USING btree (container_in_terminal_id);


--
-- Name: terminal_containerintermin_container_in_terminal_id_3116251a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX terminal_containerintermin_container_in_terminal_id_3116251a ON public.terminal_containerinterminaldocument USING btree (container_in_terminal_id);


--
-- Name: terminal_containerinterminal_staff_id_0ccefbdb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX terminal_containerinterminal_staff_id_0ccefbdb ON public.terminal_containerinterminal USING btree (staff_id);


--
-- Name: terminal_containerinterminal_terminal_id_7f53b719; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX terminal_containerinterminal_terminal_id_7f53b719 ON public.terminal_containerinterminal USING btree (terminal_id);


--
-- Name: train_train_terminal_id_68f1e2f0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX train_train_terminal_id_68f1e2f0 ON public.train_train USING btree (terminal_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: container_status_containerstatus container_status_con_container_in_termina_dd5b0202_fk_terminal_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_status_containerstatus
    ADD CONSTRAINT container_status_con_container_in_termina_dd5b0202_fk_terminal_ FOREIGN KEY (container_in_terminal_id) REFERENCES public.terminal_containerinterminal(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: container_status_containerstatus container_status_con_train_id_574dde33_fk_train_tra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_status_containerstatus
    ADD CONSTRAINT container_status_con_train_id_574dde33_fk_train_tra FOREIGN KEY (train_id) REFERENCES public.train_train(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: railway_bill_railwaybill railway_bill_railway_container_id_af7dce41_fk_railway_b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.railway_bill_railwaybill
    ADD CONSTRAINT railway_bill_railway_container_id_af7dce41_fk_railway_b FOREIGN KEY (container_id) REFERENCES public.railway_bill_container(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: railway_bill_railwaybill railway_bill_railwaybill_train_id_58c41b13_fk_train_train_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.railway_bill_railwaybill
    ADD CONSTRAINT railway_bill_railwaybill_train_id_58c41b13_fk_train_train_id FOREIGN KEY (train_id) REFERENCES public.train_train(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: staff_client_containers staff_client_contain_containerstatus_id_062bb4e0_fk_container; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_client_containers
    ADD CONSTRAINT staff_client_contain_containerstatus_id_062bb4e0_fk_container FOREIGN KEY (containerstatus_id) REFERENCES public.container_status_containerstatus(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: staff_client_containers staff_client_containers_client_id_51fd9d8f_fk_staff_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_client_containers
    ADD CONSTRAINT staff_client_containers_client_id_51fd9d8f_fk_staff_client_id FOREIGN KEY (client_id) REFERENCES public.staff_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: staff_client staff_client_user_id_7d87395b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_client
    ADD CONSTRAINT staff_client_user_id_7d87395b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: staff_staff staff_staff_user_id_abd8ba40_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_staff
    ADD CONSTRAINT staff_staff_user_id_abd8ba40_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: terminal_containerinterminal terminal_containerin_container_id_dea3952a_fk_railway_b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal_containerinterminal
    ADD CONSTRAINT terminal_containerin_container_id_dea3952a_fk_railway_b FOREIGN KEY (container_id) REFERENCES public.railway_bill_container(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: terminal_containerinterminalsealimage terminal_containerin_container_in_termina_109495ec_fk_terminal_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal_containerinterminalsealimage
    ADD CONSTRAINT terminal_containerin_container_in_termina_109495ec_fk_terminal_ FOREIGN KEY (container_in_terminal_id) REFERENCES public.terminal_containerinterminal(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: terminal_containerinterminaldocument terminal_containerin_container_in_termina_3116251a_fk_terminal_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal_containerinterminaldocument
    ADD CONSTRAINT terminal_containerin_container_in_termina_3116251a_fk_terminal_ FOREIGN KEY (container_in_terminal_id) REFERENCES public.terminal_containerinterminal(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: terminal_containerinterminal terminal_containerin_staff_id_0ccefbdb_fk_staff_sta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal_containerinterminal
    ADD CONSTRAINT terminal_containerin_staff_id_0ccefbdb_fk_staff_sta FOREIGN KEY (staff_id) REFERENCES public.staff_staff(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: terminal_containerinterminal terminal_containerin_terminal_id_7f53b719_fk_terminal_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terminal_containerinterminal
    ADD CONSTRAINT terminal_containerin_terminal_id_7f53b719_fk_terminal_ FOREIGN KEY (terminal_id) REFERENCES public.terminal_terminal(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: train_train train_train_terminal_id_68f1e2f0_fk_terminal_terminal_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.train_train
    ADD CONSTRAINT train_train_terminal_id_68f1e2f0_fk_terminal_terminal_id FOREIGN KEY (terminal_id) REFERENCES public.terminal_terminal(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

