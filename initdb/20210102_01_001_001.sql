SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET default_tablespace = '';
SET default_with_oids = false;


CREATE TABLE public.beverages (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    images jsonb NOT NULL,
    price numeric(20,2) NOT NULL,
    availability boolean NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    deleted_by integer
);

CREATE SEQUENCE public.beverages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.beverages_id_seq OWNED BY public.beverages.id;


CREATE TABLE public.foods (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    images jsonb NOT NULL,
    price numeric(20,2) NOT NULL,
    availability boolean NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    deleted_by integer
);

CREATE SEQUENCE public.foods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.foods_id_seq OWNED BY public.foods.id;


CREATE TABLE public.roles (
    id integer NOT NULL,
    role character varying(50) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    deleted_by integer
);

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


CREATE TABLE public.transaction_details (
    id integer NOT NULL,
    transaction_id integer NOT NULL,
    food_or_beverage integer NOT NULL,
    amount integer NOT NULL
);

CREATE SEQUENCE public.transaction_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.transaction_details_id_seq OWNED BY public.transaction_details.id;


CREATE TABLE public.transactions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    invoice_number character varying NOT NULL,
    total_price numeric(20,2) NOT NULL,
    status character(20) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);

CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


CREATE TABLE public.users (
    id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    username character varying(100) NOT NULL,
    image character varying(256) NOT NULL,
    password character varying(256) NOT NULL,
    previous_password1 character varying(256),
    previous_password2 character varying(256),
    previous_password3 character varying(256),
    previous_password4 character varying(256),
    previous_password5 character varying(256),
    email character varying(100) NOT NULL,
    phone_number character varying(20) NOT NULL,
    full_address text NOT NULL,
    status character varying(20) NOT NULL,
    otp character varying(6),
    otp_expire_time timestamp without time zone,
    fcm_token character varying(256),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


CREATE TABLE public.users_role (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);

CREATE SEQUENCE public.users_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.users_role_id_seq OWNED BY public.users_role.id;


ALTER TABLE ONLY public.beverages ALTER COLUMN id SET DEFAULT nextval('public.beverages_id_seq'::regclass);

ALTER TABLE ONLY public.foods ALTER COLUMN id SET DEFAULT nextval('public.foods_id_seq'::regclass);

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);

ALTER TABLE ONLY public.transaction_details ALTER COLUMN id SET DEFAULT nextval('public.transaction_details_id_seq'::regclass);

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);

ALTER TABLE ONLY public.users_role ALTER COLUMN id SET DEFAULT nextval('public.users_role_id_seq'::regclass);
