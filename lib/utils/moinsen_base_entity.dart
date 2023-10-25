// ignore_for_file: unused_import

import 'package:moinsen_supagen/moinsen_supagen.dart';

abstract class MoinsenBaseEntity<T> extends Equatable {
  const MoinsenBaseEntity();

  String get tblName;
  String get idName;
  String? get identifier;

  Map<String, dynamic> toJson();

  Future<dynamic> upsert() async {
    final client = Supabase.instance.client;

    final response = await client.from(tblName).upsert(
          this.toJson(),
        );

    return response.data;
  }

  Future<void> insert() async {
    final client = Supabase.instance.client;

    await client.from(tblName).insert(this.toJson());
  }

  Future<void> update() async {
    final client = Supabase.instance.client;

    await client.from(tblName).update(this.toJson());
  }

  Future<void> delete() async {
    if (identifier == null) {
      return;
    }

    // ignore: unused_local_variable
    final response = await Supabase.instance.client
        .from(tblName)
        .delete()
        .eq(idName, identifier);
  }

  @override
  List<Object?> get props => [];
}
