---------------------------------------------------------
-- PACKAGE DEFINITION
---------------------------------------------------------
CREATE OR REPLACE PACKAGE LuxuryPropertyUtils AS
    -- Procedure 1: Validate Multi-Day Tour
    PROCEDURE validate_multi_day_tour(
        p_property_id INT, 
        p_start_date DATE, 
        p_end_date DATE
    );

    -- Procedure 2: Calculate Total Revenue per Property
    PROCEDURE calculate_total_revenue(
        p_property_id INT, 
        p_total_revenue OUT FLOAT
    );

    -- Procedure 3: Assign Dynamic Commission Rate
    PROCEDURE assign_dynamic_commission_rate(
        p_transaction_id INT, 
        p_total_amount FLOAT
    );

    -- Procedure 4: Generate Monthly Performance Report
    PROCEDURE generate_monthly_report(
        p_month IN NUMBER, 
        p_year IN NUMBER, 
        p_sold_properties OUT NUMBER, 
        p_total_revenue OUT FLOAT
    );

    -- Procedure 5: Update Property Status Based on Duration
    PROCEDURE update_status_based_on_duration(
        p_property_id INT
    );
END LuxuryPropertyUtils;
/
---------------------------------------------------------
-- PACKAGE BODY
---------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY LuxuryPropertyUtils AS

    -----------------------------------------------------
    -- Procedure 1: Validate Multi-Day Tour
    -----------------------------------------------------
    PROCEDURE validate_multi_day_tour(
        p_property_id INT, 
        p_start_date DATE, 
        p_end_date DATE
    ) IS
        v_count INTEGER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM Tour
        WHERE PropertyID = p_property_id
          AND (DateTime BETWEEN p_start_date AND p_end_date);

        IF v_count > 0 THEN
            RAISE_APPLICATION_ERROR(
                -20005, 
                'The property has conflicts with existing tours within the selected date range.'
            );
        END IF;
    END validate_multi_day_tour;

    -----------------------------------------------------
    -- Procedure 2: Calculate Total Revenue per Property
    -----------------------------------------------------
    PROCEDURE calculate_total_revenue(
        p_property_id INT, 
        p_total_revenue OUT FLOAT
    ) IS
    BEGIN
        SELECT SUM(TotalAmount)
        INTO p_total_revenue
        FROM Transaction
        WHERE PropertyID = p_property_id;

        IF p_total_revenue IS NULL THEN
            p_total_revenue := 0;
        END IF;
    END calculate_total_revenue;

    -----------------------------------------------------
    -- Procedure 3: Assign Dynamic Commission Rate
    -----------------------------------------------------
    PROCEDURE assign_dynamic_commission_rate(
        p_transaction_id INT, 
        p_total_amount FLOAT
    ) IS
        v_commission_rate FLOAT;
    BEGIN
        IF p_total_amount >= 10000000 THEN
            v_commission_rate := 0.03; -- 3% for high-value properties
        ELSIF p_total_amount >= 5000000 THEN
            v_commission_rate := 0.05; -- 5% for mid-range properties
        ELSE
            v_commission_rate := 0.07; -- 7% for low-value properties
        END IF;

        UPDATE Transaction
        SET Commission = 5000 + (p_total_amount * v_commission_rate)
        WHERE ID = p_transaction_id;
    END assign_dynamic_commission_rate;

    -----------------------------------------------------
    -- Procedure 4: Generate Monthly Performance Report
    -----------------------------------------------------
    PROCEDURE generate_monthly_report(
        p_month IN NUMBER, 
        p_year IN NUMBER, 
        p_sold_properties OUT NUMBER, 
        p_total_revenue OUT FLOAT
    ) IS
    BEGIN
        -- Count sold properties
        SELECT COUNT(*)
        INTO p_sold_properties
        FROM Property
        WHERE Status = 'Sold'
          AND EXTRACT(MONTH FROM AvailabilityDate) = p_month
          AND EXTRACT(YEAR FROM AvailabilityDate) = p_year;

        -- Calculate total revenue
        SELECT SUM(TotalAmount)
        INTO p_total_revenue
        FROM Transaction
        WHERE EXTRACT(MONTH FROM TransactionDate) = p_month
          AND EXTRACT(YEAR FROM TransactionDate) = p_year;

        IF p_total_revenue IS NULL THEN
            p_total_revenue := 0;
        END IF;
    END generate_monthly_report;

    -----------------------------------------------------
    -- Procedure 5: Update Property Status Based on Duration
    -----------------------------------------------------
    PROCEDURE update_status_based_on_duration(
        p_property_id INT
    ) IS
        v_availability_date DATE;
    BEGIN
        SELECT AvailabilityDate
        INTO v_availability_date
        FROM Property
        WHERE ID = p_property_id;

        IF v_availability_date < SYSDATE - 90 THEN
            UPDATE Property
            SET Status = 'Expired'
            WHERE ID = p_property_id;
        END IF;
    END update_status_based_on_duration;

END LuxuryPropertyUtils;
/