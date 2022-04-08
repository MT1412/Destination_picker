

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.bridges DISABLE TRIGGER ALL;



ALTER TABLE public.bridges ENABLE TRIGGER ALL;


ALTER TABLE public.destinations DISABLE TRIGGER ALL;



ALTER TABLE public.destinations ENABLE TRIGGER ALL;


ALTER TABLE public.restaurants DISABLE TRIGGER ALL;



ALTER TABLE public.restaurants ENABLE TRIGGER ALL;


ALTER TABLE public.route DISABLE TRIGGER ALL;



ALTER TABLE public.route ENABLE TRIGGER ALL;


ALTER TABLE public.sections DISABLE TRIGGER ALL;



ALTER TABLE public.sections ENABLE TRIGGER ALL;


