const String sqlSchemaDefinitionsTemplate = '''
WITH schema_comments AS (
    SELECT 
        nsp.oid AS schema_oid,
        nsp.nspname AS schema_name,
        obj_description(nsp.oid, 'pg_namespace') AS schema_comment
    FROM 
        pg_namespace nsp
    WHERE
        nspname NOT LIKE 'pg_%' AND nspname != 'information_schema'
)

, schema_table_counts AS (
    SELECT
        nsp.oid AS schema_oid,
        count(cls.oid) AS table_count
    FROM
        pg_namespace nsp
    JOIN
        pg_class cls ON cls.relnamespace = nsp.oid
    WHERE
        nspname NOT LIKE 'pg_%' AND nspname != 'information_schema'
        AND cls.relkind = 'r'
    GROUP BY
        nsp.oid
)

SELECT 
    json_agg(
        json_build_object(
            'name', sc.schema_name,
            'comment', sc.schema_comment,
            'table_count', stc.table_count
        )
    ) AS schema_info_array
FROM 
    schema_comments sc
JOIN
    schema_table_counts stc ON sc.schema_oid = stc.schema_oid;
''';
