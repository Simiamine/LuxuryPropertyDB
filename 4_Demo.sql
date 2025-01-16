BEGIN
    DBMS_OUTPUT.PUT_LINE('=== 1) Testing validate_property_price ===');
    LuxuryPropertyUtils.validate_property_price(1, 9000);
    DBMS_OUTPUT.PUT_LINE('   -> Price for property ID=1 validated successfully.');

    DBMS_OUTPUT.PUT_LINE('=== 2) Testing check_tour_conflict ===');
    LuxuryPropertyUtils.check_tour_conflict(2, TO_DATE('2025-01-15','YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('   -> No conflict detected for property ID=2 at 2025-01-15.');

    DBMS_OUTPUT.PUT_LINE('=== 3) Testing update_property_status ===');
    LuxuryPropertyUtils.update_property_status(3);
    DBMS_OUTPUT.PUT_LINE('   -> Property ID=3 status updated to "Sold".');

    DBMS_OUTPUT.PUT_LINE('=== 4) Testing calculate_commission ===');
    LuxuryPropertyUtils.calculate_commission(1, 120000);
    DBMS_OUTPUT.PUT_LINE('   -> Commission updated for transaction ID=1.');

    DBMS_OUTPUT.PUT_LINE('=== 5) Testing validate_exclusive_tour ===');
    LuxuryPropertyUtils.validate_exclusive_tour(1, 'VIP Client');
    DBMS_OUTPUT.PUT_LINE('   -> VIP tour validated for property ID=1.');
END;
/