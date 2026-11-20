--
-- PostgreSQL database dump
--

-- Dumped from database version 16.16 (Debian 16.16-1.pgdg13+1)
-- Dumped by pg_dump version 17.0

-- Started on 2026-11-19 20:31:06

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
-- TOC entry 216 (class 1259 OID 16395)
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);
ALTER TABLE ONLY public.authors ALTER COLUMN id SET (pg_attver=26968128);
ALTER TABLE ONLY public.authors ALTER COLUMN username SET (pg_attver=26968128);
ALTER TABLE ONLY public.authors ALTER COLUMN email SET (pg_attver=26968128);
ALTER TABLE ONLY public.authors ALTER COLUMN is_active SET (pg_attver=26968128);


ALTER TABLE public.authors OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16394)
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authors_id_seq OWNER TO postgres;

--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 215
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- TOC entry 218 (class 1259 OID 16405)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);
ALTER TABLE ONLY public.categories ALTER COLUMN id SET (pg_attver=27118184);
ALTER TABLE ONLY public.categories ALTER COLUMN name SET (pg_attver=27118184);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16404)
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
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 217
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 223 (class 1259 OID 24586)
-- Name: post_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_tags (
    post_id integer NOT NULL,
    tag_id integer NOT NULL
);
ALTER TABLE ONLY public.post_tags ALTER COLUMN post_id SET (pg_attver=27647112);
ALTER TABLE ONLY public.post_tags ALTER COLUMN tag_id SET (pg_attver=27647112);


ALTER TABLE public.post_tags OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16414)
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    author_id integer NOT NULL,
    category_id integer NOT NULL,
    body text,
    title character varying(200) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    views integer DEFAULT 0 NOT NULL,
    CONSTRAINT posts_views_not_negative CHECK ((views >= 0))
);
ALTER TABLE ONLY public.posts ALTER COLUMN id SET (pg_attver=27275944);
ALTER TABLE ONLY public.posts ALTER COLUMN author_id SET (pg_attver=27275944);
ALTER TABLE ONLY public.posts ALTER COLUMN category_id SET (pg_attver=27275944);
ALTER TABLE ONLY public.posts ALTER COLUMN body SET (pg_attver=27275944);
ALTER TABLE ONLY public.posts ALTER COLUMN title SET (pg_attver=27275944);
ALTER TABLE ONLY public.posts ALTER COLUMN created_at SET (pg_attver=27275944);
ALTER TABLE ONLY public.posts ALTER COLUMN views SET (pg_attver=27363144);


ALTER TABLE public.posts OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16413)
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO postgres;

--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 219
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- TOC entry 222 (class 1259 OID 24578)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(250) NOT NULL
);
ALTER TABLE ONLY public.tags ALTER COLUMN id SET (pg_attver=27523984);
ALTER TABLE ONLY public.tags ALTER COLUMN name SET (pg_attver=27523984);
ALTER TABLE ONLY public.tags ALTER COLUMN slug SET (pg_attver=27523984);


ALTER TABLE public.tags OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24577)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tags_id_seq OWNER TO postgres;

--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 221
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- TOC entry 3286 (class 2604 OID 16398)
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- TOC entry 3288 (class 2604 OID 16408)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3289 (class 2604 OID 16417)
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- TOC entry 3292 (class 2604 OID 24581)
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- TOC entry 3458 (class 0 OID 16395)
-- Dependencies: 216
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (id, username, email, is_active) FROM stdin;
1	Anna	123	t
2	Anton	345	t
\.


--
-- TOC entry 3460 (class 0 OID 16405)
-- Dependencies: 218
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
1	базы данных
2	новости
3	python
\.


--
-- TOC entry 3465 (class 0 OID 24586)
-- Dependencies: 223
-- Data for Name: post_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_tags (post_id, tag_id) FROM stdin;
1	1
2	1
3	2
4	2
5	3
6	3
\.


--
-- TOC entry 3462 (class 0 OID 16414)
-- Dependencies: 220
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, author_id, category_id, body, title, created_at, views) FROM stdin;
2	2	2	Мой второй пост	Занимательная математика	2026-11-18 17:51:36.122048	0
3	1	1	Мой третий пост	Занимательная астрономия	2026-11-18 17:51:36.122048	0
4	1	3	Мой первый пост	Занимательная физика	2026-11-18 17:52:55.449954	0
5	2	2	Мой второй пост	Занимательная математика	2026-11-18 17:52:55.449954	0
6	1	1	Мой третий пост	Занимательная астрономия	2026-11-18 17:52:55.449954	0
1	1	3	Мой первый пост	Занимательная физика	2026-11-18 17:51:36.122048	8
\.


--
-- TOC entry 3464 (class 0 OID 24578)
-- Dependencies: 222
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, name, slug) FROM stdin;
1	Новости	news
2	Советы	recommendations
3	Обучение	education
\.


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 215
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_id_seq', 2, true);


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 217
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 219
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 6, true);


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 221
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 3, true);


--
-- TOC entry 3295 (class 2606 OID 16401)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- TOC entry 3297 (class 2606 OID 16403)
-- Name: authors authors_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_username_key UNIQUE (username);


--
-- TOC entry 3299 (class 2606 OID 16412)
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- TOC entry 3301 (class 2606 OID 16410)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 24590)
-- Name: post_tags post_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_tags
    ADD CONSTRAINT post_tags_pkey PRIMARY KEY (post_id, tag_id);


--
-- TOC entry 3303 (class 2606 OID 16422)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 24585)
-- Name: tags tags_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_name_key UNIQUE (name);


--
-- TOC entry 3307 (class 2606 OID 24583)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 3312 (class 2606 OID 24591)
-- Name: post_tags post_tags_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_tags
    ADD CONSTRAINT post_tags_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- TOC entry 3313 (class 2606 OID 24596)
-- Name: post_tags post_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_tags
    ADD CONSTRAINT post_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- TOC entry 3310 (class 2606 OID 16423)
-- Name: posts posts_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- TOC entry 3311 (class 2606 OID 16428)
-- Name: posts posts_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


-- Completed on 2026-11-19 20:31:07

--
-- PostgreSQL database dump complete
--

