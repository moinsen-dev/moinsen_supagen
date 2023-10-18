WITH 
    table_columns AS (
        SELECT
            tc.table_name,
            tc.table_schema,
            kcu.constraint_name,
            cc.column_name AS column_name,
            cc.udt_name || 
                CASE 
                    WHEN cc.character_maximum_length IS NOT NULL THEN '(' || cc.character_maximum_length || ')'
                    ELSE ''
                END AS data_type,
            cc.is_nullable,
            CASE
                WHEN kcu.constraint_name IS NOT NULL THEN tco.constraint_type
                ELSE 'NONE'
            END AS key_type,
            cc.ordinal_position,
            pg_catalog.col_description(pg_catalog.pg_class.oid, cc.ordinal_position) AS column_comment
        FROM 
            information_schema.tables AS tc
        JOIN 
            information_schema.columns AS cc
        ON 
            tc.table_name = cc.table_name
        AND 
            tc.table_schema = cc.table_schema
        LEFT JOIN 
            information_schema.key_column_usage AS kcu
        ON 
            tc.table_name = kcu.table_name
        AND 
            tc.table_schema = kcu.table_schema
        AND 
            cc.column_name = kcu.column_name
        LEFT JOIN 
            information_schema.table_constraints AS tco
        ON 
            kcu.constraint_name = tco.constraint_name
        AND 
            kcu.table_schema = tco.table_schema
        AND 
            kcu.table_name = tco.table_name
        LEFT JOIN
            pg_catalog.pg_class
        ON 
            pg_catalog.pg_class.relname = tc.table_name
        WHERE 
            tc.table_schema = 'public'
),
    ranked_columns AS (
        SELECT
            table_name,
            column_name,
            data_type,
            is_nullable,
            key_type,
            column_comment,
            ROW_NUMBER() OVER (PARTITION BY table_name ORDER BY ordinal_position) AS rn
        FROM
            table_columns
)
, aggregated_columns AS (
    SELECT
        table_name,
        JSONB_AGG(
            JSONB_BUILD_OBJECT(
                'name', column_name,
                'type', data_type,
                'nullable', CASE WHEN is_nullable = 'YES' THEN true ELSE false END,
                'keyInformations', key_type,
                'comment', column_comment -- Kommentar hier hinzugefügt
            )
            ORDER BY rn
        ) AS columns
    FROM
        ranked_columns
    GROUP BY
        table_name
)
SELECT 
    JSONB_OBJECT_AGG(table_name, columns) AS tables_info
FROM 
    aggregated_columns;
