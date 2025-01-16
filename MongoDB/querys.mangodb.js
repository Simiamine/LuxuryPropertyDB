// Trouver toutes les propriétés premium
db.properties.find({ exclusivityTier: "Premium" });

// Trouver les propriétés avec une piscine
db.properties.find({ facilities: "Pool" });

// Mise à jour du statut d'une propriété
db.properties.updateOne(
    { propertyID: 1 },
    { $set: { status: "Sold" } }
);

// Suppression d'une propriété
db.properties.deleteOne({ propertyID: 2 });