-- Queries for managing Events
-- Get all events
SELECT eventID, eventName, eventDate, venueID, organizerID, description, requiresPayment, maxAttendees FROM Events;

-- Get a single event's details
SELECT eventID, eventName, eventDate, venueID, organizerID, description, requiresPayment, maxAttendees FROM Events WHERE eventID = :eventID;

-- Add a new event
INSERT INTO Events (eventName, eventDate, venueID, organizerID, description, requiresPayment, maxAttendees) 
VALUES (:eventName, :eventDate, :venueID, :organizerID, :description, :requiresPayment, :maxAttendees);

-- Update an existing event
UPDATE Events 
SET eventName = :eventName, eventDate = :eventDate, venueID = :venueID, organizerID = :organizerID, description = :description, requiresPayment = :requiresPayment, maxAttendees = :maxAttendees 
WHERE eventID = :eventID;

-- Delete an event
DELETE FROM Events WHERE eventID = :eventID;

-- Queries for managing Attendees
-- Get all attendees
SELECT attendeeID, firstName, lastName, email, phoneNumber FROM Attendees;

-- Add a new attendee
INSERT INTO Attendees (firstName, lastName, email, phoneNumber) 
VALUES (:firstName, :lastName, :email, :phoneNumber);

-- Update an attendee's details
UPDATE Attendees 
SET firstName = :firstName, lastName = :lastName, email = :email, phoneNumber = :phoneNumber 
WHERE attendeeID = :attendeeID;

-- Delete an attendee
DELETE FROM Attendees WHERE attendeeID = :attendeeID;

-- Queries for managing Venues
-- Get all venues
SELECT venueID, venueName, address, capacity, contactNumber FROM Venues;

-- Add a new venue
INSERT INTO Venues (venueName, address, capacity, contactNumber) 
VALUES (:venueName, :address, :capacity, :contactNumber);

-- Update a venue
UPDATE Venues 
SET venueName = :venueName, address = :address, capacity = :capacity, contactNumber = :contactNumber 
WHERE venueID = :venueID;

-- Delete a venue
DELETE FROM Venues WHERE venueID = :venueID;

-- Queries for managing Organizers
-- Get all organizers
SELECT organizerID, organizerName, email, phoneNumber FROM Organizers;

-- Add a new organizer
INSERT INTO Organizers (organizerName, email, phoneNumber) 
VALUES (:organizerName, :email, :phoneNumber);

-- Update an organizer
UPDATE Organizers 
SET organizerName = :organizerName, email = :email, phoneNumber = :phoneNumber 
WHERE organizerID = :organizerID;

-- Delete an organizer
DELETE FROM Organizers WHERE organizerID = :organizerID;

-- Queries for managing Payments
-- Get all payments
SELECT paymentID, eventID, attendeeID, paymentDate, paymentStatus FROM Payments;

-- Add a new payment
INSERT INTO Payments (eventID, attendeeID, paymentDate, paymentStatus) 
VALUES (:eventID, :attendeeID, :paymentDate, :paymentStatus);

-- Update a payment
UPDATE Payments 
SET eventID = :eventID, attendeeID = :attendeeID, paymentDate = :paymentDate, paymentStatus = :paymentStatus 
WHERE paymentID = :paymentID;

-- Delete a payment
DELETE FROM Payments WHERE paymentID = :paymentID;
