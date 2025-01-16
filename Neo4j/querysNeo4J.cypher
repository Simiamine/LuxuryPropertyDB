// Trouver toutes les propriétés premium
MATCH (p:Property {exclusivityTier: "Premium"})
RETURN p;

// Trouver le propriétaire d'une propriété donnée
MATCH (o:Owner)-[:OWNS]->(p:Property {id: 1})
RETURN o, p;

// Trouver les propriétés dans la même exclusivité tier
MATCH (p1:Property)-[:LOCATED_IN]->(p2:Property)
WHERE p1.exclusivityTier = "Premium"
RETURN p1, p2;