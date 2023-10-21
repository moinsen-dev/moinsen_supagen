const entityExtensionTemplate = '''
extension {{entity}}X on {{entity}} {
  String get idName => {{entity}}.attrId;
  Object? get identifier => id;

  Future<dynamic> upsert() async {
    final client = Supabase.instance.client;

    final response = await client.from({{entity}}.tblName).upsert(
          this.toJson(),
        );

    return response.data;
  }

  Future<void> insert() async {
    final client = Supabase.instance.client;

    await client.from({{entity}}.tblName).insert(this.toJson());
  }

  Future<void> update() async {
    final client = Supabase.instance.client;

    await client.from({{entity}}.tblName).update(this.toJson());
  }

  Future<void> delete() async {
    if (identifier == null) {
      return;
    }

    // ignore: unused_local_variable
    final response = await Supabase.instance.client
        .from({{entity}}.tblName)
        .delete()
        .eq(idName, identifier!);
  }

  Future<List<{{entity}}>> select([String columns = '*']) async {
    final client = Supabase.instance.client;

    final response = await client.from({{entity}}.tblName).select(columns);

    return response.map({{entity}}.fromJson).toList();
  }

  Future<{{entity}}?> byId() async {
    if (identifier == null) {
      return null;
    }

    final client = Supabase.instance.client;

    final response = await client
        .from({{entity}}.tblName)
        .select()
        .eq(idName, identifier!)
        .single();

    return {{entity}}.fromJson(response);
  }
}
''';
