import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<String?> executeSql({
  required String sqlStatement,
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
      return response.body;
    } else {
      final msg =
          'Error: ${response.statusCode} ${response.reasonPhrase} BODY: ${response.body}';
      print(msg)
      return msg;
    }
  } catch (e) {
    return 'Exception: $e';
  }
}
