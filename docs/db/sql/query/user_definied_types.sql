SELECT
    t1.typname
    , CASE 
        WHEN t1.typcategory = 'C' 
            THEN '複合型' 
        WHEN t1.typcategory = 'E' 
            THEN '列挙型' 
        ELSE 'other' 
        END 
FROM
    pg_catalog.pg_type t1 
    LEFT OUTER JOIN pg_catalog.pg_namespace t2 
        ON t1.typnamespace = t2.oid 
    LEFT OUTER JOIN pg_catalog.pg_tables t3 
        ON t1.typname = t3.tablename 
    LEFT OUTER JOIN pg_catalog.pg_sequences t4 
        ON t1.typname = t4.sequencename 
WHERE
    t2.nspname = 'public' 
    AND (t1.typcategory = 'C' OR t1.typcategory = 'E') 
    AND t3.tablename IS NULL 
    AND t4.sequencename IS NULL 
ORDER BY
    t1.typname
;

