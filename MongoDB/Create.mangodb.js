// Création d'une base de données et d'une collection
use LuxuryPropertyDB;

db.properties.insertMany([
    {
        "propertyID": 1,
        "address": {
            "street": "123 Luxury St",
            "city": "Paris",
            "neighborhood": "Champs-Élysées",
            "postalCode": "75008"
        },
        "type": "Mansion",
        "rooms": 10,
        "livingArea": 450.5,
        "lotSize": 1200.3,
        "condition": "Excellent",
        "price": 15000000,
        "status": "Available",
        "availabilityDate": "2025-01-15",
        "exclusivityTier": "Premium",
        "facilities": ["Pool", "Garage", "Guest House"]
    },
    {
        "propertyID": 2,
        "address": {
            "street": "456 Elegant Rd",
            "city": "London",
            "neighborhood": "Chelsea",
            "postalCode": "SW1X"
        },
        "type": "Apartment",
        "rooms": 5,
        "livingArea": 200.0,
        "lotSize": null,
        "condition": "New",
        "price": 5000000,
        "status": "Available",
        "availabilityDate": "2025-02-01",
        "exclusivityTier": "Standard",
        "facilities": ["Elevator"]
    }
]);