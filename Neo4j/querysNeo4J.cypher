// Recherche des propriétés possédées par un propriétaire spécifique
MATCH (o:Owner)-[:OWNS]->(p:Property)
WHERE o.name = "John Doe"
RETURN p;

// Recherche des propriétés qui intéressent un client spécifique
MATCH (c:Client)-[:INTERESTED_IN]->(p:Property)
WHERE c.name = "Alice Johnson"
RETURN p;