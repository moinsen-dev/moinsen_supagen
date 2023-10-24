import 'dart:convert';
import 'dart:io';

import 'package:moinsen_supagen/src/commands/supabase/sql_helper.dart';
import 'package:moinsen_supagen/src/commands/supabase/templates/_index.dart';
import 'package:simple_mustache/simple_mustache.dart';

const filenameSqlTableInfos = 'input/table_infos.sql';
const filenameSqlRelationInfos = 'input/table_relations.sql';

String templateHelper(Map<String, dynamic> map, String template) {
  final m = Mustache(map: map);
  final output = m.convert(template);

  return output;
}

// Generate a comma separated list of schemas. All names are double quoted.
String generateSchemaListString(List<String> schemas) {
  final schemaList = <String>[];
  for (final schema in schemas) {
    schemaList.add("'$schema'");
  }

  return schemaList.join(',');
}

// ignore: avoid_positional_boolean_parameters
String? subJsonFromString(String key, bool isArray, String? jsonString) {
  if (jsonString == null) {
    return null;
  }

  final json = jsonDecode(jsonString);
  String? result;

  if (json != null) {
    final subJson = isArray ? json[0][key] : json[key];
    if (subJson != null) {
      result = jsonEncode(subJson);
    }
  }

  return result;
}

Future<bool> generateFile(String outputDir) async {
  final schemas = <String>['public', 'core', 'blogai'];
  final templMap = <String, dynamic>{
    'schemaList': generateSchemaListString(schemas),
  };

  final tableRelations = await executeSql(
    sqlStatement: templateHelper(
      templMap,
      sqlTableRelationsTemplate,
    ),
  );

  final tableInfos = await executeSql(
    sqlStatement: templateHelper(
      templMap,
      sqlTableInfosTemplate,
    ),
  );

  final dbEnums = await executeSql(
    sqlStatement: templateHelper(
      templMap,
      sqlEnumsTemplate,
    ),
  );

  final dbSchemas = await executeSql(
    sqlStatement: templateHelper(
      templMap,
      sqlSchemaDefinitionsTemplate,
    ),
  );

  final dbIndexes = await executeSql(
    sqlStatement: templateHelper(
      templMap,
      sqlIndexTemplate,
    ),
  );

/*
  final dbFunctions = await executeSql(
    sqlStatement: templateHelper(
      templMap,
      sqlFunctionDefinitionsTemplate,
    ),
  );
*/

  final dbTrigger = await executeSql(
    sqlStatement: templateHelper(
      templMap,
      sqlTriggerDefinitions,
    ),
  );

  final result = await writeToFile(
    sqlMap: {
      'schemes': subJsonFromString(
        'schema_info_array',
        true,
        dbSchemas,
      ),
      'tables': subJsonFromString(
        'schema_tables_infos',
        true,
        tableInfos,
      ),
      'enums': subJsonFromString(
        'db_enums',
        true,
        dbEnums,
      ),
      'relations': subJsonFromString(
        'schema_tables_relations',
        true,
        tableRelations,
      ),
      'indexes': subJsonFromString(
        'index_info_array',
        true,
        dbIndexes,
      ),
      /*
      'functions': subJsonFromString(
        'schema_function_info_array',
        true,
        dbFunctions,
      ),
      */
      'triggers': subJsonFromString(
        'schema_trigger_info_array',
        true,
        dbTrigger,
      ),
    },
    outputDir: outputDir,
  );

  if (result == null) {
    return true;
  }

  return false;
}

Future<String?> writeToFile({
  required Map<String, String?> sqlMap,
  required String outputDir,
}) async {
  try {
    final directory = Directory(outputDir);
    if (!directory.existsSync()) {
      await directory.create();
    }

    final json = <String, dynamic>{};
    for (final entry in sqlMap.entries) {
      final key = entry.key;
      final jsonString = entry.value;
      if (jsonString != null) {
        final jsonEntry = jsonDecode(jsonString);
        json[key] = jsonEntry;
      }
    }

    const encoder = JsonEncoder.withIndent('  ');
    final jsonString = encoder.convert(json);
    final file = File('${directory.path}/db-infos.json');
    await file.writeAsString(jsonString);

    return null; // Success
  } catch (e) {
    return 'Exception: $e';
  }
}
