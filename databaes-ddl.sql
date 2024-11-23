--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-11-11 09:55:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 219 (class 1259 OID 18763)
-- Name: boats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boats (
    id bigint NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    category_id integer NOT NULL,
    price_per_day numeric(10,2) NOT NULL,
    capacity integer NOT NULL,
    cabins_number integer NOT NULL,
    length numeric(5,2) NOT NULL,
    engine_power numeric(5,2) NOT NULL,
    ideal_id integer NOT NULL,
    equipments text NOT NULL,
    manufacture_date date NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE public.boats OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18766)
-- Name: boats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.boats_id_seq OWNER TO postgres;

--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 220
-- Name: boats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boats_id_seq OWNED BY public.boats.id;


--
-- TOC entry 224 (class 1259 OID 18862)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    group_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18861)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 223
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 222 (class 1259 OID 18813)
-- Name: category_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_groups (
    id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE public.category_groups OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18812)
-- Name: category_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_groups_id_seq OWNER TO postgres;

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 221
-- Name: category_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_groups_id_seq OWNED BY public.category_groups.id;


--
-- TOC entry 228 (class 1259 OID 18891)
-- Name: equipments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipments (
    id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE public.equipments OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18890)
-- Name: equipments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.equipments_id_seq OWNER TO postgres;

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 227
-- Name: equipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.equipments_id_seq OWNED BY public.equipments.id;


--
-- TOC entry 226 (class 1259 OID 18873)
-- Name: rents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rents (
    id bigint NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id bigint NOT NULL,
    boat_id bigint NOT NULL,
    date_from date NOT NULL,
    date_to date NOT NULL,
    user_description text,
    total numeric(10,2) NOT NULL,
    canceled_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE public.rents OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18872)
-- Name: rents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rents_id_seq OWNER TO postgres;

--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 225
-- Name: rents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rents_id_seq OWNED BY public.rents.id;


--
-- TOC entry 218 (class 1259 OID 16390)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(100) NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    birth_date date NOT NULL,
    profile_picture character varying,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);

CREATE TABLE public.contacts (
    id SERIAL PRIMARY KEY,
    user_uuid UUID NOT NULL, 
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15))
;

ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16389)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 217
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public.users.id;


--
-- TOC entry 4723 (class 2604 OID 18767)
-- Name: boats id; Type: DEFAULT; Schema: public; Owner: postgres
--


ALTER TABLE ONLY public.boats ALTER COLUMN id SET DEFAULT nextval('public.boats_id_seq'::regclass);


--
-- TOC entry 4729 (class 2604 OID 18865)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 4726 (class 2604 OID 18816)
-- Name: category_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_groups ALTER COLUMN id SET DEFAULT nextval('public.category_groups_id_seq'::regclass);


--
-- TOC entry 4735 (class 2604 OID 18894)
-- Name: equipments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipments ALTER COLUMN id SET DEFAULT nextval('public.equipments_id_seq'::regclass);


--
-- TOC entry 4732 (class 2604 OID 18876)
-- Name: rents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rents ALTER COLUMN id SET DEFAULT nextval('public.rents_id_seq'::regclass);


--
-- TOC entry 4720 (class 2604 OID 16393)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 4907 (class 0 OID 18763)
-- Dependencies: 219
-- Data for Name: boats; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.boats VALUES (1, '9bd54b3b-c6f5-4f3b-9bee-c84a72e3f3d5', 'Barco Sol Nascente', 'Barco confortável ideal para passeios familiares', 7, 550.00, 6, 2, 7.50, 90.00, 1, 'Wakeboard, Bóia rebocável, Gerador, Ar-condicionado, Alto-falantes do cockpit, Prancha de stand-up paddle, Guincho elétrico, Piloto automático, Chuveiro externo', '2021-06-15', '2024-11-09 16:31:19.944952', NULL);
INSERT INTO public.boats VALUES (2, 'f52d3cc1-bd32-43eb-a3bd-6759f4795ba7', 'Veleiro Oceano', 'Veleiro robusto, ideal para longas viagens', 8, 800.00, 8, 3, 10.00, 0.00, 2, 'Dessalinizador, Gerador, Painéis solares, GPS, Equipamento de mergulho com snorkel', '2019-03-28', '2024-11-09 16:31:19.944952', NULL);
INSERT INTO public.boats VALUES (3, '5fa43c70-0b94-4fc4-a810-a71a148a5dc5', 'Catamarã Aventura', 'Catamarã espaçoso e confortável para passeios e festas', 7, 1200.00, 12, 4, 12.50, 150.00, 3, 'Wakeboard, Jet ski, Ar-condicionado, Propulsor de proa, Banana inflável, Caiaque', '2022-01-10', '2024-11-09 16:31:19.944952', NULL);
INSERT INTO public.boats VALUES (4, '74980052-f76c-4c71-b6e6-07434f950cdd', 'Lancha Maré Mansa', 'Lancha esportiva para passeios rápidos', 1, 450.00, 4, 0, 6.00, 75.00, 1, 'Wakeboard, Prancha de stand-up paddle, Guincho elétrico, GPS, Chuveiro externo', '2020-05-22', '2024-11-09 16:31:19.944952', NULL);
INSERT INTO public.boats VALUES (5, '47774f38-4f23-4f59-9819-1566f6e72875', 'Iate de Luxo', 'Iate sofisticado com alta capacidade e cabines confortáveis', 6, 2500.00, 15, 6, 20.00, 400.00, 4, 'Ar-condicionado, Alto-falantes do cockpit, Guincho elétrico, Piloto automático, Chuveiro externo, Dessalinizador, Gerador, Painéis solares, GPS', '2018-09-18', '2024-11-09 16:31:19.944952', NULL);
INSERT INTO public.boats VALUES (6, '0353d608-c0a1-41d9-a2d2-46315729e71b', 'Catamarã Aventura', 'Catamarã espaçoso e confortável para passeios e festas', 7, 1200.00, 12, 4, 12.50, 150.00, 3, 'Wakeboard, Jet ski, Ar-condicionado, Propulsor de proa, Banana inflável, Caiaque', '2022-01-10', '2024-11-09 16:32:31.130947', NULL);
INSERT INTO public.boats VALUES (7, '4fe9e247-c22a-448d-b85e-fbf0090ff1dd', 'Iate Luxuoso', 'Iate sofisticado com alta capacidade e cabines confortáveis', 6, 2500.00, 15, 6, 20.00, 400.00, 4, 'Ar-condicionado, Alto-falantes do cockpit, Guincho elétrico, Piloto automático, Chuveiro externo, Dessalinizador, Gerador, Painéis solares, GPS', '2018-09-18', '2024-11-09 16:32:31.130947', NULL);
INSERT INTO public.boats VALUES (8, 'cf9bd668-06d3-4068-96b4-ec37d1577b4b', 'Veleiro Dos Mares', 'Veleiro de alta performance para viagens de longa distância', 8, 900.00, 10, 3, 15.00, 0.00, 2, 'Dessalinizador, Gerador, Painéis solares, GPS, Equipamento de mergulho com snorkel', '2017-05-25', '2024-11-09 16:32:31.130947', NULL);
INSERT INTO public.boats VALUES (9, '7197f12f-2ab4-4df8-a30a-b1331e6947d3', 'Lancha Poderosa', 'Lancha rápida e esportiva para passeios emocionantes', 1, 750.00, 5, 0, 8.00, 120.00, 1, 'Wakeboard, Prancha de stand-up paddle, Guincho elétrico, GPS, Chuveiro externo', '2020-08-12', '2024-11-09 16:32:31.130947', NULL);
INSERT INTO public.boats VALUES (10, 'badd124c-3339-419e-bbea-9bb08dea9489', 'Goleta Maravilha', 'Goleta clássica com amplo espaço para grupos', 9, 1100.00, 20, 5, 18.00, 200.00, 4, 'Ar-condicionado, Alto-falantes do cockpit, Chuveiro externo, GPS, Gerador', '2019-07-03', '2024-11-09 16:32:31.130947', NULL);
INSERT INTO public.boats VALUES (11, '63517a00-68cf-49cc-825d-7bb71c58cc40', 'Lancha Rápida', 'Ideal para passeios curtos e rápidos.', 1, 600.00, 4, 0, 5.80, 95.00, 1, 'Wakeboard, Ar-condicionado, Chuveiro externo, GPS', '2021-02-17', '2024-11-09 16:33:34.330628', NULL);
INSERT INTO public.boats VALUES (12, 'bc7138dc-89af-4eeb-b770-60159b332040', 'Iate Imperial', 'Iate de luxo com todas as comodidades.', 6, 2800.00, 18, 7, 22.00, 420.00, 3, 'Ar-condicionado, Gerador, GPS, Painéis solares, Dessalinizador', '2018-11-21', '2024-11-09 16:33:34.330628', NULL);
INSERT INTO public.boats VALUES (13, 'a401ea36-332b-48ca-b628-cdd6015eba39', 'Barco de Pesca', 'Equipado para pesca em alto mar.', 3, 850.00, 6, 1, 10.50, 150.00, 2, 'Autopiloto, Guincho elétrico, Chuveiro externo', '2019-06-14', '2024-11-09 16:33:34.330628', NULL);
INSERT INTO public.boats VALUES (14, '33f2bdf0-7725-497a-95d6-d10362825bc0', 'Catamarã Familiar', 'Perfeito para famílias e grupos médios.', 7, 1300.00, 10, 3, 13.50, 175.00, 3, 'Prancha de stand-up paddle, GPS, Alto-falantes do cockpit, Propulsor de proa', '2020-12-01', '2024-11-09 16:33:34.330628', NULL);
INSERT INTO public.boats VALUES (15, 'bd6d15e0-b4c9-454e-8365-42676cbee106', 'Goleta Ocean Explorer', 'Goleta robusta para exploração oceânica.', 9, 1450.00, 20, 5, 18.70, 250.00, 4, 'GPS, Gerador, Dessalinizador, Equipamento de mergulho com snorkel', '2017-04-23', '2024-11-09 16:33:34.330628', NULL);
INSERT INTO public.boats VALUES (16, 'cc53e169-b873-456c-8be4-420373852512', 'Veleiro Horizonte', 'Veleiro ideal para viagens longas e aventuras.', 8, 980.00, 8, 3, 12.00, 0.00, 2, 'Painéis solares, GPS, Guincho elétrico, Prancha de stand-up paddle', '2016-09-07', '2024-11-09 16:33:34.330628', NULL);
INSERT INTO public.boats VALUES (17, '6673034b-4ffe-4856-9dbc-77eb8b394f49', 'Barco Relax', 'Barco de pequeno porte para momentos relaxantes.', 3, 400.00, 4, 1, 7.20, 65.00, 1, 'Chuveiro externo, GPS, Prancha de stand-up paddle', '2022-02-19', '2024-11-09 16:33:34.330628', NULL);
INSERT INTO public.boats VALUES (18, '783b0052-e633-42ed-988d-562bb3eb9b09', 'Casa Flutuante', 'Casa-barco para uma experiência única.', 4, 700.00, 6, 2, 15.00, 50.00, 4, 'Ar-condicionado, Gerador, GPS', '2021-10-30', '2024-11-09 16:33:34.330628', NULL);
INSERT INTO public.boats VALUES (19, '7bd67f97-b10d-4d4b-9d0b-91d0080a0d15', 'Lancha Sunset', 'Perfeita para aproveitar o pôr do sol no mar.', 1, 550.00, 5, 1, 6.50, 90.00, 1, 'Alto-falantes do cockpit, Wakeboard, GPS', '2022-04-10', '2024-11-09 16:33:34.330628', NULL);
INSERT INTO public.boats VALUES (20, '1c38b183-7098-4e84-b47a-38d5c47bc965', 'Jet Ski Radical', 'Jet ski potente para atividades radicais.', 3, 250.00, 1, 0, 3.10, 110.00, 3, 'GPS', '2023-07-15', '2024-11-09 16:33:34.330628', NULL);
INSERT INTO public.boats VALUES (21, '549a7c66-ce37-495d-becf-76f85fee0349', 'Veleiro Cruzeiro', 'Ideal para longas travessias com conforto.', 8, 1200.00, 12, 4, 15.00, 0.00, 2, 'Painéis solares, Dessalinizador, Equipamento de mergulho com snorkel, GPS', '2019-01-13', '2024-11-09 16:33:34.330628', NULL);
INSERT INTO public.boats VALUES (22, '545cd2ae-f386-4c9c-9d56-0abb3e7836ac', 'Iate Exuberante', 'Iate com amplo espaço para eventos e festas.', 6, 3200.00, 20, 8, 23.50, 500.00, 4, 'Ar-condicionado, Gerador, Painéis solares, GPS, Chuveiro externo', '2018-08-27', '2024-11-09 16:33:34.330628', NULL);
INSERT INTO public.boats VALUES (23, '6312ac15-420f-4489-b548-8f69da618073', 'Barco Esportivo', 'Barco ágil para passeios e esportes aquáticos.', 1, 620.00, 4, 1, 7.00, 85.00, 2, 'Wakeboard, GPS, Chuveiro externo', '2021-03-29', '2024-11-09 16:33:34.330628', NULL);
INSERT INTO public.boats VALUES (24, '776aaadc-6c49-4832-b755-045093120265', 'Catamarã Festivo', 'Ideal para festas e eventos no mar.', 7, 1400.00, 14, 4, 14.00, 180.00, 3, 'Ar-condicionado, Prancha de stand-up paddle, GPS, Alto-falantes do cockpit', '2020-11-12', '2024-11-09 16:33:34.330628', NULL);
INSERT INTO public.boats VALUES (25, '9335ef1e-c9d9-49a0-9fc7-ed8c37ab578b', 'Goleta Clássica', 'Goleta de estilo clássico com muita personalidade.', 9, 1150.00, 16, 5, 19.00, 240.00, 4, 'GPS, Ar-condicionado, Gerador, Painéis solares', '2017-02-03', '2024-11-09 16:33:34.330628', NULL);
INSERT INTO public.boats VALUES (26, 'd48bc684-d9c1-4ffb-93f2-207c24fd3f25', 'Lancha Top Gun', 'Lancha veloz para momentos de adrenalina.', 1, 670.00, 3, 0, 6.00, 100.00, 1, 'Wakeboard, GPS, Chuveiro externo', '2021-12-20', '2024-11-09 16:33:34.330628', NULL);


--
-- TOC entry 4912 (class 0 OID 18862)
-- Dependencies: 224
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories VALUES (1, '764626a8-d5a3-4d8d-b42a-de0de10cb541', 'Lancha', 1, '2024-11-09 16:25:12.952843', NULL);
INSERT INTO public.categories VALUES (2, '95fe2f8b-8020-4035-ad6b-f333e8db187b', 'RIB', 1, '2024-11-09 16:25:12.952843', NULL);
INSERT INTO public.categories VALUES (3, 'e2462637-4e5f-4552-9f6f-8be9e268221a', 'Jet ski', 1, '2024-11-09 16:25:12.952843', NULL);
INSERT INTO public.categories VALUES (4, 'd4108233-7dfa-41e0-9a1f-f8c15b98c117', 'Casa-barco', 1, '2024-11-09 16:25:12.952843', NULL);
INSERT INTO public.categories VALUES (5, '6a05ab50-1c4e-431f-bcc1-2669ea805669', 'Barco sem licença', 1, '2024-11-09 16:25:12.952843', NULL);
INSERT INTO public.categories VALUES (6, '55913f8e-b355-4bed-bfd6-3c639da37b92', 'Iate a motor', 1, '2024-11-09 16:25:12.952843', NULL);
INSERT INTO public.categories VALUES (7, '82729962-1a80-41dc-b54e-3a57412d9dbc', 'Barco à vela', 2, '2024-11-09 16:25:12.952843', NULL);
INSERT INTO public.categories VALUES (8, 'a4dddb26-b4b0-4aaf-bc9a-268d1740c187', 'Veleiro', 2, '2024-11-09 16:25:12.952843', NULL);
INSERT INTO public.categories VALUES (9, 'c584b6db-39aa-439e-a29e-c11f61f811f7', 'Gulet', 2, '2024-11-09 16:25:12.952843', NULL);
INSERT INTO public.categories VALUES (10, 'bcda42c9-56cb-4935-af4c-8200788baa84', 'Iate à vela', 2, '2024-11-09 16:25:12.952843', NULL);


--
-- TOC entry 4910 (class 0 OID 18813)
-- Dependencies: 222
-- Data for Name: category_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category_groups VALUES (1, '2d52e279-bec5-4064-9608-a09bd02f0c3b', 'Motor', '2024-11-09 16:18:10.060475', NULL);
INSERT INTO public.category_groups VALUES (2, 'b38b16d4-c4c2-4c99-9e07-b1ba8f4f9c9f', 'Vela', '2024-11-09 16:18:10.060475', NULL);


--
-- TOC entry 4916 (class 0 OID 18891)
-- Dependencies: 228
-- Data for Name: equipments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.equipments VALUES (1, '92b5adb6-6008-4df6-832d-b14b7b8f53e3', 'Wakeboard', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (2, '3106e9ce-4a17-4050-be67-f7b35b6279dc', 'Bóia rebocável', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (3, 'f097f1f7-ab04-4b19-85ca-d56021c630e1', 'Dessalinizador', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (4, '55871d04-a371-4372-bd2c-664e9b7c9c72', 'Gerador', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (5, 'e249af43-3a0a-4bf0-86f9-24318db3662b', 'Ar-condicionado', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (6, '1cb344fb-6b5e-4434-b1b8-402e3397df50', 'Alto-falantes do cockpit', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (7, '72e1d555-ff52-4770-a332-e1740bd26acb', 'Prancha de stand-up paddle', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (8, '12df98bf-753a-471f-b382-13333da6968f', 'Guincho elétrico', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (9, '4470e951-ed71-494f-9fda-ab51946cef64', 'Piloto automático', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (10, '3f71b23e-a529-48a6-835f-31e14726f889', 'Bimini', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (11, '591bfe8b-4915-485f-a690-835069349b9e', 'Bote (ou barco auxiliar)', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (12, '9a0f6aa2-edce-4cfc-9128-ac1ba01a0104', 'Chuveiro externo', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (13, '93647f33-77ee-4344-8449-6e44b2a4ec95', 'Esquis aquáticos', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (14, 'db7e3617-4400-4a26-b4d8-d5ed416d6473', 'Banana inflável', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (15, 'e25dfd3a-3450-4736-a114-a9beade652d5', 'Propulsor de proa', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (16, '76634d61-2593-416d-b674-b5f34555c5ee', 'Gennaker', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (17, 'a6c17153-6827-4f2c-b8bf-e55e239d0a26', 'Motor para bote', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (18, 'b2e3747a-87fa-4568-b790-758190062f6b', 'Caiaque', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (19, 'f6a96a51-9785-4d5a-b923-15ea69ba5377', 'Equipamento de mergulho com snorkel', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (20, '37e20b9f-1de6-4695-8dcb-7bdc79ade4c0', 'Painéis solares', '2024-11-10 20:20:12.842388', NULL);
INSERT INTO public.equipments VALUES (21, '44e322a8-4a2b-4ce1-8c0c-3a582efe4b27', 'GPS', '2024-11-10 20:20:12.842388', NULL);


--
-- TOC entry 4914 (class 0 OID 18873)
-- Dependencies: 226
-- Data for Name: rents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rents VALUES (1, '260b0b58-fca7-4ca8-8d1c-13cf8dd08970', 1, 2, '2024-11-10', '2024-11-11', NULL, 1100.00, NULL, '2024-11-10 11:34:46.053445', NULL);
INSERT INTO public.rents VALUES (2, 'a9af116c-57ed-4d37-8266-befe8257ba35', 1, 4, '2024-11-12', '2024-11-13', NULL, 900.00, NULL, '2024-11-10 11:35:47.551543', NULL);
INSERT INTO public.rents VALUES (3, '3fd5c6da-f5fd-4f4f-b83e-16a1cb889e17', 1, 4, '2024-11-12', '2024-11-13', NULL, 900.00, NULL, '2024-11-10 11:39:50.42321', NULL);


--
-- TOC entry 4906 (class 0 OID 16390)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, '7dea13c5-2cc1-4538-97db-0d27861a9223', 'Gabriel Donizetti Dário', 'gd.dario110@gmail.com', '$argon2i$v=19$m=16,t=2,p=1$MTIzNDU2Nzg$ZZ/eAcHRleU4ChG0EJ+2Mw', '2001-07-16', NULL, '2024-10-27 15:53:10.162907', NULL, NULL);
INSERT INTO public.users VALUES (9, 'ab49c152-0a10-4fec-8653-470bcd4896d2', 'Makunouchi Ippo', 'test2@email.com', 'test@email.com', '2001-10-12', NULL, '2024-10-28 23:42:15.698662', NULL, NULL);
INSERT INTO public.users VALUES (10, 'b30d9a77-bd8a-4880-abe0-94989ffa414c', 'Makunouchi Ippo', 'test@e2mail.com', 'test@email.com', '2001-10-12', NULL, '2024-10-28 23:45:22.929616', NULL, NULL);
INSERT INTO public.users VALUES (11, '9062dccf-0f64-4435-ad63-3b2144bed9e3', 'Makunouchi Ippo', 'te2st@email.com', 'test@email.com', '2001-10-12', NULL, '2024-10-28 23:45:25.888822', NULL, NULL);
INSERT INTO public.users VALUES (12, '4ea5175c-73b6-43aa-b3a0-1cfbedf16684', 'Makunouchi Ippo', 'teblablast@email.com', 'test@email.com', '2001-10-12', NULL, '2024-10-28 23:45:56.810632', NULL, NULL);
INSERT INTO public.users VALUES (24, '82a9c6f8-10df-49dc-ae12-6fb6c5ff39e5', 'Makunouchi Ippo', 'test@email.com', 'password', '2001-10-12', NULL, '2024-11-09 22:23:13.341318', NULL, NULL);
INSERT INTO public.users VALUES (25, 'c2e34ed2-76d2-4791-ab8a-8a504f376c11', 'Makunouchi Ippo', 'test@email123.com', 'password', '2001-10-12', NULL, '2024-11-09 22:39:22.266587', NULL, NULL);
INSERT INTO public.users VALUES (26, '6e1d035b-d745-4d80-a4c2-bc15a207b9d9', 'Makunouchi Ippo', 'test@ippo.com', 'password', '2001-10-12', NULL, '2024-11-09 23:59:21.795994', NULL, NULL);
INSERT INTO public.users VALUES (27, '3b184e25-fcca-4381-8cef-f7781139045c', 'Makunouchi Ippo', 'test@email22222.com', 'password', '2001-10-12', NULL, '2024-11-10 11:29:04.910673', NULL, NULL);
INSERT INTO public.users VALUES (28, 'd036cb32-a11b-4c90-afb1-94cecf4981ed', 'Makunouchi Ippo', 'test@e123123mail.com', 'password', '2001-10-12', NULL, '2024-11-10 16:18:35.579881', NULL, NULL);


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 220
-- Name: boats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boats_id_seq', 26, true);


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 223
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 10, true);


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 221
-- Name: category_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_groups_id_seq', 2, true);


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 227
-- Name: equipments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipments_id_seq', 21, true);


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 225
-- Name: rents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rents_id_seq', 3, true);


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 217
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 28, true);


--
-- TOC entry 4745 (class 2606 OID 18772)
-- Name: boats boats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boats
    ADD CONSTRAINT boats_pkey PRIMARY KEY (id);


--
-- TOC entry 4747 (class 2606 OID 18777)
-- Name: boats boats_uuid_unique_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boats
    ADD CONSTRAINT boats_uuid_unique_constraint UNIQUE (uuid) INCLUDE (uuid);


--
-- TOC entry 4753 (class 2606 OID 18871)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4749 (class 2606 OID 18822)
-- Name: category_groups category_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_groups
    ADD CONSTRAINT category_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4751 (class 2606 OID 18824)
-- Name: category_groups category_groups_uuid_unique_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_groups
    ADD CONSTRAINT category_groups_uuid_unique_constraint UNIQUE (uuid) INCLUDE (uuid);


--
-- TOC entry 4757 (class 2606 OID 18900)
-- Name: equipments equipments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipments
    ADD CONSTRAINT equipments_pkey PRIMARY KEY (id);


--
-- TOC entry 4759 (class 2606 OID 18902)
-- Name: equipments equipments_uuid_unique_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipments
    ADD CONSTRAINT equipments_uuid_unique_constraint UNIQUE (uuid) INCLUDE (uuid);


--
-- TOC entry 4755 (class 2606 OID 18882)
-- Name: rents rents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rents
    ADD CONSTRAINT rents_pkey PRIMARY KEY (id);


--
-- TOC entry 4739 (class 2606 OID 16399)
-- Name: users user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 4741 (class 2606 OID 16407)
-- Name: users users_email_unique_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique_constraint UNIQUE (email) INCLUDE (email);


--
-- TOC entry 4743 (class 2606 OID 16405)
-- Name: users users_uuid_unique_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_uuid_unique_constraint UNIQUE (uuid) INCLUDE (uuid);


-- Completed on 2024-11-11 09:55:40

--
-- PostgreSQL database dump complete
--

