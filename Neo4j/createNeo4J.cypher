// Création de nœuds pour les propriétés
CREATE (:Property {id: 1, type: "Mansion", price: 15000000, exclusivityTier: "Premium"});
CREATE (:Property {id: 2, type: "Apartment", price: 5000000, exclusivityTier: "Standard"});
CREATE (:Property {id: 3, type: "Villa", price: 8000000, exclusivityTier: "Limited Access"});

// Création de nœuds pour les propriétaires
CREATE (:Owner {id: 1, name: "John Doe", contact: "john.doe@example.com"});
CREATE (:Owner {id: 2, name: "Jane Smith", contact: "jane.smith@example.com"});

// Création de nœuds pour les clients
CREATE (:Client {id: 1, name: "Alice Johnson", preferences: "Luxury Properties"});
CREATE (:Client {id: 2, name: "Robert Brown", preferences: "Affordable Properties"});

// Création de relations entre les propriétés et les propriétaires
MATCH (p:Property {id: 1}), (o:Owner {id: 1})
CREATE (o)-[:OWNS]->(p);

MATCH (p:Property {id: 2}), (o:Owner {id: 2})
CREATE (o)-[:OWNS]->(p);

// Création de relations entre les clients et les propriétés
MATCH (c:Client {id: 1}), (p:Property {id: 1})
CREATE (c)-[:INTERESTED_IN]->(p);

MATCH (c:Client {id: 2}), (p:Property {id: 3})
CREATE (c)-[:INTERESTED_IN]->(p);

