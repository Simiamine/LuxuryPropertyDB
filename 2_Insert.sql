---------------------------------------------------------
-- SAMPLE DATA INSERTION (Updated)
---------------------------------------------------------

-- Insertion dans PropertyType
INSERT INTO PropertyType (ID, Type, Description) 
VALUES (1, 'Mansion', 'A luxurious large house with many amenities');
INSERT INTO PropertyType (ID, Type, Description) 
VALUES (2, 'Apartment', 'A unit in a residential building');
INSERT INTO PropertyType (ID, Type, Description) 
VALUES (3, 'Villa', 'A luxury countryside house');
INSERT INTO PropertyType (ID, Type, Description) 
VALUES (4, 'Penthouse', 'An exclusive apartment on the top floor');

-- Insertion dans Location
INSERT INTO Location (ID, City, Neighborhood) 
VALUES (1, 'Paris', 'Champs-Élysées');
INSERT INTO Location (ID, City, Neighborhood) 
VALUES (2, 'London', 'Chelsea');
INSERT INTO Location (ID, City, Neighborhood) 
VALUES (3, 'New York', 'Manhattan');
INSERT INTO Location (ID, City, Neighborhood) 
VALUES (4, 'Tokyo', 'Shibuya');

-- Insertion dans Owner
INSERT INTO Owner (ID, Name, ContactInfo)
VALUES (1, 'John Doe', 'john.doe@example.com');
INSERT INTO Owner (ID, Name, ContactInfo)
VALUES (2, 'Jane Smith', 'jane.smith@example.com');
INSERT INTO Owner (ID, Name, ContactInfo)
VALUES (3, 'Alice Johnson', 'alice.johnson@example.com');

-- Insertion dans Property
INSERT INTO Property (
    ID, Address, TypeID, Rooms, LivingArea, LotSize, Condition, Price, Status,
    AvailabilityDate, ExclusivityTier, LocationID, OwnerID
)
VALUES (
    1, '123 Luxury St', 1, 10, 450.5, 1200.3, 'Excellent', 
    15000000, 'Available', TO_DATE('2025-01-15','YYYY-MM-DD'),
    'Premium', 1, 1
);

INSERT INTO Property (
    ID, Address, TypeID, Rooms, LivingArea, LotSize, Condition, Price, Status,
    AvailabilityDate, ExclusivityTier, LocationID, OwnerID
)
VALUES (
    2, '456 Elegant Rd', 2, 5, 200.0, NULL, 'New', 
    5000000, 'Available', TO_DATE('2025-02-01','YYYY-MM-DD'),
    'Standard', 2, 2
);

INSERT INTO Property (
    ID, Address, TypeID, Rooms, LivingArea, LotSize, Condition, Price, Status,
    AvailabilityDate, ExclusivityTier, LocationID, OwnerID
)
VALUES (
    3, '789 Villa Way', 3, 7, 350.0, 900.0, 'Good', 
    8000000, 'Available', TO_DATE('2025-03-01','YYYY-MM-DD'),
    'Limited Access', 3, 3
);

-- Insertion dans Facility
INSERT INTO Facility (ID, Type, Description) 
VALUES (1, 'Pool', 'A private swimming pool');
INSERT INTO Facility (ID, Type, Description) 
VALUES (2, 'Garage', 'A spacious garage for vehicles');
INSERT INTO Facility (ID, Type, Description) 
VALUES (3, 'Guest House', 'An additional guest house on the property');

-- Insertion dans PropertyFacility
INSERT INTO PropertyFacility (PropertyID, FacilityID) 
VALUES (1, 1);
INSERT INTO PropertyFacility (PropertyID, FacilityID) 
VALUES (1, 2);
INSERT INTO PropertyFacility (PropertyID, FacilityID) 
VALUES (1, 3);
INSERT INTO PropertyFacility (PropertyID, FacilityID) 
VALUES (2, 2);
INSERT INTO PropertyFacility (PropertyID, FacilityID) 
VALUES (3, 1);

-- Insertion dans Transaction
INSERT INTO Transaction (ID, PropertyID, TotalAmount, Commission)
VALUES (1, 1, 15000000, NULL);
INSERT INTO Transaction (ID, PropertyID, TotalAmount, Commission)
VALUES (2, 2, 5000000, NULL);
INSERT INTO Transaction (ID, PropertyID, TotalAmount, Commission)
VALUES (3, 3, 8000000, NULL);

-- Insertion dans Tour
INSERT INTO Tour (ID, PropertyID, ClientInfo, DateTime)
VALUES (
    1, 1, 'VIP Client', 
    TO_DATE('2025-01-10 14:00:00','YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO Tour (ID, PropertyID, ClientInfo, DateTime)
VALUES (
    2, 2, 'Potential Buyer', 
    TO_DATE('2025-02-05 11:00:00','YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO Tour (ID, PropertyID, ClientInfo, DateTime)
VALUES (
    3, 3, 'Exclusive Client', 
    TO_DATE('2025-03-15 16:00:00','YYYY-MM-DD HH24:MI:SS')
);