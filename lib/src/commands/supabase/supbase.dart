// ignore_for_file: avoid_print, inference_failure_on_function_invocation

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:supabase/supabase.dart';

Future<void> supabase({
  required String supabaseUrl,
  required String supabaseApiKey,
}) async {
  final supabase = SupabaseClient(supabaseUrl, supabaseApiKey);

  final data = await supabase
      .from(
        'information_schema.table_constraints',
      )
      .select();
  print(data.data);

  try {
    final response = await http.get(
      Uri.parse('$supabaseUrl/rest/v1/tables?select=table_name'),
      headers: {
        'apikey': supabaseApiKey,
      },
    );

    if (response.statusCode == 200) {
      final tables = json.decode(response.body) as List<dynamic>;

      for (final table in tables) {
        final tableName = table['table_name'] as String;
        final tableColumns =
            await fetchTableColumns(supabaseUrl, supabaseApiKey, tableName);
        final dartCode = generateDartCode(tableName, tableColumns);

        // Write the generated Dart code to a .dart file
        final fileName = '${tableName.toLowerCase()}_entity.dart';
        await File(fileName).writeAsString(dartCode);

        print('Generated $fileName');
      }
    } else {
      print('Failed to fetch table schema: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<List<dynamic>> fetchTableColumns(
  String supabaseUrl,
  String supabaseKey,
  String tableName,
) async {
  final response = await http.get(
    Uri.parse(
      '$supabaseUrl/rest/v1/tables/$tableName?select=column_name,data_type',
    ),
    headers: {
      'apikey': supabaseKey,
    },
  );

  if (response.statusCode == 200) {
    return json.decode(response.body) as List<dynamic>;
  } else {
    throw Exception(
      'Failed to fetch table columns for $tableName: ${response.statusCode}',
    );
  }
}

String generateDartCode(String tableName, List<dynamic> tableColumns) {
  // Implement your code generation logic here, using the table name and columns
  // You can use the 'freezed' package or any other code generation approach

  // This is a simplified example:
  final classDefinition = '''
import 'package:freezed_annotation/freezed_annotation.dart';

part '$tableName.freezed.dart';

@freezed
class $tableName with _$tableName {
  factory $tableName({
    // Define fields based on tableColumns
  }) = _$tableName;
}
''';

  return classDefinition;
}
