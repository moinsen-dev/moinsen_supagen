// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_info_structure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MsDatabase _$MsDatabaseFromJson(Map<String, dynamic> json) => MsDatabase(
      schemas: (json['schemas'] as List<dynamic>)
          .map((e) => MsSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MsDatabaseToJson(MsDatabase instance) =>
    <String, dynamic>{
      'schemas': instance.schemas,
    };

MsSchema _$MsSchemaFromJson(Map<String, dynamic> json) => MsSchema(
      name: json['name'] as String,
      tables: (json['tables'] as List<dynamic>)
          .map((e) => MsTable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MsSchemaToJson(MsSchema instance) => <String, dynamic>{
      'name': instance.name,
      'tables': instance.tables,
    };

MsTable _$MsTableFromJson(Map<String, dynamic> json) => MsTable(
      name: json['name'] as String,
      attributes: (json['attributes'] as List<dynamic>)
          .map((e) => MsAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      relations: (json['relations'] as List<dynamic>)
          .map((e) => MsRelation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MsTableToJson(MsTable instance) => <String, dynamic>{
      'name': instance.name,
      'attributes': instance.attributes,
      'relations': instance.relations,
    };

MsAttribute _$MsAttributeFromJson(Map<String, dynamic> json) => MsAttribute(
      name: json['name'] as String,
      type: $enumDecode(_$MseTypeEnumMap, json['type']),
      isNullable: json['isNullable'] as bool,
      isRequired: json['isRequired'] as bool,
      isPrimaryKey: json['isPrimaryKey'] as bool,
      isForeignKey: json['isForeignKey'] as bool,
      isArray: json['isArray'] as bool,
    );

Map<String, dynamic> _$MsAttributeToJson(MsAttribute instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$MseTypeEnumMap[instance.type]!,
      'isNullable': instance.isNullable,
      'isRequired': instance.isRequired,
      'isPrimaryKey': instance.isPrimaryKey,
      'isForeignKey': instance.isForeignKey,
      'isArray': instance.isArray,
    };

const _$MseTypeEnumMap = {
  MseType.bool: 'bool',
  MseType.date: 'date',
  MseType.float4: 'float4',
  MseType.float8: 'float8',
  MseType.int2: 'int2',
  MseType.int4: 'int4',
  MseType.int8: 'int8',
  MseType.json: 'json',
  MseType.jsonb: 'jsonb',
  MseType.text: 'text',
  MseType.time: 'time',
  MseType.timestamp: 'timestamp',
  MseType.timestamptz: 'timestamptz',
  MseType.timetz: 'timetz',
  MseType.uuid: 'uuid',
  MseType.varchar: 'varchar',
};

MsRelation _$MsRelationFromJson(Map<String, dynamic> json) => MsRelation(
      fromTable: MsTable.fromJson(json['fromTable'] as Map<String, dynamic>),
      toTable: MsTable.fromJson(json['toTable'] as Map<String, dynamic>),
      type: $enumDecode(_$MseRelationTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$MsRelationToJson(MsRelation instance) =>
    <String, dynamic>{
      'fromTable': instance.fromTable,
      'toTable': instance.toTable,
      'type': _$MseRelationTypeEnumMap[instance.type]!,
    };

const _$MseRelationTypeEnumMap = {
  MseRelationType.oneToMany: 'oneToMany',
  MseRelationType.manyToOne: 'manyToOne',
  MseRelationType.oneToOne: 'oneToOne',
  MseRelationType.manyToMany: 'manyToMany',
};
