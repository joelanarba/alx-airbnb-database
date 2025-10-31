# Airbnb Database ERD

## Overview
This ERD represents the database structure for an Airbnb-like system, capturing users, properties, bookings, payments, reviews, and messages.

## Entities
- User
- Property
- Booking
- Payment
- Review
- Message

## Relationships
- One User (host) can have many Properties.
- One Property can have many Bookings.
- One Booking has one Payment.
- One User (guest) can make many Bookings.
- One Property can have many Reviews.
- One User can write many Reviews.
- Users can send and receive many Messages.

## Tools
Designed using Draw.io
File: `airbnb_erd.png`
