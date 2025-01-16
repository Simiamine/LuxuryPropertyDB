---------------------------------------------------------
-- TABLE CREATION
---------------------------------------------------------

-- Table: PropertyType
CREATE TABLE PropertyType (
    ID INT PRIMARY KEY,
    Type VARCHAR(50),
    Description VARCHAR(255)
);

-- Table: Location
CREATE TABLE Location (
    ID INT PRIMARY KEY,
    City VARCHAR(100),
    Neighborhood VARCHAR(100)
);

-- Table: Owner
CREATE TABLE Owner (
    ID INT PRIMARY KEY,       -- Identifiant unique pour chaque propriétaire
    Name VARCHAR(100),        -- Nom du propriétaire
    ContactInfo VARCHAR(255)  -- Coordonnées (email, téléphone, etc.)
);

-- Table: Property
CREATE TABLE Property (
    ID INT PRIMARY KEY,                -- Identifiant unique pour chaque propriété
    Address VARCHAR(255),              -- Adresse de la propriété
    TypeID INT,                        -- Référence vers PropertyType
    Rooms INT,                         -- Nombre de chambres
    LivingArea FLOAT,                  -- Surface habitable
    LotSize FLOAT,                     -- Taille du terrain
    Condition VARCHAR(50),             -- État de la propriété
    Price FLOAT,                       -- Prix de la propriété
    Status VARCHAR(50),                -- Statut de la propriété (e.g., Available, Sold)
    AvailabilityDate DATE,             -- Date de disponibilité
    ExclusivityTier VARCHAR(50),       -- Niveau d'exclusivité (e.g., Premium, Standard)
    LocationID INT,                    -- Référence vers Location
    OwnerID INT,                       -- Référence vers Owner
    FOREIGN KEY (TypeID) REFERENCES PropertyType(ID),
    FOREIGN KEY (LocationID) REFERENCES Location(ID),
    FOREIGN KEY (OwnerID) REFERENCES Owner(ID) 
);

-- Table: Facility
CREATE TABLE Facility (
    ID INT PRIMARY KEY,
    Type VARCHAR(50),
    Description VARCHAR(255)
);

-- Table: PropertyFacility
CREATE TABLE PropertyFacility (
    PropertyID INT,
    FacilityID INT,
    PRIMARY KEY (PropertyID, FacilityID),
    FOREIGN KEY (PropertyID) REFERENCES Property(ID),
    FOREIGN KEY (FacilityID) REFERENCES Facility(ID)
);

-- Table: Transaction
CREATE TABLE Transaction (
    ID INT PRIMARY KEY,
    PropertyID INT,
    TotalAmount FLOAT,
    Commission FLOAT,
    FOREIGN KEY (PropertyID) REFERENCES Property(ID)
);

-- Table: Tour
CREATE TABLE Tour (
    ID INT PRIMARY KEY,
    PropertyID INT,
    ClientInfo VARCHAR(255),
    DateTime DATE,
    FOREIGN KEY (PropertyID) REFERENCES Property(ID)
);