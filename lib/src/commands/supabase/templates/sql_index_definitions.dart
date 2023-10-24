const sqlIndexTemplate = '''
WITH schema_list AS (
    SELECT unnest(ARRAY[{{schemaList}}]) AS schema_name  -- Replace with your schema list
)

, index_info AS (
    SELECT
        indrelid,
        indexrelid,
        pg_get_indexdef(indexrelid) AS index_def,
        nsp.nspname AS schema_name
    FROM
        pg_index
    JOIN
        pg_class cls ON cls.oid = pg_index.indrelid
    JOIN
        pg_namespace nsp ON nsp.oid = cls.relnamespace
    WHERE
        indisvalid
        AND nsp.nspname = ANY((SELECT unnest(ARRAY[{{schemaList}}]) AS schema_name))  -- Replace with your schema list
)

, index_names AS (
    SELECT
        pg_class.oid,
        relname AS index_name,
        nsp.nspname AS schema_name
    FROM
        pg_class
    JOIN
        pg_namespace nsp ON nsp.oid = pg_class.relnamespace
    WHERE
        relkind = 'i'
        AND nsp.nspname = ANY((SELECT unnest(ARRAY[{{schemaList}}]) AS schema_name))  -- Replace with your schema list
)

, aggregated_index_info AS (
    SELECT
        iinfo.schema_name,
        json_agg(
            json_build_object(
                'name', inames.index_name,
                'definition', iinfo.index_def
            )
        ) AS indexes
    FROM
        index_info iinfo
    JOIN
        index_names inames
    ON
        iinfo.indexrelid = inames.oid
        AND iinfo.schema_name = inames.schema_name
    GROUP BY
        iinfo.schema_name
)

SELECT
    json_object_agg(
        schema_name,
        indexes
    ) AS index_info_array
FROM
    aggregated_index_info;
''';
