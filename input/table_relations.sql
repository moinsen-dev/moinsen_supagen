WITH 
    fk_constraints AS (
        SELECT
            con.conname AS constraint_name,
            cl.relname AS referencing_table,
            nsp.nspname AS referencing_schema,
            att.attname AS referencing_column,
            cl_rf.relname AS referenced_table,
            nsp_rf.nspname AS referenced_schema_rf,
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
            AND nsp.nspname = 'public' -- ensure referencing table is in public schema
            AND nsp_rf.nspname = 'public' -- ensure referenced table is in public schema
    ),
    mermaid_relations AS (
        SELECT
            DISTINCT
            referencing_table,
            ARRAY_TO_STRING(
                ARRAY_AGG(
                    DISTINCT referencing_table || ' ' || update_action || '--' || delete_action || ' ' || referenced_table
                ),
                ', '
            ) AS relations
        FROM
            fk_constraints
        GROUP BY
            referencing_table
    )
SELECT
    JSONB_OBJECT_AGG(referencing_table, relations) AS tables_relations
FROM
    mermaid_relations;
