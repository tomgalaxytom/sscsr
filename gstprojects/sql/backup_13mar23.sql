--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 14.5

-- Started on 2023-03-13 16:41:46

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
-- TOC entry 8 (class 2615 OID 620498)
-- Name: mybillmyright; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA mybillmyright;


ALTER SCHEMA mybillmyright OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 184 (class 1259 OID 620499)
-- Name: billdetail; Type: TABLE; Schema: mybillmyright; Owner: postgres
--

CREATE TABLE mybillmyright.billdetail (
    billdetailid integer NOT NULL,
    userid integer NOT NULL,
    configcode character varying(2) NOT NULL,
    mobilenumber character varying(10) NOT NULL,
    billnumber character varying(10) NOT NULL,
    billdate date NOT NULL,
    shopname character varying(100) NOT NULL,
    billamount numeric NOT NULL,
    statecode character varying(2) NOT NULL,
    distcode character varying(3) NOT NULL,
    filename character varying(200),
    fileextension character varying(20),
    filesize character varying(10),
    mimetype character varying(50),
    filepath character varying(200),
    acknumber character varying(25) NOT NULL,
    uploadedby integer DEFAULT 1,
    uploadedon timestamp without time zone,
    statusflag character(1)
);


ALTER TABLE mybillmyright.billdetail OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 620506)
-- Name: billdetail_billdetailid_seq; Type: SEQUENCE; Schema: mybillmyright; Owner: postgres
--

CREATE SEQUENCE mybillmyright.billdetail_billdetailid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mybillmyright.billdetail_billdetailid_seq OWNER TO postgres;

--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 185
-- Name: billdetail_billdetailid_seq; Type: SEQUENCE OWNED BY; Schema: mybillmyright; Owner: postgres
--

ALTER SEQUENCE mybillmyright.billdetail_billdetailid_seq OWNED BY mybillmyright.billdetail.billdetailid;


--
-- TOC entry 186 (class 1259 OID 620508)
-- Name: mst_config; Type: TABLE; Schema: mybillmyright; Owner: postgres
--

CREATE TABLE mybillmyright.mst_config (
    configid integer NOT NULL,
    schemecode character varying(2) NOT NULL,
    configcode character varying(2) NOT NULL,
    statecode character varying(2) NOT NULL,
    distcode character varying(3) NOT NULL,
    minimumbillamt integer,
    prizeamount bigint,
    billentrystartdate timestamp without time zone,
    billentryenddate timestamp without time zone,
    billpurchasestartdate timestamp without time zone,
    billpurchaseenddate timestamp without time zone,
    billdrawdate timestamp without time zone,
    yymm character varying(6) NOT NULL,
    statusflag character(1),
    createdby integer,
    createdon timestamp without time zone,
    updatedby integer,
    updatedon timestamp without time zone
);


ALTER TABLE mybillmyright.mst_config OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 620511)
-- Name: mst_configlog; Type: TABLE; Schema: mybillmyright; Owner: postgres
--

CREATE TABLE mybillmyright.mst_configlog (
    configlogid integer NOT NULL,
    configid integer NOT NULL,
    schemecode character varying(2) NOT NULL,
    configcode character varying(2) NOT NULL,
    statecode character varying(2) NOT NULL,
    distcode character varying(3) NOT NULL,
    minimumbillamt integer,
    prizeamount bigint,
    billentrystartdate timestamp without time zone,
    billentryenddate timestamp without time zone,
    billpurchasestartdate timestamp without time zone,
    billpurchaseenddate timestamp without time zone,
    billdrawdate timestamp without time zone,
    yymm character varying(6) NOT NULL,
    statusflag character(1),
    createdby integer,
    createdon timestamp without time zone,
    updatedby integer,
    updatedon timestamp without time zone
);


ALTER TABLE mybillmyright.mst_configlog OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 620514)
-- Name: mst_district; Type: TABLE; Schema: mybillmyright; Owner: postgres
--

CREATE TABLE mybillmyright.mst_district (
    distid integer NOT NULL,
    distcode character varying(3) NOT NULL,
    statecode character varying(2),
    distename character varying(50),
    flag character(1),
    createdon timestamp without time zone,
    createdby integer,
    updatedby integer,
    updatedon timestamp without time zone
);


ALTER TABLE mybillmyright.mst_district OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 620517)
-- Name: mst_scheme; Type: TABLE; Schema: mybillmyright; Owner: postgres
--

CREATE TABLE mybillmyright.mst_scheme (
    schemeid integer NOT NULL,
    schemecode character varying(2) NOT NULL,
    schemesname character varying(10),
    schemelname character varying(50),
    minimumbillamt integer,
    prizeamount bigint,
    billentrystartdate timestamp without time zone,
    billentryenddate timestamp without time zone,
    billpurchasestartdate timestamp without time zone,
    billpurchaseenddate timestamp without time zone,
    billdrawdate timestamp without time zone,
    finyear integer,
    statusflag character(1),
    yymm character varying(6) NOT NULL,
    configstate_dist character(1) NOT NULL,
    createdby integer,
    createdon timestamp without time zone,
    updatedby integer,
    updatedon timestamp without time zone
);


ALTER TABLE mybillmyright.mst_scheme OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 620520)
-- Name: mst_state; Type: TABLE; Schema: mybillmyright; Owner: postgres
--

CREATE TABLE mybillmyright.mst_state (
    stateid integer NOT NULL,
    statecode character varying(2) NOT NULL,
    stateename character varying(50),
    statetname character varying(50),
    stateut character varying(1),
    flag character varying(1),
    createdon timestamp without time zone,
    createdby integer,
    updatedby integer,
    updatedon timestamp without time zone
);


ALTER TABLE mybillmyright.mst_state OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 620523)
-- Name: mst_user; Type: TABLE; Schema: mybillmyright; Owner: postgres
--

CREATE TABLE mybillmyright.mst_user (
    userid integer NOT NULL,
    schemecode character varying(2) DEFAULT '01'::character varying NOT NULL,
    email character varying(50) NOT NULL,
    pwd character varying(200),
    name character varying(50) NOT NULL,
    mobilenumber character varying(10) NOT NULL,
    statecode character varying(2) DEFAULT 'TN'::character varying NOT NULL,
    distcode character varying(3),
    ipaddress character varying(20),
    deviceid character varying(1),
    addr1 character varying(100) DEFAULT 'Address 1'::character varying NOT NULL,
    addr2 character varying(100) DEFAULT 'Address 2'::character varying NOT NULL,
    pincode character varying(6) DEFAULT '600000'::character varying NOT NULL,
    createdby integer DEFAULT 1 NOT NULL,
    createdon timestamp without time zone,
    updatedby integer DEFAULT 1,
    updatedon timestamp without time zone,
    statusflag boolean DEFAULT true,
    profile_update character(1)
);


ALTER TABLE mybillmyright.mst_user OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 620537)
-- Name: mst_user_userid_seq; Type: SEQUENCE; Schema: mybillmyright; Owner: postgres
--

CREATE SEQUENCE mybillmyright.mst_user_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mybillmyright.mst_user_userid_seq OWNER TO postgres;

--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 192
-- Name: mst_user_userid_seq; Type: SEQUENCE OWNED BY; Schema: mybillmyright; Owner: postgres
--

ALTER SEQUENCE mybillmyright.mst_user_userid_seq OWNED BY mybillmyright.mst_user.userid;


--
-- TOC entry 193 (class 1259 OID 620539)
-- Name: mst_userlog; Type: TABLE; Schema: mybillmyright; Owner: postgres
--

CREATE TABLE mybillmyright.mst_userlog (
    userid integer NOT NULL,
    schemecode character varying(2) NOT NULL,
    email character varying(50) NOT NULL,
    pwd character varying(300),
    name character varying(50) NOT NULL,
    mobilenumber character varying(10) NOT NULL,
    statusflag character(1) DEFAULT true NOT NULL,
    statecode character varying(2),
    distcode character varying(3),
    ipaddress character varying(20),
    deviceid character varying(1),
    addr1 character varying(100),
    adr2 character varying(100),
    pincode integer,
    createdby integer DEFAULT 1 NOT NULL,
    createdon timestamp without time zone,
    updatedby integer DEFAULT 1,
    updatedon timestamp without time zone,
    userlogid integer
);


ALTER TABLE mybillmyright.mst_userlog OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 620548)
-- Name: mst_userlog_userlogid_seq; Type: SEQUENCE; Schema: mybillmyright; Owner: postgres
--

CREATE SEQUENCE mybillmyright.mst_userlog_userlogid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mybillmyright.mst_userlog_userlogid_seq OWNER TO postgres;

--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 194
-- Name: mst_userlog_userlogid_seq; Type: SEQUENCE OWNED BY; Schema: mybillmyright; Owner: postgres
--

ALTER SEQUENCE mybillmyright.mst_userlog_userlogid_seq OWNED BY mybillmyright.mst_userlog.userlogid;


--
-- TOC entry 195 (class 1259 OID 620550)
-- Name: mst_userlogindetail; Type: TABLE; Schema: mybillmyright; Owner: postgres
--

CREATE TABLE mybillmyright.mst_userlogindetail (
    userid integer NOT NULL,
    mobilenumber character varying(10) NOT NULL,
    ipaddress character varying(20),
    deviceid character varying(1),
    logintime timestamp without time zone,
    logouttime timestamp without time zone,
    logoutstatus integer NOT NULL,
    userloginid integer NOT NULL
);


ALTER TABLE mybillmyright.mst_userlogindetail OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 620553)
-- Name: mst_userlogindetail_userloginid_seq; Type: SEQUENCE; Schema: mybillmyright; Owner: postgres
--

CREATE SEQUENCE mybillmyright.mst_userlogindetail_userloginid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mybillmyright.mst_userlogindetail_userloginid_seq OWNER TO postgres;

--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 196
-- Name: mst_userlogindetail_userloginid_seq; Type: SEQUENCE OWNED BY; Schema: mybillmyright; Owner: postgres
--

ALTER SEQUENCE mybillmyright.mst_userlogindetail_userloginid_seq OWNED BY mybillmyright.mst_userlogindetail.userloginid;


--
-- TOC entry 197 (class 1259 OID 620555)
-- Name: test; Type: TABLE; Schema: mybillmyright; Owner: postgres
--

CREATE TABLE mybillmyright.test (
    id integer NOT NULL,
    fname character varying NOT NULL
);


ALTER TABLE mybillmyright.test OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 620561)
-- Name: test_id_seq; Type: SEQUENCE; Schema: mybillmyright; Owner: postgres
--

CREATE SEQUENCE mybillmyright.test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mybillmyright.test_id_seq OWNER TO postgres;

--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 198
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: mybillmyright; Owner: postgres
--

ALTER SEQUENCE mybillmyright.test_id_seq OWNED BY mybillmyright.test.id;


--
-- TOC entry 183 (class 1259 OID 585136)
-- Name: test; Type: TABLE; Schema: public; Owner: nursec
--

CREATE TABLE public.test (
    id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.test OWNER TO nursec;

--
-- TOC entry 182 (class 1259 OID 585134)
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: nursec
--

CREATE SEQUENCE public.test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_id_seq OWNER TO nursec;

--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 182
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nursec
--

ALTER SEQUENCE public.test_id_seq OWNED BY public.test.id;


--
-- TOC entry 2906 (class 2604 OID 620563)
-- Name: billdetail billdetailid; Type: DEFAULT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.billdetail ALTER COLUMN billdetailid SET DEFAULT nextval('mybillmyright.billdetail_billdetailid_seq'::regclass);


--
-- TOC entry 2915 (class 2604 OID 620564)
-- Name: mst_user userid; Type: DEFAULT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_user ALTER COLUMN userid SET DEFAULT nextval('mybillmyright.mst_user_userid_seq'::regclass);


--
-- TOC entry 2919 (class 2604 OID 620565)
-- Name: mst_userlog userlogid; Type: DEFAULT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_userlog ALTER COLUMN userlogid SET DEFAULT nextval('mybillmyright.mst_userlog_userlogid_seq'::regclass);


--
-- TOC entry 2920 (class 2604 OID 620566)
-- Name: mst_userlogindetail userloginid; Type: DEFAULT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_userlogindetail ALTER COLUMN userloginid SET DEFAULT nextval('mybillmyright.mst_userlogindetail_userloginid_seq'::regclass);


--
-- TOC entry 2921 (class 2604 OID 620567)
-- Name: test id; Type: DEFAULT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.test ALTER COLUMN id SET DEFAULT nextval('mybillmyright.test_id_seq'::regclass);


--
-- TOC entry 2904 (class 2604 OID 585139)
-- Name: test id; Type: DEFAULT; Schema: public; Owner: nursec
--

ALTER TABLE ONLY public.test ALTER COLUMN id SET DEFAULT nextval('public.test_id_seq'::regclass);


--
-- TOC entry 3065 (class 0 OID 620499)
-- Dependencies: 184
-- Data for Name: billdetail; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.billdetail (billdetailid, userid, configcode, mobilenumber, billnumber, billdate, shopname, billamount, statecode, distcode, filename, fileextension, filesize, mimetype, filepath, acknumber, uploadedby, uploadedon, statusflag) FROM stdin;
121	79	03	8148958988	12345	2022-11-09	test shop	500	TN	610	ctax	png	183.93 KB	image/png	upload/bills/ctax.png	432432434	79	2023-02-17 19:43:13	Y
122	79	03	8148958988	34234	2022-11-22	textile	600	TN	586	ctax-removebg-preview	png	52.21 KB	image/png	upload/bills/ctax-removebg-preview.png	432432434	79	2022-11-17 21:05:39	N
123	79	03	8148958988	321	2022-11-08	dhilp tex	688	TN	610	logo c tax	png	1.20 MB	image/png	upload/bills/logo c tax.png	432432434	79	2022-12-31 21:53:35	N
150	79	03	8148958988	0000000324	2023-01-18	terstr	435325	TN	610	screencapture-10-163-19-176-nursecounsil-updating-Etransfer-postdistribution-report-2023-02-16-10_59_57	png	104.55 KB	image/png	upload/bills/screencapture-10-163-19-176-nursecounsil-updating-Etransfer-postdistribution-report-2023-02-16-10_59_57.png	6109881801202332400435325	79	2023-02-21 22:02:24	N
126	79	03	8148958988	0000002134	2022-11-02	test	500	TN	610	Screenshot (7)	png	1.29 MB	image/png	upload/bills/Screenshot (7).png	432432434	79	2023-02-21 01:42:17	N
153	79	03	8148958988	0000000123	2023-01-10	test	4323	TN	586	screencapture-10-163-19-176-nursecounsil-updating-Etransfer-postdistribution-report-2023-02-16-10_58_01	png	96.35 KB	image/png	upload/bills/screencapture-10-163-19-176-nursecounsil-updating-Etransfer-postdistribution-report-2023-02-16-10_58_01.png	6109881001202312300004323	79	2023-02-21 17:18:09	N
151	79	03	8148958988	0000000325	2023-01-18	terstr	435326	TN	610	\N	\N	\N	\N	\N	6109881801202332500435326	79	2023-02-21 17:18:54	N
144	79	03	8148958988	0000243214	2023-01-19	testt	35435	TN	610	Technology_GST-Blog-Banner_1-704x286-1	jpg	25.43 KB	image/jpeg	upload/bills/Technology_GST-Blog-Banner_1-704x286-1.jpg	6109881901202321400035435	79	2023-02-21 20:47:05	N
143	79	03	8148958988	0000000243	2022-12-18	test	4525	TN	586	Technology_GST-Blog-Banner_1-704x286-1	jpg	25.43 KB	image/jpeg	upload/bills/Technology_GST-Blog-Banner_1-704x286-1.jpg	6109881801202324300004525	79	2023-02-21 20:45:59	N
145	79	03	8148958988	0000000342	2023-01-16	terst	4443	TN	610	Technology_GST-Blog-Banner_1-704x286-1	jpg	25.43 KB	image/jpeg	upload/bills/Technology_GST-Blog-Banner_1-704x286-1.jpg	6109881601202334200004443	79	2023-02-21 20:47:52	N
138	79	03	8148958988	0000004324	2023-01-17	tes	5656	TN	610	screencapture-10-163-19-176-nursecounsil-updating-Etransfer-approved-details-2023-02-13-16_43_35	png	89.27 KB	image/png	upload/bills/screencapture-10-163-19-176-nursecounsil-updating-Etransfer-approved-details-2023-02-13-16_43_35.png	6109881701202332400005656	79	2023-02-21 20:34:41	N
146	79	03	8148958988	0000043421	2023-01-16	terst	4443	TN	610	Technology_GST-Blog-Banner_1-704x286-1	jpg	25.43 KB	image/jpeg	upload/bills/Technology_GST-Blog-Banner_1-704x286-1.jpg	6109881601202342100004443	79	2023-02-21 20:48:18	N
127	79	03	8148958988	0000005590	2022-11-02	abc company	5000	TN	610	Screenshot (1)	png	166.77 KB	image/png	upload/bills/Screenshot (1).png	432432434	79	2023-02-21 01:54:42	N
128	80	03	9884778378	0000005600	2022-11-01	xyz company	500	TN	610	Screenshot (5)	png	102.04 KB	image/png	upload/bills/Screenshot (5).png	432432434	80	2023-02-21 02:57:49	N
129	80	03	9884778378	0000002143	2023-01-18	testtt	600	TN	610	Screenshot (6)	png	164.24 KB	image/png	upload/bills/Screenshot (6).png	6103781801202314300000600	80	2023-02-21 03:54:11	N
130	79	03	8148958988	0000014325	2023-01-11	test	500	TN	610	Technology_GST-Blog-Banner_1-704x286-1	jpg	25.43 KB	image/jpeg	upload/bills/Technology_GST-Blog-Banner_1-704x286-1.jpg	6109881101202332500000500	79	2023-02-21 20:18:31	N
131	79	03	8148958988	0000000314	2023-01-24	testt	577	TN	586	Technology_GST-Blog-Banner_1-704x286-1	jpg	25.43 KB	image/jpeg	upload/bills/Technology_GST-Blog-Banner_1-704x286-1.jpg	6109882401202331400000577	79	2023-02-21 20:21:47	N
132	79	03	8148958988	0000004365	2023-01-24	testes	500	TN	586	Technology_GST-Blog-Banner_1-704x286-1	jpg	25.43 KB	image/jpeg	upload/bills/Technology_GST-Blog-Banner_1-704x286-1.jpg	6109882401202336500000500	79	2023-02-21 20:23:18	N
133	79	03	8148958988	0000041254	2023-01-17	testt	4667	TN	610	Technology_GST-Blog-Banner_1-704x286-1	jpg	25.43 KB	image/jpeg	upload/bills/Technology_GST-Blog-Banner_1-704x286-1.jpg	6109881701202325400004667	79	2023-02-21 20:25:15	N
135	79	03	8148958988	0000005344	2023-01-10	terstt	679	TN	610	screencapture-10-163-19-176-nursecounsil-updating-Etransfer-dashboard-2023-02-16-11_11_54	png	81.46 KB	image/png	upload/bills/screencapture-10-163-19-176-nursecounsil-updating-Etransfer-dashboard-2023-02-16-11_11_54.png	6109881001202334400000679	79	2023-02-21 20:30:00	N
136	79	03	8148958988	0000000452	2023-01-11	test	5555	TN	610	Technology_GST-Blog-Banner_1-704x286-1	jpg	25.43 KB	image/jpeg	upload/bills/Technology_GST-Blog-Banner_1-704x286-1.jpg	6109881101202345200005555	79	2023-02-21 20:31:39	N
139	79	03	8148958988	0000043243	2023-01-18	test	3455	TN	610	Technology_GST-Blog-Banner_1-704x286-1	jpg	25.43 KB	image/jpeg	upload/bills/Technology_GST-Blog-Banner_1-704x286-1.jpg	6109881801202324300003455	79	2023-02-21 20:35:39	N
140	79	03	8148958988	0000000232	2023-01-09	test	4565	TN	586	Technology_GST-Blog-Banner_1-704x286-1	jpg	25.43 KB	image/jpeg	upload/bills/Technology_GST-Blog-Banner_1-704x286-1.jpg	6109880901202323200004565	79	2023-02-21 20:41:03	N
141	79	03	8148958988	0000000023	2023-01-03	test	45345	TN	610	screencapture-10-163-19-176-nursecounsil-updating-Etransfer-postdistribution-report-2023-02-16-10_58_01	png	96.35 KB	image/png	upload/bills/screencapture-10-163-19-176-nursecounsil-updating-Etransfer-postdistribution-report-2023-02-16-10_58_01.png	6109880301202302300045345	79	2023-02-21 20:41:48	N
142	79	03	8148958988	0000000242	2023-01-03	tetsa	3545	TN	610	screencapture-10-163-19-176-nursecounsil-updating-Etransfer-dashboard-2023-02-16-11_11_54	png	81.46 KB	image/png	upload/bills/screencapture-10-163-19-176-nursecounsil-updating-Etransfer-dashboard-2023-02-16-11_11_54.png	6109880301202324200003545	79	2023-02-21 20:43:14	N
147	79	03	8148958988	0000001334	2023-01-16	rear	345325	TN	610	screencapture-10-163-19-176-nursecounsil-updating-Etransfer-dashboard-2023-02-16-11_11_54	png	81.46 KB	image/png	upload/bills/screencapture-10-163-19-176-nursecounsil-updating-Etransfer-dashboard-2023-02-16-11_11_54.png	6109881601202333400345325	79	2023-02-21 20:49:01	N
149	79	03	8148958988	0000000035	2023-01-17	test	4552	TN	610	Technology_GST-Blog-Banner_1-704x286-1	jpg	25.43 KB	image/jpeg	upload/bills/Technology_GST-Blog-Banner_1-704x286-1.jpg	6109881701202303500004552	79	2023-02-21 20:51:15	N
134	79	03	8148958988	0000053463	2023-01-10	terstt	678	TN	610	screencapture-10-163-19-176-nursecounsil-updating-Etransfer-dashboard-2023-02-16-11_11_54	png	81.46 KB	image/png	upload/bills/screencapture-10-163-19-176-nursecounsil-updating-Etransfer-dashboard-2023-02-16-11_11_54.png	6109881001202346300000678	79	2023-02-21 20:29:40	N
125	79	03	8148958988	0000000123	2022-11-22	test	4555	TN	586	screencapture-10-163-19-176-nursecounsil-updating-Etransfer-dashboard-2023-02-16-11_11_54	png	81.46 KB	image/png	upload/bills/screencapture-10-163-19-176-nursecounsil-updating-Etransfer-dashboard-2023-02-16-11_11_54.png	432432434	79	2023-02-21 01:16:16	N
124	79	03	8148958988	0000012345	2022-11-10	test	500	TN	610	tn_logo	png	144.13 KB	image/png	upload/bills/tn_logo.png	432432434	79	2023-02-21 01:23:40	N
148	79	03	8148958988	0000243254	2023-01-03	test	354325	TN	610	screencapture-10-163-19-176-nursecounsil-updating-Etransfer-postdistribution-report-2023-02-16-10_59_57	png	104.55 KB	image/png	upload/bills/screencapture-10-163-19-176-nursecounsil-updating-Etransfer-postdistribution-report-2023-02-16-10_59_57.png	6109880301202325400354325	79	2023-02-22 07:16:15	N
137	79	03	8148958988	0000032424	2023-01-02	test	4564	TN	610	Technology_GST-Blog-Banner_1-704x286-1	jpg	25.43 KB	image/jpeg	upload/bills/Technology_GST-Blog-Banner_1-704x286-1.jpg	6109880201202342400004564	79	2023-02-21 20:33:55	N
152	79	03	8148958988	0000000243	2023-01-03	tetsa	3545	TN	610	murugesan	png	79.06 KB	image/png	upload/bills/murugesan.png	6109880301202324300003545	79	2023-02-22 07:15:55	N
155	83	03	9100000000	0000896587	2023-02-10	New Saravana Store Legend	2000	TN	586	3f917211366b04227f5fc009aa524a49_		148.61 KB	image/jpeg	83/155/3f917211366b04227f5fc009aa524a49_	2211M5860000001	83	2023-03-10 17:27:17	\N
156	83	03	9100000000	0000852478	2023-02-17	Pothys	5000	TN	586	045b4d31efc527e9f466e5accbe53a1c_		112.60 KB	image/jpeg	83/156/045b4d31efc527e9f466e5accbe53a1c_	202211/586/082/0000001	83	2023-03-10 18:08:46	\N
157	83	03	9100000000	0000777858	2023-02-24	Milky mist Private Limited	10000	TN	586	89f70dbc5e1a05c2a782f479541075ab_		451.93 KB	image/jpeg	83/157/89f70dbc5e1a05c2a782f479541075ab_	202211/586/082/858/000001	83	2023-03-10 18:15:54	\N
158	83	03	9100000000	13509	2023-03-12	Dindigul Thalapakatti	649	TN	586	6dc1057be6f1e59d4fb8dbd137bc6300_		77.93 KB	image/jpeg	83/158/6dc1057be6f1e59d4fb8dbd137bc6300_	202211/586/082/509/000001	83	2023-03-12 14:15:30	\N
159	83	03	9100000000	0000458965	2023-02-10	Thirumurugan Stores	2500	TN	586	7147ee776782ae7f46624f1b132bfd5e_		142.97 KB	image/jpeg	2023/586/02	202211/586/082/965/000001	83	2023-03-13 11:24:36	\N
160	83	03	9159698082	0000456362	2023-02-10	Velavan Stores	5200	TN	586	d62ac46179166b1b7447281955cd2ac8_		98.20 KB	image/jpeg	2023/586/02/d62ac46179166b1b7447281955cd2ac8_	202211/586/082/362/000001	83	2023-03-13 12:14:48	Y
\.


--
-- TOC entry 3067 (class 0 OID 620508)
-- Dependencies: 186
-- Data for Name: mst_config; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.mst_config (configid, schemecode, configcode, statecode, distcode, minimumbillamt, prizeamount, billentrystartdate, billentryenddate, billpurchasestartdate, billpurchaseenddate, billdrawdate, yymm, statusflag, createdby, createdon, updatedby, updatedon) FROM stdin;
1	02	02	TN	610	10	500	2023-01-01 00:00:00	2023-01-20 00:00:00	2022-10-01 00:00:00	2022-10-30 00:00:00	\N	2210	\N	\N	\N	\N	\N
2	03	03	TN	586	10	2000	2023-01-01 00:00:00	2023-01-30 00:00:00	2023-02-01 00:00:00	2023-02-28 00:00:00	2021-07-26 20:17:30.696395	2211	1	1	2021-07-26 20:17:30.696395	1	2021-07-26 20:17:30.696395
\.


--
-- TOC entry 3068 (class 0 OID 620511)
-- Dependencies: 187
-- Data for Name: mst_configlog; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.mst_configlog (configlogid, configid, schemecode, configcode, statecode, distcode, minimumbillamt, prizeamount, billentrystartdate, billentryenddate, billpurchasestartdate, billpurchaseenddate, billdrawdate, yymm, statusflag, createdby, createdon, updatedby, updatedon) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 620514)
-- Dependencies: 188
-- Data for Name: mst_district; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.mst_district (distid, distcode, statecode, distename, flag, createdon, createdby, updatedby, updatedon) FROM stdin;
123	589	TN	Tiruvallur	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
98	568	TN	Chennai	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
104	574	TN	Kanchipuram	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
126	595	TN	Vellore	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
101	571	TN	Dharmapuri	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
124	593	TN	Tiruvannamalai	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
127	596	TN	Viluppuram	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
115	584	TN	Salem	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
110	580	TN	Namakkal	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
103	573	TN	Erode	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
111	587	TN	Nilgiris	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
99	569	TN	Coimbatore	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
102	572	TN	Dindigul	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
106	576	TN	Karur	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
120	591	TN	Tiruchirappalli	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
112	581	TN	Perambalur	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
97	610	TN	Ariyalur	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
100	570	TN	Cuddalore	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
109	579	TN	Nagapattinam	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
125	590	TN	Tiruvarur	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
117	586	TN	Thanjavur	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
113	582	TN	Pudukkottai	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
116	585	TN	Sivaganga	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
108	578	TN	Madurai	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
118	588	TN	Theni	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
128	597	TN	Virudhunagar	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
114	583	TN	Ramanathapuram	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
119	594	TN	Thoothukudi (Tuticorin)	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
121	592	TN	Tirunelveli	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
105	575	TN	Kanyakumari	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
107	577	TN	Krishnagiri	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
122	634	TN	Tiruppur	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
\.


--
-- TOC entry 3070 (class 0 OID 620517)
-- Dependencies: 189
-- Data for Name: mst_scheme; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.mst_scheme (schemeid, schemecode, schemesname, schemelname, minimumbillamt, prizeamount, billentrystartdate, billentryenddate, billpurchasestartdate, billpurchaseenddate, billdrawdate, finyear, statusflag, yymm, configstate_dist, createdby, createdon, updatedby, updatedon) FROM stdin;
1	01	MyBill	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	202210	1	\N	\N	\N	\N
\.


--
-- TOC entry 3071 (class 0 OID 620520)
-- Dependencies: 190
-- Data for Name: mst_state; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.mst_state (stateid, statecode, stateename, statetname, stateut, flag, createdon, createdby, updatedby, updatedon) FROM stdin;
49	TN	Tamil Nadu	தமிழ்நாடு	0	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
\.


--
-- TOC entry 3072 (class 0 OID 620523)
-- Dependencies: 191
-- Data for Name: mst_user; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.mst_user (userid, schemecode, email, pwd, name, mobilenumber, statecode, distcode, ipaddress, deviceid, addr1, addr2, pincode, createdby, createdon, updatedby, updatedon, statusflag, profile_update) FROM stdin;
80	01	test@gmail.com	827ccb0eea8a706c4c34a16891f84e7b	Rahmath	9884778378	TN	610	127.0.0.1	W	test test test	test test test	600012	1	2023-02-21 01:56:42	80	2023-02-20 16:59:06.947114	t	Y
81	01	Cherna@kkk.cd	b075d9af3f15e709616e0084376f0219	Siva	6666666666	TN	572	10.163.19.153	W	sdasasdasdasdas	asdasdasasdas	600000	1	2023-02-21 21:53:19	81	2023-02-21 12:53:51.617895	t	Y
79	01	sivaeceerd@gmail.com	1955b38f13116a57e4de2134a139d139	siva	8148958988	TN	610	127.0.0.1	W	karungal palayam	cauvery road	638003	1	2023-02-17 19:40:37	79	2023-02-20 16:02:34.733488	t	Y
83	01	stalingalaxy@gmail.com	0e7517141fb53f21ee439b355b5a1d0a	Stalin Thomas	9159698082	TN	586	192.0.0.177	M	Address 1	Address 2	600000	1	2023-03-10 15:54:07	1	2023-03-10 15:54:07	t	\N
\.


--
-- TOC entry 3074 (class 0 OID 620539)
-- Dependencies: 193
-- Data for Name: mst_userlog; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.mst_userlog (userid, schemecode, email, pwd, name, mobilenumber, statusflag, statecode, distcode, ipaddress, deviceid, addr1, adr2, pincode, createdby, createdon, updatedby, updatedon, userlogid) FROM stdin;
79	01	sivaeceerd@gmail.com	1955b38f13116a57e4de2134a139d139	siva	8148958988	1	TN	610	127.0.0.1	W	\N	\N	\N	1	2023-02-17 19:40:37	1	2023-02-17 19:40:37	8
80	01	test@gmail.com	827ccb0eea8a706c4c34a16891f84e7b	Rahmath	9884778378	1	TN	610	127.0.0.1	W	\N	\N	\N	1	2023-02-21 01:56:42	1	2023-02-21 01:56:42	9
81	01	Cherna@kkk.cd	b075d9af3f15e709616e0084376f0219	Siva	6666666666	1	TN	572	10.163.19.153	W	\N	\N	\N	1	2023-02-21 21:53:19	1	2023-02-21 21:53:19	10
79	01	sivaeceerd@gmail.com	1955b38f13116a57e4de2134a139d139	siva	8148958988	1	TN	610	127.0.0.1	W	\N	\N	\N	1	2023-02-17 19:40:37	79	2023-02-17 10:41:27.904137	11
\.


--
-- TOC entry 3076 (class 0 OID 620550)
-- Dependencies: 195
-- Data for Name: mst_userlogindetail; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.mst_userlogindetail (userid, mobilenumber, ipaddress, deviceid, logintime, logouttime, logoutstatus, userloginid) FROM stdin;
79	8148958988	10.163.19.176	W	2023-02-21 17:14:26	2023-02-21 22:17:32.996242	0	101
79	8148958988	10.163.19.176	W	2023-02-20 22:40:52	2023-02-21 22:17:32.996242	0	89
79	8148958988	10.163.19.176	W	2023-02-21 21:50:32	2023-02-21 22:17:32.996242	0	83
79	8148958988	10.163.19.176	W	2023-02-21 21:30:20	2023-02-21 22:17:32.996242	0	80
79	8148958988	10.163.19.176	W	2023-02-21 21:14:14	2023-02-21 22:17:32.996242	0	78
79	8148958988	127.0.0.1	W	2023-02-21 19:24:38	2023-02-21 22:17:32.996242	0	73
79	8148958988	::1	W	2023-02-21 19:44:36	2023-02-21 22:17:32.996242	0	75
79	8148958988	127.0.0.1	W	2023-02-21 19:22:52	2023-02-21 22:17:32.996242	0	71
79	8148958988	127.0.0.1	W	2023-02-21 01:33:37	2023-02-21 22:17:32.996242	0	68
79	8148958988	10.163.19.176	W	2023-02-20 21:34:18	2023-02-21 22:17:32.996242	0	62
79	8148958988	10.163.19.176	W	2023-02-20 21:34:51	2023-02-21 22:17:32.996242	0	64
79	8148958988	127.0.0.1	W	2023-02-20 21:12:48	2023-02-21 22:17:32.996242	0	58
79	8148958988	10.163.19.173	W	2023-02-20 21:20:24	2023-02-21 22:17:32.996242	0	60
79	8148958988	127.0.0.1	W	2023-02-17 19:40:49	2023-02-21 22:17:32.996242	0	13
79	8148958988	127.0.0.1	W	2023-02-17 21:52:36	2023-02-21 22:17:32.996242	0	14
79	8148958988	127.0.0.1	W	2023-02-17 22:23:27	2023-02-21 22:17:32.996242	0	15
79	8148958988	127.0.0.1	W	2023-02-17 23:30:22	2023-02-21 22:17:32.996242	0	16
79	8148958988	127.0.0.1	W	2023-02-17 23:43:42	2023-02-21 22:17:32.996242	0	17
79	8148958988	10.163.19.176	W	2023-02-22 08:40:59	\N	1	102
81	6666666666	10.163.19.153	W	2023-02-21 21:53:30	2023-02-21 12:54:11.256307	0	85
79	8148958988	10.163.19.176	W	2023-02-20 22:48:45	2023-02-21 22:17:32.996242	0	90
79	8148958988	10.163.19.176	W	2023-02-21 21:52:27	2023-02-21 22:17:32.996242	0	84
79	8148958988	::1	W	2023-02-21 19:44:36	2023-02-21 22:17:32.996242	0	74
79	8148958988	127.0.0.1	W	2023-02-21 19:45:17	2023-02-21 22:17:32.996242	0	76
79	8148958988	10.163.19.176	W	2023-02-20 21:34:35	2023-02-21 22:17:32.996242	0	63
79	8148958988	127.0.0.1	W	2023-02-20 21:35:25	2023-02-21 22:17:32.996242	0	65
79	8148958988	10.163.19.176	W	2023-02-18 00:06:20	2023-02-21 22:17:32.996242	0	25
79	8148958988	10.163.19.176	W	2023-02-18 00:13:12	2023-02-21 22:17:32.996242	0	26
79	8148958988	10.163.19.176	W	2023-02-18 02:11:59	2023-02-21 22:17:32.996242	0	27
79	8148958988	10.163.19.176	W	2023-02-18 02:12:11	2023-02-21 22:17:32.996242	0	28
79	8148958988	10.163.19.176	W	2023-02-18 02:12:32	2023-02-21 22:17:32.996242	0	29
79	8148958988	10.163.19.176	W	2023-02-18 02:12:36	2023-02-21 22:17:32.996242	0	30
79	8148958988	10.163.19.176	W	2023-02-18 02:12:55	2023-02-21 22:17:32.996242	0	31
79	8148958988	10.163.19.176	W	2023-02-18 02:12:59	2023-02-21 22:17:32.996242	0	32
79	8148958988	127.0.0.1	W	2023-02-18 02:15:17	2023-02-21 22:17:32.996242	0	33
80	9884778378	127.0.0.1	W	2023-02-21 01:58:40	\N	1	69
79	8148958988	127.0.0.1	W	2023-02-18 02:31:51	2023-02-21 22:17:32.996242	0	34
79	8148958988	127.0.0.1	W	2023-02-18 02:33:54	2023-02-21 22:17:32.996242	0	35
79	8148958988	127.0.0.1	W	2023-02-18 02:39:43	2023-02-21 22:17:32.996242	0	36
79	8148958988	127.0.0.1	W	2023-02-18 02:42:54	2023-02-21 22:17:32.996242	0	37
79	8148958988	127.0.0.1	W	2023-02-18 02:55:48	2023-02-21 22:17:32.996242	0	38
79	8148958988	127.0.0.1	W	2023-02-18 03:00:49	2023-02-21 22:17:32.996242	0	39
79	8148958988	127.0.0.1	W	2023-02-20 19:09:00	2023-02-21 22:17:32.996242	0	40
79	8148958988	127.0.0.1	W	2023-02-20 19:52:36	2023-02-21 22:17:32.996242	0	41
79	8148958988	10.163.19.176	W	2023-02-20 20:54:54	2023-02-21 22:17:32.996242	0	42
79	8148958988	10.163.19.176	W	2023-02-20 20:55:02	2023-02-21 22:17:32.996242	0	43
79	8148958988	10.163.19.176	W	2023-02-20 20:55:21	2023-02-21 22:17:32.996242	0	44
79	8148958988	10.163.19.176	W	2023-02-20 20:55:34	2023-02-21 22:17:32.996242	0	45
79	8148958988	10.163.19.176	W	2023-02-20 20:55:50	2023-02-21 22:17:32.996242	0	46
79	8148958988	10.163.19.176	W	2023-02-20 20:56:35	2023-02-21 22:17:32.996242	0	47
79	8148958988	10.163.19.176	W	2023-02-20 20:57:05	2023-02-21 22:17:32.996242	0	48
79	8148958988	10.163.19.148	W	2023-02-21 21:54:56	2023-02-21 22:17:32.996242	0	86
79	8148958988	10.163.19.148	W	2023-02-21 22:21:12	2023-02-21 22:17:32.996242	0	88
79	8148958988	10.163.19.176	W	2023-02-20 20:57:37	2023-02-21 22:17:32.996242	0	49
79	8148958988	127.0.0.1	W	2023-02-20 20:58:21	2023-02-21 22:17:32.996242	0	50
79	8148958988	127.0.0.1	W	2023-02-20 20:58:27	2023-02-21 22:17:32.996242	0	51
79	8148958988	127.0.0.1	W	2023-02-20 20:58:32	2023-02-21 22:17:32.996242	0	52
79	8148958988	127.0.0.1	W	2023-02-20 22:31:32	2023-02-21 22:17:32.996242	0	67
79	8148958988	127.0.0.1	W	2023-02-17 23:51:19	2023-02-21 22:17:32.996242	0	18
79	8148958988	10.163.19.173	W	2023-02-18 00:02:26	2023-02-21 22:17:32.996242	0	19
79	8148958988	10.163.19.173	W	2023-02-18 00:02:39	2023-02-21 22:17:32.996242	0	20
79	8148958988	::1	W	2023-02-18 00:04:14	2023-02-21 22:17:32.996242	0	21
79	8148958988	10.163.19.176	W	2023-02-18 00:05:01	2023-02-21 22:17:32.996242	0	22
79	8148958988	10.163.19.176	W	2023-02-18 00:05:53	2023-02-21 22:17:32.996242	0	23
79	8148958988	10.163.19.176	W	2023-02-18 00:06:05	2023-02-21 22:17:32.996242	0	24
79	8148958988	127.0.0.1	W	2023-02-20 21:00:34	2023-02-21 22:17:32.996242	0	53
79	8148958988	127.0.0.1	W	2023-02-20 21:01:02	2023-02-21 22:17:32.996242	0	54
79	8148958988	127.0.0.1	W	2023-02-20 21:04:14	2023-02-21 22:17:32.996242	0	55
79	8148958988	127.0.0.1	W	2023-02-20 21:08:45	2023-02-21 22:17:32.996242	0	56
79	8148958988	10.163.19.148	W	2023-02-21 22:10:28	2023-02-21 22:17:32.996242	0	87
79	8148958988	127.0.0.1	W	2023-02-20 21:08:59	2023-02-21 22:17:32.996242	0	57
79	8148958988	10.163.19.173	W	2023-02-20 21:19:13	2023-02-21 22:17:32.996242	0	59
79	8148958988	10.163.19.176	W	2023-02-21 21:43:35	2023-02-21 22:17:32.996242	0	82
79	8148958988	127.0.0.1	W	2023-02-20 21:25:54	2023-02-21 22:17:32.996242	0	61
79	8148958988	127.0.0.1	W	2023-02-20 21:40:55	2023-02-21 22:17:32.996242	0	66
79	8148958988	10.163.19.176	W	2023-02-21 21:22:58	2023-02-21 22:17:32.996242	0	79
79	8148958988	127.0.0.1	W	2023-02-21 19:15:11	2023-02-21 22:17:32.996242	0	70
79	8148958988	127.0.0.1	W	2023-02-21 19:23:19	2023-02-21 22:17:32.996242	0	72
79	8148958988	127.0.0.1	W	2023-02-21 20:16:08	2023-02-21 22:17:32.996242	0	77
79	8148958988	10.163.19.176	W	2023-02-20 23:24:28	2023-02-21 22:17:32.996242	0	91
79	8148958988	10.163.19.176	W	2023-02-20 23:36:21	2023-02-21 22:17:32.996242	0	93
79	8148958988	10.163.19.176	W	2023-02-21 21:35:56	2023-02-21 22:17:32.996242	0	81
79	8148958988	10.163.19.176	W	2023-02-20 23:28:45	2023-02-21 22:17:32.996242	0	92
79	8148958988	10.163.19.176	W	2023-02-21 00:18:04	2023-02-21 22:17:32.996242	0	94
79	8148958988	10.163.19.176	W	2023-02-21 00:41:09	2023-02-21 22:17:32.996242	0	95
79	8148958988	10.163.19.176	W	2023-02-21 00:45:32	2023-02-21 22:17:32.996242	0	96
79	8148958988	10.163.19.176	W	2023-02-21 00:51:12	2023-02-21 22:17:32.996242	0	97
79	8148958988	10.163.19.148	W	2023-02-21 01:02:21	2023-02-21 22:17:32.996242	0	98
79	8148958988	10.163.19.148	W	2023-02-21 01:08:04	2023-02-21 22:17:32.996242	0	99
79	8148958988	10.163.19.176	W	2023-02-21 01:45:01	2023-02-21 22:17:32.996242	0	100
\.


--
-- TOC entry 3078 (class 0 OID 620555)
-- Dependencies: 197
-- Data for Name: test; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.test (id, fname) FROM stdin;
1	Paul
2	Paulw
\.


--
-- TOC entry 3064 (class 0 OID 585136)
-- Dependencies: 183
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: nursec
--

COPY public.test (id, name) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 185
-- Name: billdetail_billdetailid_seq; Type: SEQUENCE SET; Schema: mybillmyright; Owner: postgres
--

SELECT pg_catalog.setval('mybillmyright.billdetail_billdetailid_seq', 160, true);


--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 192
-- Name: mst_user_userid_seq; Type: SEQUENCE SET; Schema: mybillmyright; Owner: postgres
--

SELECT pg_catalog.setval('mybillmyright.mst_user_userid_seq', 83, true);


--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 194
-- Name: mst_userlog_userlogid_seq; Type: SEQUENCE SET; Schema: mybillmyright; Owner: postgres
--

SELECT pg_catalog.setval('mybillmyright.mst_userlog_userlogid_seq', 11, true);


--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 196
-- Name: mst_userlogindetail_userloginid_seq; Type: SEQUENCE SET; Schema: mybillmyright; Owner: postgres
--

SELECT pg_catalog.setval('mybillmyright.mst_userlogindetail_userloginid_seq', 102, true);


--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 198
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: mybillmyright; Owner: postgres
--

SELECT pg_catalog.setval('mybillmyright.test_id_seq', 2, true);


--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 182
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nursec
--

SELECT pg_catalog.setval('public.test_id_seq', 1, false);


--
-- TOC entry 2925 (class 2606 OID 620569)
-- Name: billdetail billdetail_pk; Type: CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.billdetail
    ADD CONSTRAINT billdetail_pk PRIMARY KEY (billdetailid);


--
-- TOC entry 2927 (class 2606 OID 620571)
-- Name: mst_config mst_config_pkey; Type: CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_config
    ADD CONSTRAINT mst_config_pkey PRIMARY KEY (configcode);


--
-- TOC entry 2929 (class 2606 OID 620573)
-- Name: mst_configlog mst_configlog_pkey; Type: CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_configlog
    ADD CONSTRAINT mst_configlog_pkey PRIMARY KEY (configlogid);


--
-- TOC entry 2931 (class 2606 OID 620575)
-- Name: mst_district mst_district_pkey; Type: CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_district
    ADD CONSTRAINT mst_district_pkey PRIMARY KEY (distcode);


--
-- TOC entry 2933 (class 2606 OID 620577)
-- Name: mst_scheme mst_scheme_pkey; Type: CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_scheme
    ADD CONSTRAINT mst_scheme_pkey PRIMARY KEY (schemecode);


--
-- TOC entry 2935 (class 2606 OID 620579)
-- Name: mst_state mst_state_pkey; Type: CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_state
    ADD CONSTRAINT mst_state_pkey PRIMARY KEY (statecode);


--
-- TOC entry 2937 (class 2606 OID 620581)
-- Name: mst_user mst_user_pkey; Type: CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_user
    ADD CONSTRAINT mst_user_pkey PRIMARY KEY (mobilenumber);


--
-- TOC entry 2923 (class 2606 OID 585141)
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: nursec
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- TOC entry 2938 (class 2606 OID 620582)
-- Name: billdetail billdetail_configcode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.billdetail
    ADD CONSTRAINT billdetail_configcode_fkey FOREIGN KEY (configcode) REFERENCES mybillmyright.mst_config(configcode);


--
-- TOC entry 2939 (class 2606 OID 620587)
-- Name: billdetail billdetail_distcode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.billdetail
    ADD CONSTRAINT billdetail_distcode_fkey FOREIGN KEY (distcode) REFERENCES mybillmyright.mst_district(distcode);


--
-- TOC entry 2940 (class 2606 OID 620592)
-- Name: billdetail billdetail_statecode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.billdetail
    ADD CONSTRAINT billdetail_statecode_fkey FOREIGN KEY (statecode) REFERENCES mybillmyright.mst_state(statecode);


--
-- TOC entry 2941 (class 2606 OID 620597)
-- Name: mst_configlog mst_configlog_configcode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_configlog
    ADD CONSTRAINT mst_configlog_configcode_fkey FOREIGN KEY (configcode) REFERENCES mybillmyright.mst_config(configcode) NOT VALID;


--
-- TOC entry 2942 (class 2606 OID 620602)
-- Name: mst_configlog mst_configlog_schemecode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_configlog
    ADD CONSTRAINT mst_configlog_schemecode_fkey FOREIGN KEY (schemecode) REFERENCES mybillmyright.mst_scheme(schemecode) NOT VALID;


--
-- TOC entry 2943 (class 2606 OID 620607)
-- Name: mst_user mst_user_distcode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_user
    ADD CONSTRAINT mst_user_distcode_fkey FOREIGN KEY (distcode) REFERENCES mybillmyright.mst_district(distcode);


--
-- TOC entry 2944 (class 2606 OID 620612)
-- Name: mst_user mst_user_schemecode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_user
    ADD CONSTRAINT mst_user_schemecode_fkey FOREIGN KEY (schemecode) REFERENCES mybillmyright.mst_scheme(schemecode);


--
-- TOC entry 2945 (class 2606 OID 620617)
-- Name: mst_user mst_user_statecode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_user
    ADD CONSTRAINT mst_user_statecode_fkey FOREIGN KEY (statecode) REFERENCES mybillmyright.mst_state(statecode);


--
-- TOC entry 2946 (class 2606 OID 620622)
-- Name: mst_userlog mst_userlog_distcode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_userlog
    ADD CONSTRAINT mst_userlog_distcode_fkey FOREIGN KEY (distcode) REFERENCES mybillmyright.mst_district(distcode) NOT VALID;


--
-- TOC entry 2947 (class 2606 OID 620627)
-- Name: mst_userlog mst_userlog_schemecode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_userlog
    ADD CONSTRAINT mst_userlog_schemecode_fkey FOREIGN KEY (schemecode) REFERENCES mybillmyright.mst_scheme(schemecode) NOT VALID;


--
-- TOC entry 2948 (class 2606 OID 620632)
-- Name: mst_userlog mst_userlog_statecode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_userlog
    ADD CONSTRAINT mst_userlog_statecode_fkey FOREIGN KEY (statecode) REFERENCES mybillmyright.mst_state(statecode) NOT VALID;


--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA mybillmyright; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA mybillmyright FROM PUBLIC;
REVOKE ALL ON SCHEMA mybillmyright FROM postgres;
GRANT ALL ON SCHEMA mybillmyright TO postgres;
GRANT ALL ON SCHEMA mybillmyright TO nursec;


--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: nursec
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM nursec;
GRANT ALL ON SCHEMA public TO nursec;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 184
-- Name: TABLE billdetail; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.billdetail FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.billdetail FROM postgres;
GRANT ALL ON TABLE mybillmyright.billdetail TO postgres;
GRANT ALL ON TABLE mybillmyright.billdetail TO nursec;


--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 185
-- Name: SEQUENCE billdetail_billdetailid_seq; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON SEQUENCE mybillmyright.billdetail_billdetailid_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE mybillmyright.billdetail_billdetailid_seq FROM postgres;
GRANT ALL ON SEQUENCE mybillmyright.billdetail_billdetailid_seq TO postgres;
GRANT ALL ON SEQUENCE mybillmyright.billdetail_billdetailid_seq TO nursec;


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 186
-- Name: TABLE mst_config; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.mst_config FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_config FROM postgres;
GRANT ALL ON TABLE mybillmyright.mst_config TO postgres;
GRANT ALL ON TABLE mybillmyright.mst_config TO nursec;


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 187
-- Name: TABLE mst_configlog; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.mst_configlog FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_configlog FROM postgres;
GRANT ALL ON TABLE mybillmyright.mst_configlog TO postgres;
GRANT ALL ON TABLE mybillmyright.mst_configlog TO nursec;


--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 188
-- Name: TABLE mst_district; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.mst_district FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_district FROM postgres;
GRANT ALL ON TABLE mybillmyright.mst_district TO postgres;
GRANT ALL ON TABLE mybillmyright.mst_district TO nursec;


--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 189
-- Name: TABLE mst_scheme; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.mst_scheme FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_scheme FROM postgres;
GRANT ALL ON TABLE mybillmyright.mst_scheme TO postgres;
GRANT ALL ON TABLE mybillmyright.mst_scheme TO nursec;


--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 190
-- Name: TABLE mst_state; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.mst_state FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_state FROM postgres;
GRANT ALL ON TABLE mybillmyright.mst_state TO postgres;
GRANT ALL ON TABLE mybillmyright.mst_state TO nursec;


--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 191
-- Name: TABLE mst_user; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.mst_user FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_user FROM postgres;
GRANT ALL ON TABLE mybillmyright.mst_user TO postgres;
GRANT ALL ON TABLE mybillmyright.mst_user TO nursec;


--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 192
-- Name: SEQUENCE mst_user_userid_seq; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON SEQUENCE mybillmyright.mst_user_userid_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE mybillmyright.mst_user_userid_seq FROM postgres;
GRANT ALL ON SEQUENCE mybillmyright.mst_user_userid_seq TO postgres;
GRANT ALL ON SEQUENCE mybillmyright.mst_user_userid_seq TO nursec;


--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 193
-- Name: TABLE mst_userlog; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.mst_userlog FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_userlog FROM postgres;
GRANT ALL ON TABLE mybillmyright.mst_userlog TO postgres;
GRANT ALL ON TABLE mybillmyright.mst_userlog TO nursec;


--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 194
-- Name: SEQUENCE mst_userlog_userlogid_seq; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON SEQUENCE mybillmyright.mst_userlog_userlogid_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE mybillmyright.mst_userlog_userlogid_seq FROM postgres;
GRANT ALL ON SEQUENCE mybillmyright.mst_userlog_userlogid_seq TO postgres;
GRANT ALL ON SEQUENCE mybillmyright.mst_userlog_userlogid_seq TO nursec;


--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 195
-- Name: TABLE mst_userlogindetail; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.mst_userlogindetail FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_userlogindetail FROM postgres;
GRANT ALL ON TABLE mybillmyright.mst_userlogindetail TO postgres;
GRANT ALL ON TABLE mybillmyright.mst_userlogindetail TO nursec;


--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 196
-- Name: SEQUENCE mst_userlogindetail_userloginid_seq; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON SEQUENCE mybillmyright.mst_userlogindetail_userloginid_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE mybillmyright.mst_userlogindetail_userloginid_seq FROM postgres;
GRANT ALL ON SEQUENCE mybillmyright.mst_userlogindetail_userloginid_seq TO postgres;
GRANT ALL ON SEQUENCE mybillmyright.mst_userlogindetail_userloginid_seq TO nursec;


--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE test; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.test FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.test FROM postgres;
GRANT ALL ON TABLE mybillmyright.test TO postgres;
GRANT ALL ON TABLE mybillmyright.test TO nursec;


--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 198
-- Name: SEQUENCE test_id_seq; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON SEQUENCE mybillmyright.test_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE mybillmyright.test_id_seq FROM postgres;
GRANT ALL ON SEQUENCE mybillmyright.test_id_seq TO postgres;
GRANT ALL ON SEQUENCE mybillmyright.test_id_seq TO nursec;


--
-- TOC entry 1689 (class 826 OID 622103)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: mybillmyright; Owner: nursec
--

ALTER DEFAULT PRIVILEGES FOR ROLE nursec IN SCHEMA mybillmyright REVOKE ALL ON TABLES  FROM PUBLIC;


--
-- TOC entry 1688 (class 826 OID 585231)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO nursec;


-- Completed on 2023-03-13 16:41:46

--
-- PostgreSQL database dump complete
--

