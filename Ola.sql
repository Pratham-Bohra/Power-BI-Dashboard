create database Ola;
use ola;

#1. Retrieve all successful bookings:
create view Successful_Bookigs as
select* from bookings 
where Booking_Status = 'Success';

select * from Successful_Bookigs;

#2. Find the average ride distance for each vehicle type:
create view avg_distance_for_each_vehicle as
select Vehicle_Type,avg(Ride_Distance) from bookings
group by Vehicle_Type;

select * from avg_distance_for_each_vehicle; 

#3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as
select count(Canceled_Rides_by_Customer) from bookings
where Canceled_Rides_by_Customer != 'null';

select * from cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select Customer_ID, count(Customer_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides
desc limit 5;

select * from top_5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select Canceled_Rides_by_Driver, count(Canceled_Rides_by_Driver) as number_of
from bookings
group by Canceled_Rides_by_Driver
order by number_of
desc limit 1;


##6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max(Driver_Ratings), min(Driver_Ratings) from bookings
where Vehicle_Type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
select * from bookings 
where Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type:
select Vehicle_Type, avg(Customer_Rating) from bookings
group by Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
select sum(Booking_Value) from bookings 
where Booking_Status = 'Success';

#10. List all incomplete rides along with the reason:
select Booking_ID, Incomplete_Rides_Reason from bookings
where Incomplete_Rides = 'Yes' ;
