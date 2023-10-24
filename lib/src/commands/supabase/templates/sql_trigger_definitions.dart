const sqlTriggerDefinitions = '''
WITH trigger_info AS (
    SELECT
        nsp.nspname AS schema_name,
        cls.relname AS table_name,
        trg.tgname AS trigger_name,
        pg_get_triggerdef(trg.oid) AS trigger_definition,
        obj_description(trg.oid, 'pg_trigger') AS trigger_comment
    FROM
        pg_trigger trg
    JOIN
        pg_class cls ON cls.oid = trg.tgrelid
    JOIN
        pg_namespace nsp ON nsp.oid = cls.relnamespace
    WHERE
        NOT trg.tgisinternal
        AND nsp.nspname NOT LIKE 'pg_%'
        AND nsp.nspname != 'information_schema'
)

, grouped_trigger_info AS (
    SELECT
        schema_name,
        json_agg(
            json_build_object(
                'table', table_name,
                'name', trigger_name,
                'definition', trigger_definition,
                'comment', trigger_comment
            )
        ) AS trigger_array
    FROM
        trigger_info
    GROUP BY
        schema_name
)

SELECT
    json_object_agg(
        schema_name,
        trigger_array
    ) AS schema_trigger_info_array
FROM
    grouped_trigger_info;
''';
