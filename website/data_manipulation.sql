-- Project Group 50
-- Tyler Nguyen
-- Nicholas Nguyen

-- : (colon) character denotes the variables that will have data from the backend programming language.

-----------------
-- Events Table
-----------------

-- SELECT: Retrieve all events
-- This query fetches all event details, including associated venue and organizer IDs.
SELECT eventID, eventName, eventDate, venueID, organizerID, description, requiresPayment, maxAttendees 
FROM Events;

-- SELECT: Retrieve a single event
-- Fetch details of a specific event using its unique eventID.
SELECT eventID, eventName, eventDate, venueID, organizerID, description, requiresPayment, maxAttendees 
FROM Events 
WHERE eventID = :eventID;

-- INSERT: Create a new event
-- Adds a new event to the database with the provided details.
INSERT INTO Events (eventName, eventDate, venueID, organizerID, description, requiresPayment, maxAttendees) 
VALUES (:eventName, :eventDate, :venueID, :organizerID, :description, :requiresPayment, :maxAttendees);

-- UPDATE: Update an existing event
-- Modifies details of an existing event based on its eventID.
UPDATE Events 
SET eventName = :eventName, 
    eventDate = :eventDate, 
    venueID = :venueID, 
    organizerID = :organizerID, 
    description = :description, 
    requiresPayment = :requiresPayment, 
    maxAttendees = :maxAttendees 
WHERE eventID = :eventID;

-- DELETE: Delete an event
-- Removes an event from the database using its eventID.
DELETE FROM Events WHERE eventID = :eventID;


-------------------
-- Attendees Table
-------------------

-- SELECT: Retrieve all attendees
-- Fetches a list of all attendees along with their contact details.
SELECT attendeeID, firstName, lastName, email, phoneNumber FROM Attendees;

-- INSERT: Create a new attendee
-- Adds a new attendee to the database with provided personal details.
INSERT INTO Attendees (firstName, lastName, email, phoneNumber) 
VALUES (:firstName, :lastName, :email, :phoneNumber);

-- UPDATE: Update an attendee's details
-- Modifies an attendee’s information using their attendeeID.
UPDATE Attendees 
SET firstName = :firstName, 
    lastName = :lastName, 
    email = :email, 
    phoneNumber = :phoneNumber 
WHERE attendeeID = :attendeeID;

-- DELETE: Delete an attendee
-- Removes an attendee from the database using their attendeeID.
DELETE FROM Attendees WHERE attendeeID = :attendeeID;


-----------------
-- Venues Table
-----------------

-- SELECT: Retrieve all venues
-- Fetches all venue details, including capacity and contact information.
SELECT venueID, venueName, address, capacity, contactNumber FROM Venues;

-- INSERT: Create a new venue
-- Adds a new venue to the database with specified attributes.
INSERT INTO Venues (venueName, address, capacity, contactNumber) 
VALUES (:venueName, :address, :capacity, :contactNumber);

-- UPDATE: Update a venue
-- Modifies venue details using its venueID.
UPDATE Venues 
SET venueName = :venueName, 
    address = :address, 
    capacity = :capacity, 
    contactNumber = :contactNumber 
WHERE venueID = :venueID;

-- DELETE: Delete a venue
-- Removes a venue from the database using its venueID.
DELETE FROM Venues WHERE venueID = :venueID;


--------------------
-- Organizers Table
--------------------

-- SELECT: Retrieve all organizers
-- Fetches all organizers' details, including contact information.
SELECT organizerID, organizerName, email, phoneNumber FROM Organizers;

-- INSERT: Create a new organizer
-- Adds a new organizer to the database.
INSERT INTO Organizers (organizerName, email, phoneNumber) 
VALUES (:organizerName, :email, :phoneNumber);

-- UPDATE: Update an organizer
-- Modifies an organizer’s details using their organizerID.
UPDATE Organizers 
SET organizerName = :organizerName, 
    email = :email, 
    phoneNumber = :phoneNumber 
WHERE organizerID = :organizerID;

-- DELETE: Delete an organizer
-- Removes an organizer from the database using their organizerID.
DELETE FROM Organizers WHERE organizerID = :organizerID;


-------------------
-- Payments Table
-------------------

-- SELECT: Retrieve all payments
-- Fetches all payment records, linking attendees with events.
SELECT paymentID, eventID, attendeeID, paymentDate, paymentStatus FROM Payments;

-- INSERT: Create a new payment
-- Adds a new payment record associated with an event and an attendee.
INSERT INTO Payments (eventID, attendeeID, paymentDate, paymentStatus) 
VALUES (:eventID, :attendeeID, :paymentDate, :paymentStatus);

-- UPDATE: Update a payment
-- Modifies an existing payment record.
UPDATE Payments 
SET eventID = :eventID, 
    attendeeID = :attendeeID, 
    paymentDate = :paymentDate, 
    paymentStatus = :paymentStatus 
WHERE paymentID = :paymentID;

-- DELETE: Delete a payment
-- Removes a payment record using its paymentID.
DELETE FROM Payments WHERE paymentID = :paymentID;


------------------------------
-- Attendees_Events Table
------------------------------

-- INSERT: Register an attendee for an event
-- Adds a new entry linking an attendee to an event with their registration status.
INSERT INTO Attendees_Events (eventID, attendeeID, registrationStatus) 
VALUES (:eventID, :attendeeID, :registrationStatus);

-- SELECT: Retrieve all registrations
-- Fetches all attendee-event relationships.
SELECT * FROM Attendees_Events;

-- SELECT: Retrieve a specific registration
-- Fetches the registration record of a specific attendee for a specific event.
SELECT * FROM Attendees_Events 
WHERE eventID = :eventID AND attendeeID = :attendeeID;

-- UPDATE: Update an attendee's registration status
-- Modifies an attendee's registration status for an event.
UPDATE Attendees_Events 
SET registrationStatus = :registrationStatus 
WHERE eventID = :eventID AND attendeeID = :attendeeID;

-- DELETE: Remove an attendee from an event
-- Removes an attendee’s registration from an event.
DELETE FROM Attendees_Events 
WHERE eventID = :eventID AND attendeeID = :attendeeID;
