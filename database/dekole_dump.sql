--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
-- Name: airplane; Type: TABLE; Schema: public; Owner: dekole
--

CREATE TABLE public.airplane (
    id integer NOT NULL,
    model character varying,
    lines integer NOT NULL,
    columns integer NOT NULL,
    number character varying
);


ALTER TABLE public.airplane OWNER TO dekole;

--
-- Name: airplane_class; Type: TABLE; Schema: public; Owner: dekole
--

CREATE TABLE public.airplane_class (
    id integer NOT NULL,
    airplane_id integer NOT NULL,
    class_id integer NOT NULL,
    begin_line integer NOT NULL,
    end_line integer NOT NULL
);


ALTER TABLE public.airplane_class OWNER TO dekole;

--
-- Name: airplane_class_id_seq; Type: SEQUENCE; Schema: public; Owner: dekole
--

CREATE SEQUENCE public.airplane_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.airplane_class_id_seq OWNER TO dekole;

--
-- Name: airplane_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dekole
--

ALTER SEQUENCE public.airplane_class_id_seq OWNED BY public.airplane_class.id;


--
-- Name: airplane_id_seq; Type: SEQUENCE; Schema: public; Owner: dekole
--

CREATE SEQUENCE public.airplane_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.airplane_id_seq OWNER TO dekole;

--
-- Name: airplane_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dekole
--

ALTER SEQUENCE public.airplane_id_seq OWNED BY public.airplane.id;


--
-- Name: class; Type: TABLE; Schema: public; Owner: dekole
--

CREATE TABLE public.class (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.class OWNER TO dekole;

--
-- Name: class_id_seq; Type: SEQUENCE; Schema: public; Owner: dekole
--

CREATE SEQUENCE public.class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.class_id_seq OWNER TO dekole;

--
-- Name: class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dekole
--

ALTER SEQUENCE public.class_id_seq OWNED BY public.class.id;


--
-- Name: flight; Type: TABLE; Schema: public; Owner: dekole
--

CREATE TABLE public.flight (
    id integer NOT NULL,
    flight_number character varying NOT NULL,
    departure character varying NOT NULL,
    arrival character varying NOT NULL,
    airplane_id integer NOT NULL,
    date timestamp without time zone NOT NULL
);


ALTER TABLE public.flight OWNER TO dekole;

--
-- Name: flight_id_seq; Type: SEQUENCE; Schema: public; Owner: dekole
--

CREATE SEQUENCE public.flight_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flight_id_seq OWNER TO dekole;

--
-- Name: flight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dekole
--

ALTER SEQUENCE public.flight_id_seq OWNED BY public.flight.id;


--
-- Name: flight_price; Type: TABLE; Schema: public; Owner: dekole
--

CREATE TABLE public.flight_price (
    id integer NOT NULL,
    flight_id integer NOT NULL,
    airplane_class_id integer NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.flight_price OWNER TO dekole;

--
-- Name: flight_price_id_seq; Type: SEQUENCE; Schema: public; Owner: dekole
--

CREATE SEQUENCE public.flight_price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flight_price_id_seq OWNER TO dekole;

--
-- Name: flight_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dekole
--

ALTER SEQUENCE public.flight_price_id_seq OWNED BY public.flight_price.id;


--
-- Name: promotion; Type: TABLE; Schema: public; Owner: dekole
--

CREATE TABLE public.promotion (
    id integer NOT NULL,
    discount double precision NOT NULL,
    begin_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    flight_price_id integer NOT NULL
);


ALTER TABLE public.promotion OWNER TO dekole;

--
-- Name: promotion_id_seq; Type: SEQUENCE; Schema: public; Owner: dekole
--

CREATE SEQUENCE public.promotion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promotion_id_seq OWNER TO dekole;

--
-- Name: promotion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dekole
--

ALTER SEQUENCE public.promotion_id_seq OWNED BY public.promotion.id;


--
-- Name: reservation; Type: TABLE; Schema: public; Owner: dekole
--

CREATE TABLE public.reservation (
    id integer NOT NULL,
    client character varying NOT NULL,
    flight_id integer NOT NULL,
    date timestamp without time zone NOT NULL
);


ALTER TABLE public.reservation OWNER TO dekole;

--
-- Name: reservation_details; Type: TABLE; Schema: public; Owner: dekole
--

CREATE TABLE public.reservation_details (
    id integer NOT NULL,
    reservation_id integer NOT NULL,
    airplane_class_id integer NOT NULL,
    line integer NOT NULL,
    "column" integer NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.reservation_details OWNER TO dekole;

--
-- Name: reservation_details_id_seq; Type: SEQUENCE; Schema: public; Owner: dekole
--

CREATE SEQUENCE public.reservation_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_details_id_seq OWNER TO dekole;

--
-- Name: reservation_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dekole
--

ALTER SEQUENCE public.reservation_details_id_seq OWNED BY public.reservation_details.id;


--
-- Name: reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: dekole
--

CREATE SEQUENCE public.reservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_id_seq OWNER TO dekole;

--
-- Name: reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dekole
--

ALTER SEQUENCE public.reservation_id_seq OWNED BY public.reservation.id;


--
-- Name: airplane id; Type: DEFAULT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.airplane ALTER COLUMN id SET DEFAULT nextval('public.airplane_id_seq'::regclass);


--
-- Name: airplane_class id; Type: DEFAULT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.airplane_class ALTER COLUMN id SET DEFAULT nextval('public.airplane_class_id_seq'::regclass);


--
-- Name: class id; Type: DEFAULT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.class ALTER COLUMN id SET DEFAULT nextval('public.class_id_seq'::regclass);


--
-- Name: flight id; Type: DEFAULT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.flight ALTER COLUMN id SET DEFAULT nextval('public.flight_id_seq'::regclass);


--
-- Name: flight_price id; Type: DEFAULT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.flight_price ALTER COLUMN id SET DEFAULT nextval('public.flight_price_id_seq'::regclass);


--
-- Name: promotion id; Type: DEFAULT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.promotion ALTER COLUMN id SET DEFAULT nextval('public.promotion_id_seq'::regclass);


--
-- Name: reservation id; Type: DEFAULT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.reservation ALTER COLUMN id SET DEFAULT nextval('public.reservation_id_seq'::regclass);


--
-- Name: reservation_details id; Type: DEFAULT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.reservation_details ALTER COLUMN id SET DEFAULT nextval('public.reservation_details_id_seq'::regclass);


--
-- Data for Name: airplane; Type: TABLE DATA; Schema: public; Owner: dekole
--

COPY public.airplane (id, model, lines, columns, number) FROM stdin;
\.


--
-- Data for Name: airplane_class; Type: TABLE DATA; Schema: public; Owner: dekole
--

COPY public.airplane_class (id, airplane_id, class_id, begin_line, end_line) FROM stdin;
\.


--
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: dekole
--

COPY public.class (id, name) FROM stdin;
\.


--
-- Data for Name: flight; Type: TABLE DATA; Schema: public; Owner: dekole
--

COPY public.flight (id, flight_number, departure, arrival, airplane_id, date) FROM stdin;
\.


--
-- Data for Name: flight_price; Type: TABLE DATA; Schema: public; Owner: dekole
--

COPY public.flight_price (id, flight_id, airplane_class_id, price) FROM stdin;
\.


--
-- Data for Name: promotion; Type: TABLE DATA; Schema: public; Owner: dekole
--

COPY public.promotion (id, discount, begin_date, end_date, flight_price_id) FROM stdin;
\.


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: dekole
--

COPY public.reservation (id, client, flight_id, date) FROM stdin;
\.


--
-- Data for Name: reservation_details; Type: TABLE DATA; Schema: public; Owner: dekole
--

COPY public.reservation_details (id, reservation_id, airplane_class_id, line, "column", price) FROM stdin;
\.


--
-- Name: airplane_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dekole
--

SELECT pg_catalog.setval('public.airplane_class_id_seq', 1, false);


--
-- Name: airplane_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dekole
--

SELECT pg_catalog.setval('public.airplane_id_seq', 1, false);


--
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dekole
--

SELECT pg_catalog.setval('public.class_id_seq', 1, false);


--
-- Name: flight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dekole
--

SELECT pg_catalog.setval('public.flight_id_seq', 1, false);


--
-- Name: flight_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dekole
--

SELECT pg_catalog.setval('public.flight_price_id_seq', 1, false);


--
-- Name: promotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dekole
--

SELECT pg_catalog.setval('public.promotion_id_seq', 1, false);


--
-- Name: reservation_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dekole
--

SELECT pg_catalog.setval('public.reservation_details_id_seq', 1, false);


--
-- Name: reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dekole
--

SELECT pg_catalog.setval('public.reservation_id_seq', 1, false);


--
-- Name: airplane pk_airplane; Type: CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.airplane
    ADD CONSTRAINT pk_airplane PRIMARY KEY (id);


--
-- Name: airplane_class pk_airplane_class; Type: CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.airplane_class
    ADD CONSTRAINT pk_airplane_class PRIMARY KEY (id);


--
-- Name: flight pk_flight; Type: CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.flight
    ADD CONSTRAINT pk_flight PRIMARY KEY (id);


--
-- Name: flight_price pk_flight_price; Type: CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.flight_price
    ADD CONSTRAINT pk_flight_price PRIMARY KEY (id);


--
-- Name: promotion pk_promotion; Type: CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT pk_promotion PRIMARY KEY (id);


--
-- Name: reservation pk_reservation; Type: CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT pk_reservation PRIMARY KEY (id);


--
-- Name: reservation_details pk_reservation_details; Type: CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.reservation_details
    ADD CONSTRAINT pk_reservation_details PRIMARY KEY (id);


--
-- Name: class pk_tbl; Type: CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT pk_tbl PRIMARY KEY (id);


--
-- Name: airplane_class fk_airplane_class_airplane; Type: FK CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.airplane_class
    ADD CONSTRAINT fk_airplane_class_airplane FOREIGN KEY (airplane_id) REFERENCES public.airplane(id);


--
-- Name: airplane_class fk_airplane_class_class; Type: FK CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.airplane_class
    ADD CONSTRAINT fk_airplane_class_class FOREIGN KEY (class_id) REFERENCES public.class(id);


--
-- Name: flight fk_flight_airplane; Type: FK CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.flight
    ADD CONSTRAINT fk_flight_airplane FOREIGN KEY (airplane_id) REFERENCES public.airplane(id);


--
-- Name: flight_price fk_flight_price_airplane_class; Type: FK CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.flight_price
    ADD CONSTRAINT fk_flight_price_airplane_class FOREIGN KEY (airplane_class_id) REFERENCES public.airplane_class(id);


--
-- Name: flight_price fk_flight_price_flight; Type: FK CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.flight_price
    ADD CONSTRAINT fk_flight_price_flight FOREIGN KEY (flight_id) REFERENCES public.flight(id);


--
-- Name: promotion fk_promotion_flight_price; Type: FK CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT fk_promotion_flight_price FOREIGN KEY (flight_price_id) REFERENCES public.flight_price(id);


--
-- Name: reservation_details fk_reservation_details_airplane_class; Type: FK CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.reservation_details
    ADD CONSTRAINT fk_reservation_details_airplane_class FOREIGN KEY (airplane_class_id) REFERENCES public.airplane_class(id);


--
-- Name: reservation_details fk_reservation_details_reservation; Type: FK CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.reservation_details
    ADD CONSTRAINT fk_reservation_details_reservation FOREIGN KEY (reservation_id) REFERENCES public.reservation(id);


--
-- Name: reservation fk_reservation_flight; Type: FK CONSTRAINT; Schema: public; Owner: dekole
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fk_reservation_flight FOREIGN KEY (flight_id) REFERENCES public.flight(id);


--
-- PostgreSQL database dump complete
--

