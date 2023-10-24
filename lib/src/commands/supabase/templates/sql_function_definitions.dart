const sqlFunctionDefinitionsTemplate = '''
WITH function_info AS (
    SELECT
        nsp.nspname AS schema_name,
        prc.proname AS function_name,
        pg_get_functiondef(prc.oid) AS function_definition,
        obj_description(prc.oid, 'pg_proc') AS function_comment
    FROM
        pg_proc prc
    JOIN
        pg_namespace nsp ON nsp.oid = prc.pronamespace
    WHERE
        nsp.nspname = ANY(ARRAY[{{schemaList}}]::name[])  -- Specified list of schemas
        AND prc.prokind != 'a'  -- Exclude aggregate functions
)

, grouped_function_info AS (
    SELECT
        schema_name,
        json_agg(
            json_build_object(
                'name', function_name,
                'definition', function_definition,
                'comment', function_comment
            )
        ) AS function_array
    FROM
        function_info
    GROUP BY
        schema_name
)

SELECT
    json_object_agg(
        schema_name,
        function_array
    ) AS schema_function_info_array
FROM
    grouped_function_info;
''';
