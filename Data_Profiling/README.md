- Data profiling is about examining and understanding the structure and content of the data. This helps in identifying patterns, anomalies, and inconsistencies within the data, which are crucial for data quality, data cleansing, and further modeling steps.

- There are four CSV files containing all about needed Airbnb Barcelona quarterly data for the last 12 months :

  - ***(1) listings.csv***
    - `Id`: A unique identifier for each listing.
    - `listing_url`: The URL of the listing on Airbnb's website.
    - `scrape_id`: Identifier for the scraping operation.
    - `last_scraped`: Date when the listing was last scraped.
    - `source` :  refers to the origin or method by which the listing data was obtained or collected. It indicates where the data comes from or how it was sourced, which could be from various channels or systems
    - `Name`: It includes a description of the listing, like how many beds, baths ...etc in it. 
    - `Description`: Description of the listing. All description values in the file are empty, so we wouldn't consider it 
    - `neighborhood_overview`: The host writes an Overview of the neighborhood where the listing is located from the point of view, showing its neighborhood advantages.
    - `picture_url`: URL of the picture associated with the listing.
  
      > Related host data:
    
    - `host_id`: A unique identifier for the host of the listing.
    - `host_url`: The URL of the host's profile on Airbnb's website.
    - `host_name`: The name of the host.
    - `host_since`: Date when the host joined Airbnb.
    - `host_location`: Location of the host. which may differ from the listing location belongs to the host 
    - `host_about`: Each host writes a description to express himself to the guests.
    - `host_response_time`: Response time of the host to inquiries.
    - `host_response_rate`: Response rate of the host to inquiries.
    - `host_acceptance_rate`: Acceptance rate of the host for booking requests.
    - `host_is_superhost`:  indicates whether a host is recognized as a "superhost" on the Airbnb platform. A superhost is a distinguished status granted by Airbnb to hosts who meet specific criteria and demonstrate exceptional hospitality to their guests.
    - `host_thumbnail_url`: URL of the host's thumbnail picture.
    - `host_picture_url`: URL of the host's profile picture.
      
       >host_thumbnail_url typically refers to a smaller-sized thumbnail image, while host_picture_url refers to the full-sized picture of the host. These attributes serve different display purposes depending on where they are used in the Airbnb platform or other applications that utilize the listing data.
    
    - `host_neighbourhood`: Neighborhood where the host is located.
    - `host_listings_count`:refers to the current number of active listings
    - `host_total_listings_count`:  represent the total count of listings, including both active and inactive listings, since the host's account was created. 
    - `host_verifications`: List of verifications for the host.
    - `host_has_profile_pic`: Indicator if the host has a profile picture.
    - `host_identity_verified`: Indicator if the host's identity is verified.
    - `neighbourhood`: Specific neighborhood where the listing is located.
    - `neighbourhood_cleansed`: Specific neighborhood cleaned version.
    - `neighbourhood_group_cleansed`: Larger administrative area cleaned version.
    - `latitude`: Latitude coordinate of the listing's location.
    - `longitude`: Longitude coordinate of the listing's location.
    - `property_type`: Type of property (e.g., house, apartment).
    - `room_type`: Type of room (e.g., entire home/apartment, private room).
    - `accommodates`: Number of guests the listing can accommodate.
    - `bathrooms`: Number of bathrooms in the listing.
    - `bathrooms_text`: Description of the bathrooms.
    - `bedrooms`: Number of bedrooms in the listing.
    - `beds`: Number of beds in the listing.
    - `amenities`: contain the same value in all columns '[]', will be considered in the cleansing step
    - `price`: Price per night for the listing. 
    - `minimum_nights`: Minimum number of nights required for booking. 
    - `maximum_nights`: Maximum number of nights allowed for booking.
    - `minimum_minimum_nights`: Minimum number of minimum nights required for booking.
    - `maximum_minimum_nights`: Maximum number of minimum nights required for booking.
    - `minimum_maximum_nights`: Minimum number of maximum nights allowed for booking.
    - `maximum_maximum_nights`: Maximum number of maximum nights allowed for booking.
    - `minimum_nights_avg_ntm`: Minimum average number of nights allowed for booking in the next 30 days.
    - `maximum_nights_avg_ntm`: Maximum average number of nights allowed for booking in the next 30 days.
    - `calendar_updated`: Date when the calendar was last updated.
    - `has_availability`: Indicator if the listing has availability.
    - `availability_30`: Represents the number of available nights for booking in the next 30 days from the current date.
    It provides a short-term outlook on the availability of the listing for the upcoming month.
    - `availability_60`: Number of available nights in the next 60 days. 
    - `availability_90`: Number of available nights in the next 90 days.provides availability information for the upcoming three months from the current date.
    - `availability_365`: Number of available nights in the next 365 days. offers a longer-term view of the availability of the listing for the upcoming year.
    - `calendar_last_scraped`: Date when the calendar was last scraped.
    - `number_of_reviews`:  This attribute represents the total number of reviews a listing has received over its lifetime on the platform.
    - `number_of_reviews_ltm`: This attribute represents the number of reviews a listing has received in the last twelve months
    - `number_of_reviews_l30d`: This attribute represents the number of reviews a listing has received in the last 30 days.
    - `first_review`: This attribute indicates the date when the first review for a listing was posted.
    - `last_review`: This attribute indicates the date when the most recent review for a listing was posted.
    - `review_scores_rating`: This attribute represents the overall rating score given by guests for a listing. It typically reflects the average of all review scores.
    - `review_scores_accuracy`: This attribute represents the rating score given by guests for the accuracy of the listing description and amenities.
    - `review_scores_cleanliness`: This attribute represents the rating score given by guests for the cleanliness of the listing.
    - `review_scores_checkin`: This attribute represents the rating score given by guests for the check-in process and host communication prior to arrival.
    - `review_scores_communication`: This attribute represents the rating score given by guests for the host's communication during their stay.
    - `review_scores_location`: This attribute represents the rating score given by guests for the location of the listing.
    - `review_scores_value`: This attribute represents the rating score given by guests for the value they perceived in relation to the listing's price.
    - `license`: License or permit information related to the listing. 
    - `instant_bookable` : Indicator if the listing is available for instant booking without prior approval from the host.
    - `calculated_host_listings_count`: Total number of listings managed by the host, regardless of room type.
    - `calculated_host_listings_count_entire_homes`: Number of entire homes or apartments managed by the host.
    - `calculated_host_listings_count_private_rooms`: Number of private rooms managed by the host.
    - `calculated_host_listings_count_shared_rooms`: Number of shared rooms managed by the host.
    - `reviews_per_month`: Average number of reviews per month for the listing.
    
  - ***(2) Calender.csv***
  
      In the context of Airbnb's data, the attributes in the listing file and the calendar file are related as they provide information about listings and their availability, pricing, and booking policies. However, there are some differences in the specific attributes between the two files. Let's examine the relationship between these attributes in both files:
    
      - `Price`:
       
        - Listing File: Represents the base price per night for a listing.
        - Calendar File: Represents the price or adjusted price for a specific date, which may include variations due to factors like seasonality, demand, and special events.
    
      - `Has Availability / Available`:
    
        - Listing File: The has_availability attribute in the listing file may indicate whether the listing has availability in general, but it doesn't provide specific availability details for each date.
        - Calendar File: The available attribute in the calendar file indicates whether a listing is available for booking on a specific date.
      
      - `Minimum/Maximum Nights`:
    
          - Listing File: Specifies the minimum/Maximum number of nights required for a booking.
          -  Calendar File: Indicates the minimum/Maximum number of nights required for a booking on a specific date.
       
  - ***(3) Reviews.csv***
    
    - The attributes in the reviews file include attributes such as `listing_id`, `reviewer_id`, `reviewer_name`, `date`, `comments`
    - reviews-related columns in the listing file provide summary statistics and aggregated scores based on reviews received by the listing, the reviews file contains detailed information about individual reviews, offering insights into the specific feedback provided by guests for each listing.
   
  - ***(4) Neighborhoods.csv***
    
    -  The columns in the neighborhood file include two attributes `neighborhood` and it's belonging `neighbourhood_group`.
    -  The attributes `neighbourhood_cleansed` and `neighbourhood_group_cleansed` in the listing file refer to this data in the Noughbourhoods file .
