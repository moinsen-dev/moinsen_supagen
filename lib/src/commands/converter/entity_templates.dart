/*
** entityTemplate
** --------------------------------------------------------
** filename - name of generated file
** entity - name of entity
** dollarEntity - name of entity with $ in front
** tableName - name of table
** content - content of entity (Constructor and attributes)
** staticContent - content of static methods
*/
const templateDartEntity = '''
// ignore_for_file: unnecessary_import, unused_import
import 'package:moinsen_supagen/moinsen_supagen.dart';

import '_index.dart';

part '{{filename}}.g.dart';

class S{{entity}}  {
  static const tblName = '{{tableName}}';
  static String get idName => S{{entity}}.attrId;
  static SupabaseStreamBuilder get stream => Supabase.instance.client
      .from(S{{entity}}.tblName)
      .stream(primaryKey: [idName]);

  static PostgrestFilterBuilder select([String columns = '*']) {
    return Supabase.instance.client.from(S{{entity}}.tblName).select(columns);
  }

  static Future<{{entity}}?> byId(String id) async {
    final response = await Supabase.instance.client
        .from(S{{entity}}.tblName)
        .select()
        .eq(S{{entity}}.attrId, id)
        .single();

    return response == null ? null : {{entity}}.fromJson(response!);
  }

  static Future<List<{{entity}}>> all() async {
    return await Supabase.instance.client.from(S{{entity}}.tblName).select().withConverter(
        (data) => data!.map<{{entity}}>((e) => {{entity}}.fromJson(e)).toList());
  }

  static Future<List<{{entity}}>> byColumn(String column,dynamic value) async {
    return await Supabase.instance.client.from(S{{entity}}.tblName).select().eq(column,value)
       .withConverter(
        (data) => data!.map<{{entity}}>((e) => {{entity}}.fromJson(e)).toList());
  }


{{staticContent}}
}

@JsonSerializable()
class {{entity}} extends MoinsenBaseEntity<{{entity}}> {
{{content}}

  @override
  String get tblName => '{{tableName}}';

  @override
  String get idName => S{{entity}}.attrId;

  @override
  String? get identifier => id;

  @override
  List<Object?> get props => [id];

  factory {{entity}}.fromJson(Map<String, Object?> json) =>
    _{{dollarEntity}}FromJson(json);

  Map<String, dynamic> toJson() => _{{dollarEntity}}ToJson(this);
}
''';
