-- Create the date_dim table
CREATE TABLE Date_Dim
(
    date_key INT ,
    full_date DATE,
    year INT,
    quarter INT,
    quarter_name VARCHAR(20),
    month INT,
    month_name VARCHAR(20),
    week INT,
    day INT,
    day_name VARCHAR(9)
);

CREATE TABLE Listing_Dim
(
    listing_key SERIAL ,
    listing_id bigint NOT NULL,
    name character varying(100),
    neighborhood_overview text ,
    picture_url character varying(250) ,
    host_id bigint,
    host_url character varying(50) ,
    host_name character varying(50) ,
    host_since date,
    host_location character varying(50) ,
    host_about text ,
    host_response_time character varying(50) ,
    host_response_rate character varying(50) ,
    host_acceptance_rate character varying(50) ,
    host_is_superhost boolean,
    host_picture_url character varying(150) ,
    host_neighbourhood text ,
    host_listings_count integer,
    host_total_listings_count smallint,
    host_verifications character varying(50),
    host_identity_verified boolean,
    neighbourhood_cleansed character varying(50) ,
    neighbourhood_group_cleansed character varying(50) ,
    latitude double precision,
    longitude double precision,
    property_type character varying(50) ,
    room_type character varying(50) ,
    accommodates smallint,
    price money,
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
    license text ,
    instant_bookable boolean,
    reviews_per_month double precision
);

CREATE TABLE Review_Fact (
    listing_key bigint,
    dateKey int,
	review_id bigint,
    reviewer_name varchar(50),
    comments text
);


CREATE TABLE Reservasion_Fact (
    listing_key bigint,
    dateKey int,
    available boolean,
    price money,
    adjusted_price varchar(20),
    minimum_nights int,
    maximum_nights int
);

-- Add primary key constraint to listing_Fact table
ALTER TABLE Listing_Dim ADD CONSTRAINT listing_Fact_PK PRIMARY KEY (listing_key);

-- Add primary key constraint to Date_Dim table
ALTER TABLE Date_Dim ADD CONSTRAINT Date_Dim_PK PRIMARY KEY (date_key);

-- Add constraints to Review_Fact Table
ALTER TABLE Review_Fact ADD CONSTRAINT FK_Review_listing FOREIGN KEY (listing_key ) REFERENCES Listing_Dim(listing_key);
ALTER TABLE Review_Fact ADD CONSTRAINT FK_Review_date FOREIGN KEY (dateKey) REFERENCES Date_Dim(date_key);
ALTER TABLE Review_Fact ADD CONSTRAINT PK_ReviewFact PRIMARY KEY (review_id );

-- Add constraints to Reservasion_Fact Table
ALTER TABLE Reservasion_Fact ADD CONSTRAINT FK_Reservasion_listing FOREIGN KEY (listing_key) REFERENCES Listing_Dim(listing_key);
ALTER TABLE Reservasion_Fact ADD CONSTRAINT FK_Reservasion_date FOREIGN KEY (dateKey) REFERENCES Date_Dim(date_key);

-- Loading of Date dimension

DO $$
DECLARE 
    StartDate DATE := '2010-07-10';  -- the first date in the data: first review date
    EndDate DATE := '2024-12-20';    -- the last date in the data: last upcoming reservation can happen this season
    DateKey INT;
BEGIN
    WHILE StartDate <= EndDate LOOP
        DateKey := CAST(TO_CHAR(StartDate, 'YYYYMMDD') AS INTEGER);

        INSERT INTO date_dim (date_key, full_date, year, quarter, quarter_name, month, month_name, week, day, day_name)
        VALUES (
            DateKey,
            StartDate,
            EXTRACT(YEAR FROM StartDate),
            EXTRACT(QUARTER FROM StartDate),
            'Q' || EXTRACT(QUARTER FROM StartDate),
            EXTRACT(MONTH FROM StartDate),
            TO_CHAR(StartDate, 'Month'),
            EXTRACT(WEEK FROM StartDate),
            EXTRACT(DAY FROM StartDate),
            TO_CHAR(StartDate, 'Day')
        );

        StartDate := StartDate + INTERVAL '1 day';
    END LOOP;
END $$;
