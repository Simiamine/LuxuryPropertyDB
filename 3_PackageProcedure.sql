---------------------------------------------------------
-- PACKAGE DEFINITION
---------------------------------------------------------
CREATE OR REPLACE PACKAGE LuxuryPropertyUtils AS
    -- Procedure 1: Validate Property Price
    PROCEDURE validate_property_price(p_property_id INT, p_price FLOAT);
    
    -- Procedure 2: Check Tour Conflict
    PROCEDURE check_tour_conflict(p_property_id INT, p_datetime DATE);
    
    -- Procedure 3: Update Property Status
    PROCEDURE update_property_status(p_property_id INT);
    
    -- Procedure 4: Calculate Commission
    PROCEDURE calculate_commission(p_transaction_id INT, p_total_amount FLOAT);
    
    -- Procedure 5: Validate Exclusive Tour
    PROCEDURE validate_exclusive_tour(p_property_id INT, p_client_info VARCHAR2);
END LuxuryPropertyUtils;
/
---------------------------------------------------------
-- PACKAGE BODY
---------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY LuxuryPropertyUtils AS

    -----------------------------------------------------
    -- Procedure 1: Validate Property Price
    -----------------------------------------------------
    PROCEDURE validate_property_price(p_property_id INT, p_price FLOAT) IS
    BEGIN
        IF p_price < 10000 THEN
            RAISE_APPLICATION_ERROR(-20001, 'The property price must be at least €10,000.');
        END IF;
        -- Exemple facultatif de mise à jour si besoin :
        -- UPDATE Property
        -- SET Price = p_price
        -- WHERE ID = p_property_id;
    END validate_property_price;

    -----------------------------------------------------
    -- Procedure 2: Check Tour Conflict
    -----------------------------------------------------
    PROCEDURE check_tour_conflict(p_property_id INT, p_datetime DATE) IS
        v_count INTEGER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM Tour
        WHERE PropertyID = p_property_id
          AND DateTime = p_datetime;

        IF v_count > 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 
                'A tour is already scheduled for this property at the specified time.');
        END IF;
    END check_tour_conflict;

    -----------------------------------------------------
    -- Procedure 3: Update Property Status
    -----------------------------------------------------
    PROCEDURE update_property_status(p_property_id INT) IS
    BEGIN
        UPDATE Property
        SET Status = 'Sold'
        WHERE ID = p_property_id;
    END update_property_status;

    -----------------------------------------------------
    -- Procedure 4: Calculate Commission
    -----------------------------------------------------
    PROCEDURE calculate_commission(p_transaction_id INT, p_total_amount FLOAT) IS
        v_commission FLOAT;
    BEGIN
        IF p_total_amount > 0 THEN
            v_commission := 5000 + (p_total_amount * 0.05);
            UPDATE Transaction
            SET Commission = v_commission
            WHERE ID = p_transaction_id;
        ELSE
            RAISE_APPLICATION_ERROR(-20003, 'Total amount must be greater than zero.');
        END IF;
    END calculate_commission;

    -----------------------------------------------------
    -- Procedure 5: Validate Exclusive Tour
    -----------------------------------------------------
    PROCEDURE validate_exclusive_tour(p_property_id INT, p_client_info VARCHAR2) IS
        v_exclusivity VARCHAR2(50);
    BEGIN
        SELECT ExclusivityTier
        INTO v_exclusivity
        FROM Property
        WHERE ID = p_property_id;

        IF v_exclusivity != 'Premium' 
           AND p_client_info LIKE '%VIP%' THEN
            RAISE_APPLICATION_ERROR(-20004, 
                'Only premium properties can have VIP tours.');
        END IF;
    END validate_exclusive_tour;

END LuxuryPropertyUtils;
/