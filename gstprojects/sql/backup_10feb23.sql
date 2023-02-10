--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 14.5

-- Started on 2023-02-10 16:37:14

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
-- TOC entry 7 (class 2615 OID 584913)
-- Name: mybillmyright; Type: SCHEMA; Schema: -; Owner: nursec
--

CREATE SCHEMA mybillmyright;


ALTER SCHEMA mybillmyright OWNER TO nursec;

SET default_tablespace = '';

--
-- TOC entry 194 (class 1259 OID 585586)
-- Name: billdetail; Type: TABLE; Schema: mybillmyright; Owner: nursec
--

CREATE TABLE mybillmyright.billdetail (
    billdetailid integer NOT NULL,
    userid integer NOT NULL,
    configcode character varying(2) NOT NULL,
    mobilenumber character varying(10) NOT NULL,
    billnumber character varying(5) NOT NULL,
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
    acknumber character varying(15) NOT NULL,
    uploadedby integer DEFAULT 1,
    uploadedon timestamp without time zone,
    statusflag integer DEFAULT 0 NOT NULL
);


ALTER TABLE mybillmyright.billdetail OWNER TO nursec;

--
-- TOC entry 193 (class 1259 OID 585584)
-- Name: billdetail_billdetailid_seq; Type: SEQUENCE; Schema: mybillmyright; Owner: nursec
--

CREATE SEQUENCE mybillmyright.billdetail_billdetailid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mybillmyright.billdetail_billdetailid_seq OWNER TO nursec;

--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 193
-- Name: billdetail_billdetailid_seq; Type: SEQUENCE OWNED BY; Schema: mybillmyright; Owner: nursec
--

ALTER SEQUENCE mybillmyright.billdetail_billdetailid_seq OWNED BY mybillmyright.billdetail.billdetailid;


--
-- TOC entry 182 (class 1259 OID 584921)
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
-- TOC entry 183 (class 1259 OID 584924)
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
-- TOC entry 184 (class 1259 OID 584927)
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
-- TOC entry 185 (class 1259 OID 584930)
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
-- TOC entry 186 (class 1259 OID 584933)
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
-- TOC entry 196 (class 1259 OID 586558)
-- Name: mst_user; Type: TABLE; Schema: mybillmyright; Owner: nursec
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
    statusflag boolean DEFAULT true
);


ALTER TABLE mybillmyright.mst_user OWNER TO nursec;

--
-- TOC entry 195 (class 1259 OID 586556)
-- Name: mst_user_userid_seq; Type: SEQUENCE; Schema: mybillmyright; Owner: nursec
--

CREATE SEQUENCE mybillmyright.mst_user_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mybillmyright.mst_user_userid_seq OWNER TO nursec;

--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 195
-- Name: mst_user_userid_seq; Type: SEQUENCE OWNED BY; Schema: mybillmyright; Owner: nursec
--

ALTER SEQUENCE mybillmyright.mst_user_userid_seq OWNED BY mybillmyright.mst_user.userid;


--
-- TOC entry 187 (class 1259 OID 584947)
-- Name: mst_userlog; Type: TABLE; Schema: mybillmyright; Owner: postgres
--

CREATE TABLE mybillmyright.mst_userlog (
    userlogid integer NOT NULL,
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
    updatedon timestamp without time zone
);


ALTER TABLE mybillmyright.mst_userlog OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 584956)
-- Name: mst_userlogindetail; Type: TABLE; Schema: mybillmyright; Owner: postgres
--

CREATE TABLE mybillmyright.mst_userlogindetail (
    userloginid integer NOT NULL,
    userid integer NOT NULL,
    mobilenumber character varying(10) NOT NULL,
    ipaddress character varying(20),
    deviceid character varying(1),
    logintime timestamp without time zone,
    logouttime timestamp without time zone,
    logoutstatus integer NOT NULL
);


ALTER TABLE mybillmyright.mst_userlogindetail OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 585213)
-- Name: test; Type: TABLE; Schema: mybillmyright; Owner: nursec
--

CREATE TABLE mybillmyright.test (
    id integer NOT NULL,
    fname character varying NOT NULL
);


ALTER TABLE mybillmyright.test OWNER TO nursec;

--
-- TOC entry 192 (class 1259 OID 585216)
-- Name: test_id_seq; Type: SEQUENCE; Schema: mybillmyright; Owner: nursec
--

CREATE SEQUENCE mybillmyright.test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mybillmyright.test_id_seq OWNER TO nursec;

--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 192
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: mybillmyright; Owner: nursec
--

ALTER SEQUENCE mybillmyright.test_id_seq OWNED BY mybillmyright.test.id;


--
-- TOC entry 190 (class 1259 OID 585136)
-- Name: test; Type: TABLE; Schema: public; Owner: nursec
--

CREATE TABLE public.test (
    id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.test OWNER TO nursec;

--
-- TOC entry 189 (class 1259 OID 585134)
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
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 189
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nursec
--

ALTER SEQUENCE public.test_id_seq OWNED BY public.test.id;


--
-- TOC entry 2904 (class 2604 OID 585589)
-- Name: billdetail billdetailid; Type: DEFAULT; Schema: mybillmyright; Owner: nursec
--

ALTER TABLE ONLY mybillmyright.billdetail ALTER COLUMN billdetailid SET DEFAULT nextval('mybillmyright.billdetail_billdetailid_seq'::regclass);


--
-- TOC entry 2907 (class 2604 OID 586561)
-- Name: mst_user userid; Type: DEFAULT; Schema: mybillmyright; Owner: nursec
--

ALTER TABLE ONLY mybillmyright.mst_user ALTER COLUMN userid SET DEFAULT nextval('mybillmyright.mst_user_userid_seq'::regclass);


--
-- TOC entry 2903 (class 2604 OID 585218)
-- Name: test id; Type: DEFAULT; Schema: mybillmyright; Owner: nursec
--

ALTER TABLE ONLY mybillmyright.test ALTER COLUMN id SET DEFAULT nextval('mybillmyright.test_id_seq'::regclass);


--
-- TOC entry 2902 (class 2604 OID 585139)
-- Name: test id; Type: DEFAULT; Schema: public; Owner: nursec
--

ALTER TABLE ONLY public.test ALTER COLUMN id SET DEFAULT nextval('public.test_id_seq'::regclass);


--
-- TOC entry 3069 (class 0 OID 585586)
-- Dependencies: 194
-- Data for Name: billdetail; Type: TABLE DATA; Schema: mybillmyright; Owner: nursec
--

COPY mybillmyright.billdetail (billdetailid, userid, configcode, mobilenumber, billnumber, billdate, shopname, billamount, statecode, distcode, filename, fileextension, filesize, mimetype, filepath, acknumber, uploadedby, uploadedon, statusflag) FROM stdin;
59	11	02	9876543210	75265	2022-11-16	Narayanan Tea Stall	5000	TN	586	d04e10c57301a3682aa172fdc69f435d_fcddcfef-48c8-4707-ba79-f0d482d57a1b7941576351862527752.jpg	jpg	196.02 KB	image/jpeg	11/59/d04e10c57301a3682aa172fdc69f435d_fcddcfef-48c8-4707-ba79-f0d482d57a1b7941576351862527752.jpg	2211M5860000001	11	2022-11-16 12:58:04	0
62	1	02	9159698082	85214	2022-06-08	Sri Ram Bhavan	2000	TN	610	8c72294a505393da6be92c25a228ed73_08592f82-0937-4d23-8c9f-4f6e4d7aad066318024896951378150.jpg	jpg	1.87 MB	image/jpeg	1/62/8c72294a505393da6be92c25a228ed73_08592f82-0937-4d23-8c9f-4f6e4d7aad066318024896951378150.jpg	2210M6100000001	1	2022-11-16 15:00:36	0
70	15	03	6383839414	78905	2022-10-29	Pothys	4000	TN	586	e204836a39bc72103ecb3156b9493ac4_image_picker7958929446301433140.jpg	jpg	134.26 KB	image/jpeg	15/70/e204836a39bc72103ecb3156b9493ac4_image_picker7958929446301433140.jpg	2211M5860000001	15	2022-11-16 20:30:30	0
56	1	02	9159698082	54321	2022-11-15	Surya Jewellery	10000	TN	586	9cfa05846fd4671d34bb4534cf87eb7e_image_picker6469893326416517755.jpg	jpg	2.42 MB	image/jpeg	1/56/9cfa05846fd4671d34bb4534cf87eb7e_image_picker6469893326416517755.jpg	2211M5860000001	1	2022-11-16 14:17:19	0
54	6	03	9894405547	6778	2022-11-13	test shop	3666	TN	610	e24d97b01b394e361d5872990d190106_image_picker1139424761469097503.jpg	jpg	84.80 KB	image/jpeg	6/54/e24d97b01b394e361d5872990d190106_image_picker1139424761469097503.jpg	2210M6100000001	6	2022-11-14 22:19:24	0
60	1	03	9159698082	56985	2022-11-16	siva shop	10000	TN	610	33699cd000d5d430ea55e7d972a08d7b_3556db49-d7fe-4600-955a-fc5d76f55a4d2887775012599187012.jpg	jpg	2.60 MB	image/jpeg	1/60/33699cd000d5d430ea55e7d972a08d7b_3556db49-d7fe-4600-955a-fc5d76f55a4d2887775012599187012.jpg	2210M6100000001	1	2022-11-16 14:27:50	0
55	6	03	9894405547	5667	2022-11-08	new shop	96396	TN	610	3b57edd6136195dff7d07c9eb2e44c46_52a3bbbb-dea4-40a6-9c85-fea64bdcd38f9011308192964243055.jpg	jpg	2.55 MB	image/jpeg	6/55/3b57edd6136195dff7d07c9eb2e44c46_52a3bbbb-dea4-40a6-9c85-fea64bdcd38f9011308192964243055.jpg	2210M6100000001	6	2022-11-14 22:21:58	1
53	1	02	9159698082	14587	2022-11-12	Moorthy Store	5000	TN	610	574eb10acc01e60eb46d2f4391e3fbb5_486aa7f4-7d10-44a4-9347-435f374353de3181113298887959105.jpg	jpg	2.55 MB	image/jpeg	1/53/574eb10acc01e60eb46d2f4391e3fbb5_486aa7f4-7d10-44a4-9347-435f374353de3181113298887959105.jpg	2210M6100000001	1	2022-11-14 21:06:00	1
75	1	03	9159698082	58080	2022-11-28	Nila  Store	1000	TN	586	5fddc6dd118b90df119e2ae0a71bae7f_		29.10 KB	image/jpeg	1/75/5fddc6dd118b90df119e2ae0a71bae7f_	2211M5860000001	1	2022-12-06 19:08:14	0
61	1	03	9159698082	26589	2022-11-16	siva shop	10000	TN	610	56b37aa35e57f28478e579d157de31fd_image_picker8926985675402334200.jpg	jpg	204.26 KB	image/jpeg	1/61/56b37aa35e57f28478e579d157de31fd_image_picker8926985675402334200.jpg	2210M6100000001	1	2022-11-16 14:27:54	0
68	13	03	9999999999	02	2022-11-15	NIC	108	TN	610	bc5983ac062f063aecb801b5a314ed96_image_picker3896664776686856780.jpg	jpg	125.77 KB	image/jpeg	13/68/bc5983ac062f063aecb801b5a314ed96_image_picker3896664776686856780.jpg	2210M6100000001	13	2022-11-16 15:53:45	1
52	1	02	9159698082	78965	2022-10-10	Vasanth & Co	2500	TN	610	bb17b5f0ebb1411fe9d0ea2c35e3d5bf_b0b6e2d1-ad31-4dfd-a8e4-beb0c49e62c72030161695191763957.jpg	jpg	2.34 MB	image/jpeg	1/52/bb17b5f0ebb1411fe9d0ea2c35e3d5bf_b0b6e2d1-ad31-4dfd-a8e4-beb0c49e62c72030161695191763957.jpg	2210M6100000001	1	2022-11-16 15:02:41	1
58	11	03	9876543210	78954	2022-11-16	Adayar Ananda Bawan	4000	TN	610	1f559a9b5ffc6ac50e8210ce21e21239_02d11c11-c593-4232-a2c5-582e9750786d370350230158781806.jpg	jpg	195.65 KB	image/jpeg	11/58/1f559a9b5ffc6ac50e8210ce21e21239_02d11c11-c593-4232-a2c5-582e9750786d370350230158781806.jpg	2210M6100000001	11	2022-11-16 12:46:00	0
64	1	03	9159698082	56985	2022-11-16	GRT	10000	TN	586	f143b09daeac390f6fca53026f7f2bee_474b3557-4fe0-4f66-9173-9c2cdb2e3bd94984069025305818682.jpg	jpg	2.82 MB	image/jpeg	1/64/f143b09daeac390f6fca53026f7f2bee_474b3557-4fe0-4f66-9173-9c2cdb2e3bd94984069025305818682.jpg	2211M5860000001	1	2022-11-16 14:51:54	0
65	12	03	9884778378	58962	2022-11-16	Saravana	500	TN	610	3e2adec9d768164541cbc57093df1c0a_e486db11-f3c5-4c1b-be2e-18202b9b77e78177755750542656330.jpg	jpg	1.84 MB	image/jpeg	12/65/3e2adec9d768164541cbc57093df1c0a_e486db11-f3c5-4c1b-be2e-18202b9b77e78177755750542656330.jpg	2210M6100000001	12	2022-11-16 15:22:22	1
63	1	02	9159698082	98542	2022-11-16	Grt Jewellery new	10000	TN	586	fc750e73b6e31ca4016af754f1d51ab9_image_picker8182998887825061939.jpg	jpg	375.23 KB	image/jpeg	1/63/fc750e73b6e31ca4016af754f1d51ab9_image_picker8182998887825061939.jpg	2211M5860000001	1	2022-11-16 14:52:16	0
66	12	02	9884778378	6778	2022-09-08	Reliance	2000	TN	610	0f4a0526ca013ca497f35d886a2d857d_ce6653ab-6c69-4ce5-8fe4-878bc0c0f7e71536434426897054451.jpg	jpg	1.25 MB	image/jpeg	12/66/0f4a0526ca013ca497f35d886a2d857d_ce6653ab-6c69-4ce5-8fe4-878bc0c0f7e71536434426897054451.jpg	2210M6100000001	12	2022-11-16 19:08:12	0
71	1	03	9159698082	56985	2022-11-26	New legend	15000	TN	610	7d07f6a93f7ea95bd5e51310cdfbb859_image_picker4520839218905612888.png	png	270.51 KB	image/png	1/71/7d07f6a93f7ea95bd5e51310cdfbb859_image_picker4520839218905612888.png	2210M6100000001	1	2022-11-26 15:00:29	0
67	12	02	9884778378	456	2022-11-16	Trends	1099	TN	610	a408db5427e7e2f1fa8f4721b81f37f4_949af733-ac0e-4ff3-beea-fc8eb551e6f37558203899987553097.jpg	jpg	2.03 MB	image/jpeg	12/67/a408db5427e7e2f1fa8f4721b81f37f4_949af733-ac0e-4ff3-beea-fc8eb551e6f37558203899987553097.jpg	2210M6100000001	12	2022-11-16 15:36:11	1
69	15	03	6383839414	56988	2022-11-16	mithra stores	2000	TN	610	a7cf4eadb67c3b6b28fa8dbff4b70ae5_e21034d5-94aa-4712-8aa0-edeea91f6290156484745085736109.jpg	jpg	3.86 MB	image/jpeg	15/69/a7cf4eadb67c3b6b28fa8dbff4b70ae5_e21034d5-94aa-4712-8aa0-edeea91f6290156484745085736109.jpg	2210M6100000001	15	2022-11-16 20:21:06	1
72	1	03	9159698082	15654	2022-11-26	Hindustan Lever	1500	TN	610	336fbc794386ddd4feffd55c28f4e928_		17.35 KB	image/jpeg	1/72/336fbc794386ddd4feffd55c28f4e928_	2210M6100000001	1	2022-11-28 18:38:24	0
73	1	03	9159698082	78954	2022-11-26	New Anandam Silks	5000	TN	610	fe090e6c5007f207481a06338339fe0c_image_picker3612792263042747112.png	png	9.54 KB	image/jpeg	1/73/fe090e6c5007f207481a06338339fe0c_image_picker3612792263042747112.png	2210M6100000001	1	2022-11-26 15:34:05	0
74	1	03	9159698082	78954	2022-11-28	Chennai Silks	5000	TN	586	db697303fa841a9934152a93b6533e71_		6.21 KB	image/jpeg	1/74/db697303fa841a9934152a93b6533e71_	2211M5860000001	1	2022-11-28 13:14:59	1
76	1	03	9159698082	00271	2022-10-10	Cotton House	1300	TN	586	58d013f8fd06dad01e4131620eb2673f_		16.64 KB	image/jpeg	1/76/58d013f8fd06dad01e4131620eb2673f_	2211M5860000001	1	2022-11-28 21:33:11	0
77	26	03	9003532086	56325	2022-11-29	Mcp Muthayan Chettiyar & Sons	92000	TN	586	b1432e7b4e1be809d73a9fd615d106ec_		16.15 KB	image/jpeg	26/77/b1432e7b4e1be809d73a9fd615d106ec_	2211M5860000001	26	2022-11-29 23:04:17	0
85	1	03	9159698082	16545	2022-12-07	Mahalingam Stores	5500	TN	610	33355850eb3aa77f8bec94cb9ded5b0c_		9.35 KB	image/jpeg	1/85/33355850eb3aa77f8bec94cb9ded5b0c_	2210M6100000001	1	2022-12-07 12:42:34	0
57	1	03	9159698082	25693	2022-11-15	Reliance Fresh	15000	TN	610	14f74bab1abfe6257497e9b4b3fbf390_		114.40 KB	image/jpeg	1/57/14f74bab1abfe6257497e9b4b3fbf390_	2210M6100000001	1	2022-11-30 18:32:25	0
87	1	03	9100000000	14568	2022-12-08	Surya Jewellery	15000	TN	610	12a3d44ffe5428136bf397f247e4593d_		5.77 KB	image/jpeg	1/87/12a3d44ffe5428136bf397f247e4593d_	2210M6100000001	1	2022-12-08 12:20:43	0
88	1	03	9100000000	45678	2022-12-08	buhari hotel	2000	TN	610	4db6971d870a89f76d94b5dd59dd6837_		194.86 KB	image/jpeg	1/88/4db6971d870a89f76d94b5dd59dd6837_	2210M6100000001	1	2022-12-08 18:46:21	0
81	27	03	8695317672	BL565	2022-12-01	Narayanan Work Shop	1500	TN	610	abac4f422fe51e157ff1f0f33c0299c0_		157.08 KB	image/jpeg	27/81/abac4f422fe51e157ff1f0f33c0299c0_	2210M6100000001	27	2022-12-05 10:50:31	0
78	1	03	9159698082	01084	2022-11-30	Adyar motors	703	TN	610	8f582dcd8e67179494a57e3cca6da5e5_		63.75 KB	image/jpeg	1/78/8f582dcd8e67179494a57e3cca6da5e5_	2210M6100000001	1	2022-11-30 16:37:27	1
89	1	03	9100000000	45667	2022-12-13	kumaran silks	5000	TN	610	99da89e5b16baf5062de4e2ef66dd01b_		88.82 KB	image/jpeg	1/89/99da89e5b16baf5062de4e2ef66dd01b_	2210M6100000001	1	2022-12-13 10:55:07	0
90	1	03	9100000000	A6616	2022-12-13	Raman and Raman	88000	TN	586	5e4632b8cfcbcab3d821b37655e184d4_		168.17 KB	image/jpeg	1/90/5e4632b8cfcbcab3d821b37655e184d4_	2211M5860000001	1	2022-12-13 13:23:38	0
91	1	03	9100000000	W8539	2022-12-13	Maruthi Suzuki	15000	TN	610	a3fe93e0637ccbb936de0ccbac2a0be2_		225.34 KB	image/jpeg	1/91/a3fe93e0637ccbb936de0ccbac2a0be2_	2210M6100000001	1	2022-12-13 15:28:17	0
80	1	03	9159698082	78965	2022-12-01	Pothys	2500	TN	586	59598ed424b05f803a7e8d9e237fd13a_		32.51 KB	image/jpeg	1/80/59598ed424b05f803a7e8d9e237fd13a_	2211M5860000001	1	2022-12-01 11:04:38	1
82	1	03	9159698082	345gg	2022-11-30	Nicsi chennai	1000	TN	610	1dcfe3f7328f1b23ba80de1a85071963_		6.25 KB	image/jpeg	1/82/1dcfe3f7328f1b23ba80de1a85071963_	2210M6100000001	1	2022-12-05 17:07:25	1
79	1	03	9159698082	12345	2022-12-01	Khazana Jewellery	10000	TN	586	9cea8c0386818b834bc1a87678d28506_		27.43 KB	image/jpeg	1/79/9cea8c0386818b834bc1a87678d28506_	2211M5860000001	1	2022-12-01 10:11:42	1
83	1	03	9159698082	56688	2022-12-05	vani enterprizes	2000	TN	586	88245a80910887df4b1e13c8c436df88_		86.76 KB	image/jpeg	1/83/88245a80910887df4b1e13c8c436df88_	2211M5860000001	1	2022-12-05 17:52:43	1
93	1	03	9100000000	q2937	2022-12-16	Nic  Department	5000	TN	610	691a89605414e67c2ae5e87acc7257ff_		254.11 KB	image/jpeg	1/93/691a89605414e67c2ae5e87acc7257ff_	2210M6100000001	1	2022-12-16 16:54:05	0
99	1	03	9100000000	54321	2023-01-01	Krishna Bhawan	25000	TN	610	32e08e02897cb8354cb4ce832ea6c683_		75.71 KB	image/jpeg	1/99/32e08e02897cb8354cb4ce832ea6c683_	2210M6100000001	1	2023-01-04 06:38:05	0
84	1	03	9159698082	12365	2022-12-07	Krishna Store	1500	TN	586	f3e49ead57bd37046cd03543e91030ec_		31.03 KB	image/jpeg	1/84/f3e49ead57bd37046cd03543e91030ec_	2211M5860000001	1	2022-12-07 09:43:53	1
86	29	03	9445022233	12345	2022-11-10	vasanth and co	5000	TN	610	39a31be4d906fa7dad9f5712691795e9_		70.84 KB	image/jpeg	29/86/39a31be4d906fa7dad9f5712691795e9_	2210M6100000001	29	2022-12-07 12:37:12	0
92	1	03	9100000000	45324	2022-12-16	Kauri Hospital	18000	TN	586	271b8019575c937f2a26b3ae3fafa4e4_		46.83 KB	image/jpeg	1/92/271b8019575c937f2a26b3ae3fafa4e4_	2211M5860000001	1	2022-12-19 18:29:16	0
94	1	03	9100000000	g2146	2022-12-19	Hero motor corp	50000	TN	586	a8c6356dc14dc4b769553da81a703e55_		77.95 KB	image/jpeg	1/94/a8c6356dc14dc4b769553da81a703e55_	2211M5860000001	1	2022-12-19 18:43:59	0
95	1	03	9100000000	80806	2022-12-20	Nicsi	5000	TN	586	71525f5f4e6609180bedcadd006f51b2_		144.02 KB	image/jpeg	1/95/71525f5f4e6609180bedcadd006f51b2_	2211M5860000001	1	2022-12-20 10:04:40	0
96	30	03	9100000000	b123	2022-12-20	sisl	2000	TN	610	6ef99994d9386f18e8fb7293a9ee320c_		30.09 KB	image/jpeg	30/96/6ef99994d9386f18e8fb7293a9ee320c_	2210M6100000001	30	2022-12-20 10:30:03	0
97	31	03	9100000000	58959	2022-12-13	siva textile	5000	TN	610	fcce697df56ea5a1ebc8f889e4f1feed_		12.96 KB	image/jpeg	31/97/fcce697df56ea5a1ebc8f889e4f1feed_	2210M6100000001	31	2022-12-20 10:46:27	0
98	1	03	9100000000	90909	2023-01-01	SS Marthandam stores	10000	TN	586	10d2461ad0d5a258a7b93c427f720444_		94.70 KB	image/jpeg	1/98/10d2461ad0d5a258a7b93c427f720444_	2211M5860000001	1	2023-01-01 19:34:28	0
101	1	03	9100000000	88988	2023-01-02	Test shop	2222	TN	586	04245975ba0ba3f94b0329143fc2321a_		118.34 KB	image/jpeg	1/101/04245975ba0ba3f94b0329143fc2321a_	2211M5860000001	1	2023-01-04 23:57:50	0
105	1	03	9100000000	76890	2022-11-02	sarath shopping	500	TN	610	4e276c356b333817eb3bc89b45451079_		66.53 KB	image/jpeg	1/105/4e276c356b333817eb3bc89b45451079_	2210M6100000001	1	2023-01-27 12:49:20	0
103	34	03	9100000000	12345	2023-01-18	Kasi Store	3000	TN	610	3f9cdf1ba08f2df11ff2aa17c110177d_		383.95 KB	image/jpeg	34/103/3f9cdf1ba08f2df11ff2aa17c110177d_	2210M6100000001	34	2023-01-25 13:47:08	0
106	35	03	9100000000	100	2023-01-20	grt	80000	TN	610	ef3f43efcdf927e1c9aed880d86bd490_		74.32 KB	image/jpeg	35/106/ef3f43efcdf927e1c9aed880d86bd490_	2210M6100000001	35	2023-01-27 12:56:06	1
100	1	03	9100000000	12347	2023-01-02	Test Shop Updated	5000	TN	586	c863f3ba4a17f1092a0378f554613efc_		74.20 KB	image/jpeg	1/100/c863f3ba4a17f1092a0378f554613efc_	2211M5860000001	1	2023-01-25 14:26:41	0
102	1	03	9100000000	14588	2023-01-09	Msm Travels	5000	TN	586	3680abc0392d691d24d115bbde7d23ba_		14.95 KB	image/jpeg	1/102/3680abc0392d691d24d115bbde7d23ba_	2211M5860000001	1	2023-01-30 13:24:28	0
104	35	03	9100000000	12345	2022-11-02	saravana	500	TN	610	45a15166d4589c5ae6521fc5cf541dc8_		50.19 KB	image/jpeg	35/104/45a15166d4589c5ae6521fc5cf541dc8_	2210M6100000001	35	2023-01-27 12:40:25	1
107	1	03	9100000000	78954	2023-01-27	Quick Heal	10000	TN	586	91621633201f9955c48cf0f87d544ab1_		43.20 KB	image/jpeg	1/107/91621633201f9955c48cf0f87d544ab1_	2211M5860000001	1	2023-01-28 06:34:34	0
\.


--
-- TOC entry 3057 (class 0 OID 584921)
-- Dependencies: 182
-- Data for Name: mst_config; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.mst_config (configid, schemecode, configcode, statecode, distcode, minimumbillamt, prizeamount, billentrystartdate, billentryenddate, billpurchasestartdate, billpurchaseenddate, billdrawdate, yymm, statusflag, createdby, createdon, updatedby, updatedon) FROM stdin;
2	03	03	TN	586	500	2000	2022-11-01 00:00:00	2022-11-30 00:00:00	2022-10-01 00:00:00	2022-10-30 00:00:00	2021-07-26 20:17:30.696395	2211	1	1	2021-07-26 20:17:30.696395	1	2021-07-26 20:17:30.696395
1	02	02	TN	610	500	500	2022-11-01 00:00:00	2022-11-10 00:00:00	2022-10-01 00:00:00	2022-10-30 00:00:00	\N	2210	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3058 (class 0 OID 584924)
-- Dependencies: 183
-- Data for Name: mst_configlog; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.mst_configlog (configlogid, configid, schemecode, configcode, statecode, distcode, minimumbillamt, prizeamount, billentrystartdate, billentryenddate, billpurchasestartdate, billpurchaseenddate, billdrawdate, yymm, statusflag, createdby, createdon, updatedby, updatedon) FROM stdin;
\.


--
-- TOC entry 3059 (class 0 OID 584927)
-- Dependencies: 184
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
-- TOC entry 3060 (class 0 OID 584930)
-- Dependencies: 185
-- Data for Name: mst_scheme; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.mst_scheme (schemeid, schemecode, schemesname, schemelname, minimumbillamt, prizeamount, billentrystartdate, billentryenddate, billpurchasestartdate, billpurchaseenddate, billdrawdate, finyear, statusflag, yymm, configstate_dist, createdby, createdon, updatedby, updatedon) FROM stdin;
1	01	MyBill	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	202210	1	\N	\N	\N	\N
\.


--
-- TOC entry 3061 (class 0 OID 584933)
-- Dependencies: 186
-- Data for Name: mst_state; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.mst_state (stateid, statecode, stateename, statetname, stateut, flag, createdon, createdby, updatedby, updatedon) FROM stdin;
49	TN	Tamil Nadu	தமிழ்நாடு	0	0	2022-10-14 14:45:37	1	1	2022-10-14 14:45:37
\.


--
-- TOC entry 3071 (class 0 OID 586558)
-- Dependencies: 196
-- Data for Name: mst_user; Type: TABLE DATA; Schema: mybillmyright; Owner: nursec
--

COPY mybillmyright.mst_user (userid, schemecode, email, pwd, name, mobilenumber, statecode, distcode, ipaddress, deviceid, addr1, addr2, pincode, createdby, createdon, updatedby, updatedon, statusflag) FROM stdin;
34	01	karmegam118@gmail.com	9513c522303b58e32d348a6236559f93	Cloud 	8695317672	TN	610	192.0.0.177	M	Address 3,east Street,kayarlabath,arasu cement factory.	Address 2	621704	1	2023-01-25 13:24:53	1	2023-01-25 13:24:53	t
35	01	rahamath.chennai@gmail.com	0e7517141fb53f21ee439b355b5a1d0a	Rahmath	9884778378	TN	610	192.0.0.177	M	23 Raja street	Address 2	600012	1	2023-01-27 12:27:21	1	2023-01-27 12:27:21	t
1	01	stalingalaxy@gmail.com	0e7517141fb53f21ee439b355b5a1d0a	Stalin	9159698082	TN	586	192.0.0.177	M	Milagay Pattam Street,\nVadagarai,Mallapuram(p.o),\nKumbakonam(t.k).	Address 2	612201	1	2022-11-04 15:38:58	1	2022-11-04 15:38:58	t
\.


--
-- TOC entry 3062 (class 0 OID 584947)
-- Dependencies: 187
-- Data for Name: mst_userlog; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.mst_userlog (userlogid, userid, schemecode, email, pwd, name, mobilenumber, statusflag, statecode, distcode, ipaddress, deviceid, addr1, adr2, pincode, createdby, createdon, updatedby, updatedon) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 584956)
-- Dependencies: 188
-- Data for Name: mst_userlogindetail; Type: TABLE DATA; Schema: mybillmyright; Owner: postgres
--

COPY mybillmyright.mst_userlogindetail (userloginid, userid, mobilenumber, ipaddress, deviceid, logintime, logouttime, logoutstatus) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 585213)
-- Dependencies: 191
-- Data for Name: test; Type: TABLE DATA; Schema: mybillmyright; Owner: nursec
--

COPY mybillmyright.test (id, fname) FROM stdin;
1	Paul
2	Paulw
\.


--
-- TOC entry 3065 (class 0 OID 585136)
-- Dependencies: 190
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: nursec
--

COPY public.test (id, name) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 193
-- Name: billdetail_billdetailid_seq; Type: SEQUENCE SET; Schema: mybillmyright; Owner: nursec
--

SELECT pg_catalog.setval('mybillmyright.billdetail_billdetailid_seq', 107, true);


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 195
-- Name: mst_user_userid_seq; Type: SEQUENCE SET; Schema: mybillmyright; Owner: nursec
--

SELECT pg_catalog.setval('mybillmyright.mst_user_userid_seq', 35, true);


--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 192
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: mybillmyright; Owner: nursec
--

SELECT pg_catalog.setval('mybillmyright.test_id_seq', 2, true);


--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 189
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nursec
--

SELECT pg_catalog.setval('public.test_id_seq', 1, false);


--
-- TOC entry 2929 (class 2606 OID 586753)
-- Name: billdetail billdetail_pk; Type: CONSTRAINT; Schema: mybillmyright; Owner: nursec
--

ALTER TABLE ONLY mybillmyright.billdetail
    ADD CONSTRAINT billdetail_pk PRIMARY KEY (billdetailid);


--
-- TOC entry 2917 (class 2606 OID 584961)
-- Name: mst_config mst_config_pkey; Type: CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_config
    ADD CONSTRAINT mst_config_pkey PRIMARY KEY (configcode);


--
-- TOC entry 2919 (class 2606 OID 584963)
-- Name: mst_configlog mst_configlog_pkey; Type: CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_configlog
    ADD CONSTRAINT mst_configlog_pkey PRIMARY KEY (configlogid);


--
-- TOC entry 2921 (class 2606 OID 584965)
-- Name: mst_district mst_district_pkey; Type: CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_district
    ADD CONSTRAINT mst_district_pkey PRIMARY KEY (distcode);


--
-- TOC entry 2923 (class 2606 OID 584967)
-- Name: mst_scheme mst_scheme_pkey; Type: CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_scheme
    ADD CONSTRAINT mst_scheme_pkey PRIMARY KEY (schemecode);


--
-- TOC entry 2925 (class 2606 OID 584969)
-- Name: mst_state mst_state_pkey; Type: CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_state
    ADD CONSTRAINT mst_state_pkey PRIMARY KEY (statecode);


--
-- TOC entry 2931 (class 2606 OID 586574)
-- Name: mst_user mst_user_pkey; Type: CONSTRAINT; Schema: mybillmyright; Owner: nursec
--

ALTER TABLE ONLY mybillmyright.mst_user
    ADD CONSTRAINT mst_user_pkey PRIMARY KEY (mobilenumber);


--
-- TOC entry 2927 (class 2606 OID 585141)
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: nursec
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- TOC entry 2937 (class 2606 OID 585594)
-- Name: billdetail billdetail_configcode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: nursec
--

ALTER TABLE ONLY mybillmyright.billdetail
    ADD CONSTRAINT billdetail_configcode_fkey FOREIGN KEY (configcode) REFERENCES mybillmyright.mst_config(configcode);


--
-- TOC entry 2938 (class 2606 OID 585599)
-- Name: billdetail billdetail_distcode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: nursec
--

ALTER TABLE ONLY mybillmyright.billdetail
    ADD CONSTRAINT billdetail_distcode_fkey FOREIGN KEY (distcode) REFERENCES mybillmyright.mst_district(distcode);


--
-- TOC entry 2939 (class 2606 OID 585604)
-- Name: billdetail billdetail_statecode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: nursec
--

ALTER TABLE ONLY mybillmyright.billdetail
    ADD CONSTRAINT billdetail_statecode_fkey FOREIGN KEY (statecode) REFERENCES mybillmyright.mst_state(statecode);


--
-- TOC entry 2932 (class 2606 OID 584987)
-- Name: mst_configlog mst_configlog_configcode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_configlog
    ADD CONSTRAINT mst_configlog_configcode_fkey FOREIGN KEY (configcode) REFERENCES mybillmyright.mst_config(configcode) NOT VALID;


--
-- TOC entry 2933 (class 2606 OID 584992)
-- Name: mst_configlog mst_configlog_schemecode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_configlog
    ADD CONSTRAINT mst_configlog_schemecode_fkey FOREIGN KEY (schemecode) REFERENCES mybillmyright.mst_scheme(schemecode) NOT VALID;


--
-- TOC entry 2940 (class 2606 OID 586575)
-- Name: mst_user mst_user_distcode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: nursec
--

ALTER TABLE ONLY mybillmyright.mst_user
    ADD CONSTRAINT mst_user_distcode_fkey FOREIGN KEY (distcode) REFERENCES mybillmyright.mst_district(distcode);


--
-- TOC entry 2941 (class 2606 OID 586580)
-- Name: mst_user mst_user_schemecode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: nursec
--

ALTER TABLE ONLY mybillmyright.mst_user
    ADD CONSTRAINT mst_user_schemecode_fkey FOREIGN KEY (schemecode) REFERENCES mybillmyright.mst_scheme(schemecode);


--
-- TOC entry 2942 (class 2606 OID 586585)
-- Name: mst_user mst_user_statecode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: nursec
--

ALTER TABLE ONLY mybillmyright.mst_user
    ADD CONSTRAINT mst_user_statecode_fkey FOREIGN KEY (statecode) REFERENCES mybillmyright.mst_state(statecode);


--
-- TOC entry 2934 (class 2606 OID 585012)
-- Name: mst_userlog mst_userlog_distcode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_userlog
    ADD CONSTRAINT mst_userlog_distcode_fkey FOREIGN KEY (distcode) REFERENCES mybillmyright.mst_district(distcode) NOT VALID;


--
-- TOC entry 2935 (class 2606 OID 585017)
-- Name: mst_userlog mst_userlog_schemecode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_userlog
    ADD CONSTRAINT mst_userlog_schemecode_fkey FOREIGN KEY (schemecode) REFERENCES mybillmyright.mst_scheme(schemecode) NOT VALID;


--
-- TOC entry 2936 (class 2606 OID 585022)
-- Name: mst_userlog mst_userlog_statecode_fkey; Type: FK CONSTRAINT; Schema: mybillmyright; Owner: postgres
--

ALTER TABLE ONLY mybillmyright.mst_userlog
    ADD CONSTRAINT mst_userlog_statecode_fkey FOREIGN KEY (statecode) REFERENCES mybillmyright.mst_state(statecode) NOT VALID;


--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: nursec
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM nursec;
GRANT ALL ON SCHEMA public TO nursec;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 182
-- Name: TABLE mst_config; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.mst_config FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_config FROM postgres;
GRANT ALL ON TABLE mybillmyright.mst_config TO postgres;
GRANT ALL ON TABLE mybillmyright.mst_config TO nursec;


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 183
-- Name: TABLE mst_configlog; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.mst_configlog FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_configlog FROM postgres;
GRANT ALL ON TABLE mybillmyright.mst_configlog TO postgres;
GRANT ALL ON TABLE mybillmyright.mst_configlog TO nursec;


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 184
-- Name: TABLE mst_district; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.mst_district FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_district FROM postgres;
GRANT ALL ON TABLE mybillmyright.mst_district TO postgres;
GRANT ALL ON TABLE mybillmyright.mst_district TO nursec;


--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 185
-- Name: TABLE mst_scheme; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.mst_scheme FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_scheme FROM postgres;
GRANT ALL ON TABLE mybillmyright.mst_scheme TO postgres;
GRANT ALL ON TABLE mybillmyright.mst_scheme TO nursec;


--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 186
-- Name: TABLE mst_state; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.mst_state FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_state FROM postgres;
GRANT ALL ON TABLE mybillmyright.mst_state TO postgres;
GRANT ALL ON TABLE mybillmyright.mst_state TO nursec;


--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 196
-- Name: TABLE mst_user; Type: ACL; Schema: mybillmyright; Owner: nursec
--

REVOKE ALL ON TABLE mybillmyright.mst_user FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_user FROM nursec;
GRANT ALL ON TABLE mybillmyright.mst_user TO nursec;


--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 187
-- Name: TABLE mst_userlog; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.mst_userlog FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_userlog FROM postgres;
GRANT ALL ON TABLE mybillmyright.mst_userlog TO postgres;
GRANT ALL ON TABLE mybillmyright.mst_userlog TO nursec;


--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 188
-- Name: TABLE mst_userlogindetail; Type: ACL; Schema: mybillmyright; Owner: postgres
--

REVOKE ALL ON TABLE mybillmyright.mst_userlogindetail FROM PUBLIC;
REVOKE ALL ON TABLE mybillmyright.mst_userlogindetail FROM postgres;
GRANT ALL ON TABLE mybillmyright.mst_userlogindetail TO postgres;
GRANT ALL ON TABLE mybillmyright.mst_userlogindetail TO nursec;


--
-- TOC entry 1684 (class 826 OID 585231)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO nursec;


-- Completed on 2023-02-10 16:37:14

--
-- PostgreSQL database dump complete
--

