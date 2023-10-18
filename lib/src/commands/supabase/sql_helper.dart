import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<String?> executeSqlAndWriteToFile({
  required String sqlStatement,
  required String outputDir,
  required String filetype,
  String? supabaseUrl,
  String? supabaseApiKey,
}) async {
  supabaseUrl = supabaseUrl ?? Platform.environment['SUPABASE_URL'];
  supabaseApiKey = supabaseApiKey ?? Platform.environment['SUPABASE_ANON_KEY'];

  final url = '$supabaseUrl/functions/v1/execute-sql';
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $supabaseApiKey',
  };
  final body = jsonEncode({
    'sql': sqlStatement,
  });

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final directory = Directory(outputDir);
      if (!directory.existsSync()) {
        await directory.create();
      }

      final file = File('${directory.path}/$filetype.json');
      await file.writeAsString(
        response.body,
      );

      return null; // Success
    } else {
      return 'Error: ${response.statusCode} ${response.reasonPhrase}';
    }
  } catch (e) {
    return 'Exception: $e';
  }
}
