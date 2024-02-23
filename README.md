# AirBnB-Data-Engineering-Project
## Overview
- This project offers an end-to-end data pipeline. It begins with importing CSV data into PostgreSQL as a **staging area**. Next, **Python** is used to extract data from the staging area, followed by transformation using the Pandas library. The transformed data is loaded back into a **designed data warehouse** on **PostgreSQL**. Finally, actionable business insights are derived from the loaded data.
  
- The data engineering pipeline of the project:

![Screenshot 2024-02-22 070320](https://github.com/Arwa0/AirBnB-Data-Engineering-Project/assets/74055031/73b4422f-5faa-4ee4-895f-21beecf04926)

## Source system 
- Airbnb is an American company operating an online marketplace for short- and long-term homestays and experiences. The company acts as a broker and charges a commission from each booking.
- The data of Airbnb typically includes information related to listings, bookings, reviews, host profiles, guest profiles, pricing, availability calendars, and various other transactional and operational data associated with the Airbnb platform.This data helps Airbnb manage its marketplace, facilitate transactions between hosts and guests, improve user experience, and make data-driven decisions to enhance its services.
- For detailed data profiling :
[Click here](https://github.com/Arwa0/AirBnB-Data-Engineering-Project/tree/main/Data_Profiling)

## Staging Area
- The staging area involves extracting data from CSV files and loading it into a PostgreSQL database. During this process, careful consideration is given to data types for memory optimization.
- Attached is a photo showing the relations between tables:
  ![Staging Layer ](https://github.com/Arwa0/AirBnB-Data-Engineering-Project/assets/74055031/8ab8cb13-9be9-4c53-a77d-dda8aad90d4b)

## Designing The Data Warehouse
- appling **Dimensional modeling** to design a **galaxy-schema** model depending on our business processes
- ***Dimensional Modeling steps*** :
  - **(1) The business process** revolves around leveraging the data warehouse to gain insights and make informed decisions related to the asked business questions ,Most fact tables focus on the results of a single business process
  - **(2) Identifying Granularity**:
      - Fact Tables: Data stored at the daily level, with each row representing a specific listing on a specific date.
      - Dimension Tables: Aggregate or summarize data at varying levels of granularity, based on specific dimensions and metrics included in each table. For example, summarizing key metrics such as price, number of reviews, and availability at the listing level.
  - **(3) Identifying Dimensions**:
    - `Listing Dimension`: Includes all attributes related to listings such as ID, name, description, host details, location, property type, room type, and amenities.
    - `Date Dimension`: Represents date-related attributes such as date, month, year, and day of the week for analyzing trends and patterns over time.
  - **(4) Identifying Facts**:
    - `Reservations Fact`: Contains data related to listing availability, price, and minimum/maximum nights for each listing on specific dates.
    - `Reviews Fact`: Stores data related to reviews for each listing, including review ID, date, reviewer details, and comments.
 - [See the Data Warehouse Design here]([docs/CONTRIBUTING.md](https://github.com/Arwa0/AirBnB-Data-Engineering-Project/tree/main/Data%20Warehouse%20Design#readme))

## ETL process:
This process done using python script , illustated in [this]([docs/CONTRIBUTING.md](https://github.com/Arwa0/AirBnB-Data-Engineering-Project/blob/main/ETL%20using%20python%20script.ipynb)https://github.com/Arwa0/AirBnB-Data-Engineering-Project/blob/main/ETL%20using%20python%20script.ipynb) jupyter notebook file
 
      


  

  

  



