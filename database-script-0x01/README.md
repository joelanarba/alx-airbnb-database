# Airbnb Database Schema (DDL)

## Overview
This schema defines the structure of the Airbnb-like database system. It includes tables for Users, Properties, Bookings, Payments, Reviews, and Messages.

## Entities
1. **User** – stores user details (guest, host, admin)
2. **Property** – stores property listings created by hosts
3. **Booking** – records property reservations made by guests
4. **Payment** – records transactions for bookings
5. **Review** – stores ratings and comments for properties
6. **Message** – handles communication between users

## Key Constraints
- **Primary Keys**: Each table has a UUID primary key.
- **Foreign Keys**:
  - Property.host_id → User.user_id  
  - Booking.property_id → Property.property_id  
  - Booking.user_id → User.user_id  
  - Payment.booking_id → Booking.booking_id  
  - Review.property_id → Property.property_id  
  - Review.user_id → User.user_id  
  - Message.sender_id → User.user_id  
  - Message.recipient_id → User.user_id
- **Check Constraints**:
  - `role` in ('guest', 'host', 'admin')
  - `status` in ('pending', 'confirmed', 'canceled')
  - `rating` between 1 and 5
  - `payment_method` in ('credit_card', 'paypal', 'stripe')
- **Indexes**: Added to improve performance for frequent lookups (e.g., email, property_id, booking_id).

## Execution
To create the schema:
```bash
psql -U <username> -d <database_name> -f schema.sql
