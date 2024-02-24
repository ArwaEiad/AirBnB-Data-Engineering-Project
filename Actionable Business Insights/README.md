
***Q.1*** : **what was the cheapest most avaliable listing in Jan 2024? (the cheapest listing which was avaliable the most of the month) ?**

  ```PLpgSQL
  	with CTE As (
  		select "listingKey" , count(available) as no_of_available_days_in_june 
  		from public."Reservation_Fact" as RFact
  		inner join public."Date_Dim" as DDim
  		on  DDim.date_key = RFact."date_key" 
  		where DDim.month_name ='January' and DDim.year= 2024 and RFact.available= TRUE 
  		group by "listingKey"
  		)	
  
  	select listing_id,no_of_available_days_in_june ,price as general_price, name, neighborhood_overview, picture_url, host_id, host_url, host_name, host_since, host_location, host_about, host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost, host_picture_url, host_neighbourhood, host_listings_count, host_total_listings_count, host_verifications, host_identity_verified, neighbourhood_cleansed, neighbourhood_group_cleansed, latitude, longitude, property_type, room_type, accommodates, number_of_reviews, number_of_reviews_ltm, number_of_reviews_l30d, first_review, last_review, review_scores_rating, review_scores_accuracy, review_scores_cleanliness, review_scores_checkin, review_scores_communication, review_scores_location, review_scores_value, license, instant_bookable, reviews_per_month
  	from public."Listing_Dim" as LDim
  	inner join CTE
  	on LDim."listingKey" = CTE."listingKey"
  	where no_of_available_days_in_june > 15
  	order by general_price ,no_of_available_days_in_june desc 
  ```

	
***Q.2*** : **What are the most reviewed listings in November 2023 ?**

```PLpgSQL
	select "listingKey" ,count ("listingKey") as No_of_Reviews
	from public."Review_Fact" as RF
	inner join public."Date_Dim" as DD
	on DD.date_key=RF.date_key
	where DD.month_name ='November' and year = 2023
	group by "listingKey"
	order by No_of_Reviews desc
```

	
***Q.3*** : **What is the most expensive neighborhood in Barcelona ?**


```PLpgSQL
  select neighbourhood_cleansed  , avg(price) as avarge_listing_prices_in_this_neighbourhood
	from public."Listing_Dim"
	group by neighbourhood_cleansed
	order by avarge_listing_prices_in_this_neighbourhood desc
```

***Q.4 : Recommend me a listing if I am***

- A man with his wife and 2 children looking for a week vacation around March 2024.
 
```PLpgSQL
  with CTE as (
		select "listingKey" ,full_date as available_date ,exact_price as exact_price_for_booking_this_date
		From public."Reservation_Fact" as RF
		inner join public."Date_Dim" as DD
		on DD.date_key=RF.date_key
		where available=true and minimum_nights>=7 and month_name='March' 
		)
	select  listing_id,available_date, exact_price_for_booking_this_date ,name,neighborhood_overview, picture_url, host_id, host_url, host_name, host_since, host_location, host_about, host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost, host_picture_url, host_neighbourhood, host_listings_count, host_total_listings_count, host_verifications, host_identity_verified, neighbourhood_cleansed, neighbourhood_group_cleansed, latitude, longitude, property_type, room_type, number_of_reviews, number_of_reviews_ltm, number_of_reviews_l30d, first_review, last_review, review_scores_rating, review_scores_accuracy, review_scores_cleanliness, review_scores_checkin, review_scores_communication, review_scores_location, review_scores_value, license, instant_bookable, reviews_per_month
	from public."Listing_Dim" as LD
	inner join CTE 
	on LD."listingKey" =CTE."listingKey"
	where accommodates=4
```

- A colleage student with 4 other students who don't have alot of money and want to spend the new year's eve in Barcelona with perhaps two days before and/or two days after
```PLpgSQL
with CTE as (
		select "listingKey" ,full_date as available_date ,exact_price as exact_price_for_booking_this_date
		From public."Reservation_Fact" as RF
		inner join public."Date_Dim" as DD
		on DD.date_key=RF.date_key
		where available=true and minimum_nights>=3 
		and full_date BETWEEN '2023-12-30' AND '2024-01-01'
		)
	select listing_id,available_date, exact_price_for_booking_this_date ,name,neighborhood_overview, picture_url, host_id, host_url, host_name, host_since, host_location, host_about, host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost, host_picture_url, host_neighbourhood, host_listings_count, host_total_listings_count, host_verifications, host_identity_verified, neighbourhood_cleansed, neighbourhood_group_cleansed, latitude, longitude, property_type, room_type, number_of_reviews, number_of_reviews_ltm, number_of_reviews_l30d, first_review, last_review, review_scores_rating, review_scores_accuracy, review_scores_cleanliness, review_scores_checkin, review_scores_communication, review_scores_location, review_scores_value, license, instant_bookable, reviews_per_month
	from public."Listing_Dim" as LD
	inner join CTE 
	on LD."listingKey" =CTE."listingKey"
	where accommodates=5 
	order by exact_price_for_booking_this_date asc
```
