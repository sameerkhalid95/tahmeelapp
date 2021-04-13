# README

## Problem 
Request from the client would be as follow: We would like to gather orders for transporting of goods to the recipients. The orders that are going to be placed until 12 AM UTC time will be sent to the recipients the same day. The ones that are going to be placed after 12 AM UTC will be scheduled for sending for the next day same time.
After some discussion with the team, your task is to implement the gathering of the orders in the said timeframes. Result of the gathered orders will be a bulk order. A bulk order will then be used to place an offer in the system for the drivers to pick up but this part is not within your scope.
Bulk order consists of a list of dropoff adresses, total weight of the packages that are in it, pickup address and a reference number.
Client places the order by giving dropoff address, pickup address and weight of the package.

## Solution 

To Explain my solution I first need to breakdown the above problem
there are two major parts in that above problem
1) Collecting the data in said timeframes
2) Generate the bulk orders for the drivers 

for the above problem I came up with two solution and implemented the
efficient solution of the both

Before I start explaining my solution I took two educated 
assumptions 
1) As it is mentioned in the Problem that any order placed Before 12AM UTC should be delivered on the same day and after 12 AM UTC it should be deliverd next day same time.
As we know that At 12 AM UTC the date changes so I have assumed that every order placed will be sent in 24 hours of oddering
2) As in the bulk order its mentioned that it will contain one pick up location so I am groping order acording to the pick-up location for bulk order.

### solution 1
first solution that I came up with was when customer creates an order we can create a bulk order and keep on adding the orders until 12 AM acording to the pick-up.
but the problem with this solution is cost whwn ever customer places the order
system will have to check if bulk order for the pick_up location is created or not so its not efferent

### Solution 2 (With Implementation)

In this solution I keep on collecting orders up until 12AM and keep a sending_time at the time of order placement by adding 24 hours to it 
so the the date is changed to the next day. so at 12 AM when date is changed I run a cron job which is scheduled
to run at 12 AM UTC daily and runs a task that create all the bulk order at the same time for different pick up locations 
by adding scheduler it saves the cost of checking the bulk order every time order is created. 


#### Implementation 

I have created two modals `order` and `bulk_order` bulk order `has_many` orders.
I have also created a rake task `gather_order` which is ran through a cron job using `whenever gem` to schedule, it is responsible to create bulk orders

## Setup

run `bundle install` to intall gems

run `npm instal` to install node dependencies

run `rails webpacker:install` to install webpack

run `rails db:setup` to create database

run `rails db:migrate` to run all the migrations

to start the server run `rails s` 

you can create and see oerders at `http://localhost:3000/orders`

and you can see bulk orders at `http://localhost:3000/bulk_orders`

##### to run the rake task manually because cron jobs don't work properly on local system run `rake gather:order`

you can see the cron job in `config/schedule.rb`
