const sqlTableRelationsTemplate = '''
WITH 
    fk_constraints AS (
        SELECT
            con.conname AS constraint_name,
            CONCAT(nsp.nspname, '.', cl.relname) AS referencing_table,
            CONCAT(nsp_rf.nspname, '.', cl_rf.relname) AS referenced_table,
            att.attname AS referencing_column,
            att_rf.attname AS referenced_column,
            CASE 
                WHEN con.confupdtype = 'a' THEN '}o' -- NO ACTION
                WHEN con.confupdtype = 'c' THEN '}o' -- CASCADE
                WHEN con.confupdtype = 'n' THEN '}o' -- SET NULL
                WHEN con.confupdtype = 'd' THEN '}o' -- SET DEFAULT
                WHEN con.confupdtype = 'r' THEN '||' -- RESTRICT
                ELSE '??'
            END AS update_action,
            CASE 
                WHEN con.confdeltype = 'a' THEN 'o{' -- NO ACTION
                WHEN con.confdeltype = 'c' THEN 'o{' -- CASCADE
                WHEN con.confdeltype = 'n' THEN 'o{' -- SET NULL
                WHEN con.confdeltype = 'd' THEN 'o{' -- SET DEFAULT
                WHEN con.confdeltype = 'r' THEN '||' -- RESTRICT
                ELSE '??'
            END AS delete_action
        FROM
            pg_constraint con
        JOIN 
            pg_class cl ON cl.oid = con.conrelid
        JOIN 
            pg_namespace nsp ON cl.relnamespace = nsp.oid
        JOIN 
            pg_attribute att ON att.attrelid = con.conrelid AND att.attnum = ANY(con.conkey)
        JOIN 
            pg_class cl_rf ON cl_rf.oid = con.confrelid
        JOIN 
            pg_namespace nsp_rf ON cl_rf.relnamespace = nsp_rf.oid
        JOIN 
            pg_attribute att_rf ON att_rf.attrelid = con.confrelid AND att_rf.attnum = ANY(con.confkey)
        WHERE 
            con.confrelid > 0 -- foreign key constraints only
            AND nsp.nspname = ANY(ARRAY[{{schemaList}}]::name[])  -- ensure referencing table is in specified schemas
            AND nsp_rf.nspname = ANY(ARRAY[{{schemaList}}]::name[])  -- ensure referenced table is in specified schemas
    ),
    mermaid_relations AS (
        SELECT
            nsp.nspname AS schema_name,
            referencing_table,
            ARRAY_TO_STRING(
                ARRAY_AGG(
                    DISTINCT referencing_table || ' ' || update_action || '--' || delete_action || ' ' || referenced_table
                ),
                ', '
            ) AS relations
        FROM
            fk_constraints
        JOIN
            pg_class cls ON cls.relname = split_part(referencing_table, '.', 2)
        JOIN
            pg_namespace nsp ON nsp.oid = cls.relnamespace
        GROUP BY
            nsp.nspname,
            referencing_table
    ),
    schema_grouped_relations AS (
        SELECT
            schema_name,
            JSONB_AGG(
                JSONB_BUILD_OBJECT(
                    'table', referencing_table,
                    'relations', relations
                )
            ) AS tables
        FROM
            mermaid_relations
        GROUP BY
            schema_name
    )
SELECT
    JSONB_OBJECT_AGG(schema_name, tables) AS schema_tables_relations
FROM
    schema_grouped_relations;
''';
