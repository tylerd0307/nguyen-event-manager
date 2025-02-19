-- Project Group 50
-- Tyler Nguyen
-- Nicholas Nguyen

-- The colon (:) character denotes variables that will be populated from the backend programming language.

--------------------------------
-- EVENTS TABLE
--------------------------------

-- SELECT: Retrieve all events
SELECT eventID, eventName, eventDate, venueID, organizerID, description, requiresPayment, maxAttendees 
FROM Events;

-- SELECT: Retrieve a single event by its ID
SELECT eventID, eventName, eventDate, venueID, organizerID, description, requiresPayment, maxAttendees 
FROM Events 
WHERE eventID = :eventIDInput;

-- INSERT: Create a new event
INSERT INTO Events (eventName, eventDate, venueID, organizerID, description, requiresPayment, maxAttendees) 
VALUES (:eventNameInput, :eventDateInput, :venueIDInput, :organizerIDInput, :descriptionInput, :requiresPaymentInput, :maxAttendeesInput);

-- UPDATE: Modify an existing event
UPDATE Events 
SET eventName = :eventNameInput, 
    eventDate = :eventDateInput, 
    venueID = :venueIDInput, 
    organizerID = :organizerIDInput, 
    description = :descriptionInput, 
    requiresPayment = :requiresPaymentInput, 
    maxAttendees = :maxAttendeesInput 
WHERE eventID = :eventIDInput;

-- DELETE: Remove an event by its ID
DELETE FROM Events WHERE eventID = :eventIDInput;


--------------------------------
-- ATTENDEES TABLE
--------------------------------

-- SELECT: Retrieve all attendees
SELECT attendeeID, firstName, lastName, email, phoneNumber FROM Attendees;

-- INSERT: Add a new attendee
INSERT INTO Attendees (firstName, lastName, email, phoneNumber) 
VALUES (:firstNameInput, :lastNameInput, :emailInput, :phoneNumberInput);

-- UPDATE: Modify an attendee’s details
UPDATE Attendees 
SET firstName = :firstNameInput, 
    lastName = :lastNameInput, 
    email = :emailInput, 
    phoneNumber = :phoneNumberInput 
WHERE attendeeID = :attendeeIDInput;

-- DELETE: Remove an attendee
DELETE FROM Attendees WHERE attendeeID = :attendeeIDInput;


--------------------------------
-- VENUES TABLE
--------------------------------

-- SELECT: Retrieve all venues
SELECT venueID, venueName, address, capacity, contactNumber FROM Venues;

-- INSERT: Add a new venue
INSERT INTO Venues (venueName, address, capacity, contactNumber) 
VALUES (:venueNameInput, :addressInput, :capacityInput, :contactNumberInput);

-- UPDATE: Modify venue details
UPDATE Venues 
SET venueName = :venueNameInput, 
    address = :addressInput, 
    capacity = :capacityInput, 
    contactNumber = :contactNumberInput 
WHERE venueID = :venueIDInput;

-- DELETE: Remove a venue
DELETE FROM Venues WHERE venueID = :venueIDInput;


--------------------------------
-- ORGANIZERS TABLE
--------------------------------

-- SELECT: Retrieve all organizers
SELECT organizerID, organizerName, email, phoneNumber FROM Organizers;

-- INSERT: Add a new organizer
INSERT INTO Organizers (organizerName, email, phoneNumber) 
VALUES (:organizerNameInput, :emailInput, :phoneNumberInput);

-- UPDATE: Modify organizer details
UPDATE Organizers 
SET organizerName = :organizerNameInput, 
    email = :emailInput, 
    phoneNumber = :phoneNumberInput 
WHERE organizerID = :organizerIDInput;

-- DELETE: Remove an organizer
DELETE FROM Organizers WHERE organizerID = :organizerIDInput;


--------------------------------
-- PAYMENTS TABLE
--------------------------------

-- SELECT: Retrieve all payments
SELECT paymentID, eventID, attendeeID, paymentDate, paymentStatus FROM Payments;

-- INSERT: Record a new payment
INSERT INTO Payments (eventID, attendeeID, paymentDate, paymentStatus) 
VALUES (:eventIDInput, :attendeeIDInput, :paymentDateInput, :paymentStatusInput);

-- UPDATE: Modify an existing payment record
UPDATE Payments 
SET eventID = :eventIDInput, 
    attendeeID = :attendeeIDInput, 
    paymentDate = :paymentDateInput, 
    paymentStatus = :paymentStatusInput 
WHERE paymentID = :paymentIDInput;

-- DELETE: Remove a payment record
DELETE FROM Payments WHERE paymentID = :paymentIDInput;


--------------------------------
-- ATTENDEES_EVENTS TABLE (Many-to-Many Relationship)
--------------------------------

-- SELECT: Retrieve all attendee-event registrations
SELECT registrationID, eventID, attendeeID, registrationStatus FROM Attendees_Events;

-- SELECT: Retrieve all attendees for a specific event
SELECT registrationID, attendeeID, registrationStatus 
FROM Attendees_Events 
WHERE eventID = :eventIDInput;

-- SELECT: Retrieve all events an attendee is registered for
SELECT registrationID, eventID, registrationStatus 
FROM Attendees_Events 
WHERE attendeeID = :attendeeIDInput;

-- INSERT: Register an attendee for an event
INSERT INTO Attendees_Events (eventID, attendeeID, registrationStatus) 
VALUES (:eventIDInput, :attendeeIDInput, :registrationStatusInput);

-- UPDATE: Change an attendee’s registration status
UPDATE Attendees_Events 
SET registrationStatus = :registrationStatusInput 
WHERE eventID = :eventIDInput AND attendeeID = :attendeeIDInput;

-- DELETE: Remove an attendee from an event
DELETE FROM Attendees_Events 
WHERE eventID = :eventIDInput AND attendeeID = :attendeeIDInput;
