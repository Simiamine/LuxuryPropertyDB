// Création de nœuds pour les propriétés
CREATE (:Property {id: 1, type: "Mansion", price: 15000000, exclusivityTier: "Premium"});
CREATE (:Property {id: 2, type: "Apartment", price: 5000000, exclusivityTier: "Standard"});

// Création de nœuds pour les propriétaires
CREATE (:Owner {id: 1, name: "John Doe"});
CREATE (:Owner {id: 2, name: "Jane Smith"});

// Création de relations entre propriétés et propriétaires
MATCH (p:Property {id: 1}), (o:Owner {id: 1})
CREATE (o)-[:OWNS]->(p);

MATCH (p:Property {id: 2}), (o:Owner {id: 2})
CREATE (o)-[:OWNS]->(p);

// Ajout de relations entre propriétés
MATCH (p1:Property {id: 1}), (p2:Property {id: 2})
CREATE (p1)-[:LOCATED_IN]->(p2);