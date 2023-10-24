const sqlEnumsTemplate = '''
WITH EnumDefinitions AS (
    SELECT
        n.nspname as schema,
        t.typname as name,
        e.enumlabel as value
    FROM
        pg_type t
    JOIN
        pg_enum e ON t.oid = e.enumtypid
    JOIN
        pg_namespace n ON t.typnamespace = n.oid
    WHERE
        n.nspname = ANY(ARRAY[{{schemaList}}]::name[])  -- Specified list of schemas
), AggregatedEnums AS (
    SELECT
        schema,
        name,
        json_agg(value) as values
    FROM
        EnumDefinitions
    GROUP BY
        schema,
        name
), SchemaGroupedEnums AS (
    SELECT
        schema,
        json_agg(
            json_build_object(
                'name', name,
                'values', values
            )
        ) AS enums
    FROM
        AggregatedEnums
    GROUP BY
        schema
)
SELECT
    json_object_agg(
        schema,
        enums
    ) AS db_enums
FROM
    SchemaGroupedEnums;
''';
