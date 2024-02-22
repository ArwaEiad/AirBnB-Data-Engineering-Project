-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.calendar
(
    listing_id bigint,
    date date,
    available boolean,
    price character varying(20) COLLATE pg_catalog."default",
    adjusted_price character varying(20) COLLATE pg_catalog."default",
    minimum_nights integer,
    maximum_nights integer
);

CREATE TABLE IF NOT EXISTS public.listings
(
    id bigint,
    listing_url character varying(50) COLLATE pg_catalog."default",
    scrape_id bigint,
    last_scraped date,
    source character varying(50) COLLATE pg_catalog."default",
    name character varying(100) COLLATE pg_catalog."default",
    description character varying(1) COLLATE pg_catalog."default",
    neighborhood_overview text COLLATE pg_catalog."default",
    picture_url character varying(250) COLLATE pg_catalog."default",
    host_id bigint,
    host_url character varying(50) COLLATE pg_catalog."default",
    host_name character varying(50) COLLATE pg_catalog."default",
    host_since date,
    host_location character varying(50) COLLATE pg_catalog."default",
    host_about text COLLATE pg_catalog."default",
    host_response_time character varying(50) COLLATE pg_catalog."default",
    host_response_rate character varying(50) COLLATE pg_catalog."default",
    host_acceptance_rate character varying(50) COLLATE pg_catalog."default",
    host_is_superhost boolean,
    host_thumbnail_url character varying(150) COLLATE pg_catalog."default",
    host_picture_url character varying(150) COLLATE pg_catalog."default",
    host_neighbourhood text COLLATE pg_catalog."default",
    host_listings_count integer,
    host_total_listings_count smallint,
    host_verifications character varying(50) COLLATE pg_catalog."default",
    host_has_profile_pic character varying(50) COLLATE pg_catalog."default",
    host_identity_verified boolean,
    neighbourhood character varying(50) COLLATE pg_catalog."default",
    neighbourhood_cleansed character varying(50) COLLATE pg_catalog."default",
    neighbourhood_group_cleansed character varying(50) COLLATE pg_catalog."default",
    latitude double precision,
    longitude double precision,
    property_type character varying(50) COLLATE pg_catalog."default",
    room_type character varying(50) COLLATE pg_catalog."default",
    accommodates smallint,
    bathrooms character varying(1) COLLATE pg_catalog."default",
    bathrooms_text character varying(50) COLLATE pg_catalog."default",
    bedrooms character varying(1) COLLATE pg_catalog."default",
    beds smallint,
    amenities character varying(50) COLLATE pg_catalog."default",
    price character varying(20) COLLATE pg_catalog."default",
    minimum_nights smallint,
    maximum_nights smallint,
    minimum_minimum_nights smallint,
    maximum_minimum_nights smallint,
    minimum_maximum_nights smallint,
    maximum_maximum_nights smallint,
    minimum_nights_avg_ntm double precision,
    maximum_nights_avg_ntm double precision,
    calendar_updated character varying(1) COLLATE pg_catalog."default",
    has_availability character varying(50) COLLATE pg_catalog."default",
    availability_30 smallint,
    availability_60 smallint,
    availability_90 smallint,
    availability_365 smallint,
    calendar_last_scraped date,
    number_of_reviews smallint,
    number_of_reviews_ltm integer,
    number_of_reviews_l30d integer,
    first_review date,
    last_review date,
    review_scores_rating double precision,
    review_scores_accuracy double precision,
    review_scores_cleanliness double precision,
    review_scores_checkin double precision,
    review_scores_communication double precision,
    review_scores_location double precision,
    review_scores_value double precision,
    license text COLLATE pg_catalog."default",
    instant_bookable boolean,
    calculated_host_listings_count integer,
    calculated_host_listings_count_entire_homes integer,
    calculated_host_listings_count_private_rooms integer,
    calculated_host_listings_count_shared_rooms smallint,
    reviews_per_month double precision
);

CREATE TABLE IF NOT EXISTS public.neighbourhoods
(
    neighbourhood_group character varying(25) COLLATE pg_catalog."default",
    neighbourhood character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT npk PRIMARY KEY (neighbourhood)
);

CREATE TABLE IF NOT EXISTS public.reviews
(
    listing_id bigint,
    id bigint,
    date date,
    reviewer_id bigint,
    reviewer_name character varying(50) COLLATE pg_catalog."default",
    comments text COLLATE pg_catalog."default"
);

ALTER TABLE IF EXISTS public.calendar
    ADD FOREIGN KEY (listing_id)
    REFERENCES public.listings (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.listings
    ADD FOREIGN KEY (neighbourhood_cleansed)
    REFERENCES public.neighbourhoods (neighbourhood) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.reviews
    ADD FOREIGN KEY (listing_id)
    REFERENCES public.listings (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;