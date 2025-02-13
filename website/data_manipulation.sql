-- Project Group 50
-- Tyler Nguyen
-- Nicholas Nguyen

-- The colon (:) character denotes variables that will be populated from the backend programming language.

--------------------------------
-- EVENTS TABLE
--------------------------------

-- SELECT: Retrieve all events
-- Fetches all event details, including associated venue and organizer information.
SELECT eventID, eventName, eventDate, venueID, organizerID, description, requiresPayment, maxAttendees 
FROM Events;

-- SELECT: Retrieve a single event by its ID
SELECT eventID, eventName, eventDate, venueID, organizerID, description, requiresPayment, maxAttendees 
FROM Events 
WHERE eventID = :eventID;

-- INSERT: Create a new event
-- Adds a new event with details such as name, date, venue, organizer, description, and attendee limits.
INSERT INTO Events (eventName, eventDate, venueID, organizerID, description, requiresPayment, maxAttendees) 
VALUES (:eventName, :eventDate, :venueID, :organizerID, :description, :requiresPayment, :maxAttendees);

-- UPDATE: Modify an existing event
UPDATE Events 
SET eventName = :eventName, 
    eventDate = :eventDate, 
    venueID = :venueID, 
    organizerID = :organizerID, 
    description = :description, 
    requiresPayment = :requiresPayment, 
    maxAttendees = :maxAttendees 
WHERE eventID = :eventID;

-- DELETE: Remove an event by its ID
DELETE FROM Events WHERE eventID = :eventID;


--------------------------------
-- ATTENDEES TABLE
--------------------------------

-- SELECT: Retrieve all attendees
-- Fetches a list of all attendees along with their contact details.
SELECT attendeeID, firstName, lastName, email, phoneNumber FROM Attendees;

-- INSERT: Add a new attendee to the database
INSERT INTO Attendees (firstName, lastName, email, phoneNumber) 
VALUES (:firstName, :lastName, :email, :phoneNumber);

-- UPDATE: Modify an attendee’s details
UPDATE Attendees 
SET firstName = :firstName, 
    lastName = :lastName, 
    email = :email, 
    phoneNumber = :phoneNumber 
WHERE attendeeID = :attendeeID;

-- DELETE: Remove an attendee from the database
DELETE FROM Attendees WHERE attendeeID = :attendeeID;


--------------------------------
-- VENUES TABLE
--------------------------------

-- SELECT: Retrieve all venues
-- Fetches venue details such as location, capacity, and contact number.
SELECT venueID, venueName, address, capacity, contactNumber FROM Venues;

-- INSERT: Add a new venue to the database
INSERT INTO Venues (venueName, address, capacity, contactNumber) 
VALUES (:venueName, :address, :capacity, :contactNumber);

-- UPDATE: Modify venue details
UPDATE Venues 
SET venueName = :venueName, 
    address = :address, 
    capacity = :capacity, 
    contactNumber = :contactNumber 
WHERE venueID = :venueID;

-- DELETE: Remove a venue from the database
DELETE FROM Venues WHERE venueID = :venueID;


--------------------------------
-- ORGANIZERS TABLE
--------------------------------

-- SELECT: Retrieve all organizers
-- Fetches details of all event organizers, including their contact information.
SELECT organizerID, organizerName, email, phoneNumber FROM Organizers;

-- INSERT: Add a new organizer
INSERT INTO Organizers (organizerName, email, phoneNumber) 
VALUES (:organizerName, :email, :phoneNumber);

-- UPDATE: Modify organizer details
UPDATE Organizers 
SET organizerName = :organizerName, 
    email = :email, 
    phoneNumber = :phoneNumber 
WHERE organizerID = :organizerID;

-- DELETE: Remove an organizer from the database
DELETE FROM Organizers WHERE organizerID = :organizerID;


--------------------------------
-- PAYMENTS TABLE
--------------------------------

-- SELECT: Retrieve all payments
-- Fetches all payment records linking attendees to events.
SELECT paymentID, eventID, attendeeID, paymentDate, paymentStatus FROM Payments;

-- INSERT: Record a new payment
INSERT INTO Payments (eventID, attendeeID, paymentDate, paymentStatus) 
VALUES (:eventID, :attendeeID, :paymentDate, :paymentStatus);

-- UPDATE: Modify an existing payment record
UPDATE Payments 
SET eventID = :eventID, 
    attendeeID = :attendeeID, 
    paymentDate = :paymentDate, 
    paymentStatus = :paymentStatus 
WHERE paymentID = :paymentID;

-- DELETE: Remove a payment record
DELETE FROM Payments WHERE paymentID = :paymentID;


--------------------------------
-- ATTENDEES_EVENTS TABLE (Many-to-Many Relationship)
--------------------------------

-- SELECT: Retrieve all attendee-event registrations
-- Fetches a list of all attendees registered for events along with their registration status.
SELECT registrationID, eventID, attendeeID, registrationStatus FROM Attendees_Events;

-- SELECT: Retrieve all attendees for a specific event
-- Fetches all attendees who are registered for a particular event.
SELECT registrationID, attendeeID, registrationStatus 
FROM Attendees_Events 
WHERE eventID = :eventID;

-- SELECT: Retrieve all events an attendee is registered for
-- Fetches all events that a particular attendee has signed up for.
SELECT registrationID, eventID, registrationStatus 
FROM Attendees_Events 
WHERE attendeeID = :attendeeID;

-- INSERT: Register an attendee for an event
-- Adds a new entry linking an attendee to an event with their registration status.
INSERT INTO Attendees_Events (eventID, attendeeID, registrationStatus) 
VALUES (:eventID, :attendeeID, :registrationStatus);

-- UPDATE: Change an attendee’s registration status
-- Modifies the registration status of an attendee for a specific event.
UPDATE Attendees_Events 
SET registrationStatus = :registrationStatus 
WHERE eventID = :eventID AND attendeeID = :attendeeID;

-- DELETE: Remove an attendee from an event
-- Deletes an attendee's registration for an event, effectively unregistering them.
DELETE FROM Attendees_Events 
WHERE eventID = :eventID AND attendeeID = :attendeeID;
