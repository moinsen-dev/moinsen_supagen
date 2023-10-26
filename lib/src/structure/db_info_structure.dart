import 'package:json_annotation/json_annotation.dart';

part 'db_info_structure.g.dart';

enum MseType {
  bool,
  date,
  float4,
  float8,
  int2,
  int4,
  int8,
  json,
  jsonb,
  text,
  time,
  timestamp,
  timestamptz,
  timetz,
  uuid,
  varchar
}

enum MseRelationType {
  oneToMany,
  manyToOne,
  oneToOne,
  manyToMany,
}

@JsonSerializable()
class MsDatabase {
  MsDatabase({required this.schemas});

  factory MsDatabase.fromJson(Map<String, Object?> json) =>
      _$MsDatabaseFromJson(json);
  final List<MsSchema> schemas;

  Map<String, dynamic> toJson() => _$MsDatabaseToJson(this);
}

@JsonSerializable()
class MsSchema {
  MsSchema({required this.name, required this.tables});

  factory MsSchema.fromJson(Map<String, Object?> json) =>
      _$MsSchemaFromJson(json);

  final String name;
  final List<MsTable> tables;

  Map<String, dynamic> toJson() => _$MsSchemaToJson(this);
}

@JsonSerializable()
class MsTable {
  MsTable({
    required this.name,
    required this.attributes,
    required this.relations,
  });

  factory MsTable.fromJson(Map<String, Object?> json) =>
      _$MsTableFromJson(json);

  final String name;
  final List<MsAttribute> attributes;
  final List<MsRelation> relations;

  Map<String, dynamic> toJson() => _$MsTableToJson(this);
}

@JsonSerializable()
class MsAttribute {
  MsAttribute({
    required this.name,
    required this.type,
    required this.isNullable,
    required this.isRequired,
    required this.isPrimaryKey,
    required this.isForeignKey,
    required this.isArray,
  });

  factory MsAttribute.fromJson(Map<String, Object?> json) =>
      _$MsAttributeFromJson(json);

  final String name;
  final MseType type;
  final bool isNullable;
  final bool isRequired;
  final bool isPrimaryKey;
  final bool isForeignKey;
  final bool isArray;

  Map<String, dynamic> toJson() => _$MsAttributeToJson(this);
}

@JsonSerializable()
class MsRelation {
  MsRelation({
    required this.fromTable,
    required this.toTable,
    required this.type,
  });

  factory MsRelation.fromJson(Map<String, Object?> json) =>
      _$MsRelationFromJson(json);

  final MsTable fromTable;
  final MsTable toTable;
  final MseRelationType type;
}
