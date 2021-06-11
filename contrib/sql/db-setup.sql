--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5
-- Dumped by pg_dump version 13.3

-- Started on 2021-06-05 08:01:31 UTC

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
-- TOC entry 203 (class 1259 OID 16400)
-- Name: order_sequence; Type: SEQUENCE; Schema: public; Owner: $POSTGRESQL_USER;
--

CREATE SEQUENCE public.order_sequence
    START WITH 1000
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_sequence OWNER TO $POSTGRESQL_USER;


--
-- TOC entry 202 (class 1259 OID 16386)
-- Name: orders; Type: TABLE; Schema: public; Owner: $POSTGRESQL_USER
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    customer_id character varying(255),
    product_code character varying(255),
    quantity integer,
    price numeric(12,2),
    order_status character varying(255),
    version bigint DEFAULT 0
);


ALTER TABLE public.orders OWNER TO $POSTGRESQL_USER;

--
-- TOC entry 2820 (class 2606 OID 16399)
-- Name: orders order_pkey; Type: CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.order_sequence'::regclass);

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);

--
-- TOC entry 204 (class 1259 OID 16398)
-- Name: orders_outbox; Type: TABLE; Schema: public; Owner: $POSTGRESQL_USER
--

CREATE TABLE public.orders_outbox (
    id uuid NOT NULL,
    aggregatetype character varying(255),
    aggregateid character varying(255),
    payload text,
    content_type character varying(255)
);


ALTER TABLE public.orders_outbox OWNER TO $POSTGRESQL_USER;

--
-- TOC entry 2827 (class 2606 OID 16405)
-- Name: orders_outbox orders_outbox_pkey; Type: CONSTRAINT; Schema: public; Owner: orders
--

ALTER TABLE ONLY public.orders_outbox
    ADD CONSTRAINT orders_outbox_pkey PRIMARY KEY (id);


-- Completed on 2021-06-05 08:01:32 UTC

--
-- PostgreSQL database dump complete
--
