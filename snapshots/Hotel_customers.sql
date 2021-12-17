{{ config(
    target_schema="FROZENSYSTEM",
    target_database="FROZENSYSTEMDB",
    unique_key="cust_id",
    strategy= "check",
    updated_at="Updated_col",
    check_cols= "all"
) }}
