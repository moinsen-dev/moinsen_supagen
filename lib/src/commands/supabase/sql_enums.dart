const sqlEnums = '''
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
        n.nspname = 'public'
), AggregatedEnums AS (
    SELECT
        name,
        json_agg(value) as values
    FROM
        EnumDefinitions
    GROUP BY
        name
)
SELECT
    json_agg(row_to_json(AggregatedEnums)) as db_enums
FROM
    AggregatedEnums;
''';
