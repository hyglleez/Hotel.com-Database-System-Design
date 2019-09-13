# Hotel.com-Database-System-Design
Database Design Final Project
Hotels.com Database Design

CS 6360. 002
Team 33


Yiqun Dong (yxd180000)
Fangkai Ma (fxm180002)
Yijia Zhang (yxz180054) 
Requirement

Hotels.com is an online hotel reservation network platform for users to reserve hotels from all over the world with competitive price effortlessly. Hotels.com mainly focus on providing faster booking hotel experiences and establishing loyalty with its users. The database of hotels.com would include the following functions and features. 

1.	A customer can create their own account on hotels.com with their personal information in details, such as full name, phone number, address, email address. There is no limitation on the amount of account each customer can create on the website. However, only one customer is allowed for one account.
2.	Every account is linked with its own reward program, which implements numbers of free night offered by hotels.com. Two seperate account can not share a single reward program even if the users are the same person.
3.	Customers use their accounts to make reservations on the website. Each reversevation can be created only by one account. A successful reservation records the account id, price of the reservation, hotel id, coupon entered by the customers if applied, reservation date, hotel name and reservation number.
4.	Each successful reservation generates one bill for customers indicating their reservation id, bill price, payment information and bill date. The bill id is an exclusive id for hotels.com records. The bill price should be exactly the same as the price in the reservation.
5.	One reservation can be accepted by only one hotel on the record. In the contrast, every hotel can accept as many reservation as they can. Hotel location, name, type, neighborhood situation, features, number of rooms and hotel id are listed below hotel entity.
6.	Each hotel has some certain amount of rooms with different room number, size, price, view, id. There is also a if_empty attribute indicates whether the room is occupied.
7.	Some hotel would provide deals and coupons for hotels.com. Each deal has its own id and policy recorded. A deal can be applied to one hotel or across certain amount of hotels in the area.
8.	Hotels.com created their own score rating system, which consist of reviews, tripadvisor rating and hotel.com rating submitted by previous customers lived in the hotel. 
9.	The score rating is giving to hotels cooperated with hotels.com. All reviews and rating are entirely visible to the hotels and customers. Every single score rating is delivered to only one hotel, but each hotel can receive many reviews and ratings. 
Entity-Relation Diagram


![](https://github.com/hyglleez/image/blob/master/ds1.jpg?raw=true)
 


One-to-one binary relationships: Link, Generate
One-to-many binary relationships: Own, Given, Has, Create
Many-to-many binary relationships: Submit, Promote 
Mapping of ERD in Relational Schema

1. Customer

Customer_id	Email	Lname	Fname	Phone	C_Address

Primary Key: Customer_id
Foreign Keys: None

2. H_Account

NumReservation	Customer_id	Account_id	Reward_id

Primary Key: Account_id
Foreign Keys: FOREIGN KEY (Customer_id) REFERENCES Customer (Customer_id)

3. Reward_Program

No_of_Free_Night	Reward_id	Account_id

Primary Key: Reward_id
Foreign Keys:  FOREIGN KEY (Account_id) REFERENCES H_Account (Account_id)

4. Reservation

Account_id	Price	Hotel_id	Reservation#	Hotel_Name	Date	Coupon_id


Primary Key: Reservation#
Foreign Keys: FOREIGN KEY (Account_id) REFERENCES H_Account (Account_id),
		FOREIGN KEY (Hotel_id) REFERENCES Hotel (Hotel_id)

5. Bill

Bill_id	Price	Payment_info	Bill_Date	Reservation#

Primary Key: Bill_id
Foreign Keys: FOREIGN KEY (Reservation#) REFERENCES Reservation (Reservation#)

6. Score_Rating

Review	TripAdvisorRating	HotelscomRating	Hotel_id

Primary Key: HotelscomRating
Foreign Keys: FOREIGN KEY (Hotel_id) REFERENCES Hotel (Hotel_id)

7. Hotel

Hotel_Name	Hotel_Location	Hotel_id	Type	Neighborhood	Feature	NumRooms

Primary Key: Hotel_id
Foreign Keys: None

8. Deal

Deal_id	Policy

Primary Key: Deal_id
Foreign Keys: None

9. Room

Room#	R_Size	Price	Room_View	Hotel_id	If_Empty

Primary Key: Room#
Foreign Keys: FOREIGN KEY (Hotel_id) REFERENCES Hotel (Hotel_id)

10. Promote

Hotel_id	Deal_id

Primary Key: Hotel_id, Deal_id
Foreign Keys: FOREIGN KEY (Hotel_id) REFERENCES Hotel (Hotel_id),
		FOREIGN KEY (Deal_id) REFERENCES Deal (Deal_id)

11. Submit

Customer_id	HotelscomRating

Primary Key: Customer_id, HotelscomRating
Foreign Keys: FOREIGN KEY (Customer_id) REFERENCES Customer (Customer_id),
FOREIGN KEY (HotelscomRating) REFERENCES Score_Rating 	(HotelscomRating)


Create Queries
 
Triggers & Stored Procedures
    
![](https://github.com/hyglleez/image/blob/master/ds2.png?raw=true)

![](https://github.com/hyglleez/image/blob/master/ds3.png?raw=true)

![](https://github.com/hyglleez/image/blob/master/ds4.png?raw=true)

![](https://github.com/hyglleez/image/blob/master/ds5.png?raw=true)