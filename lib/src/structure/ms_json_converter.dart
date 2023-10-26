import 'package:moinsen_supagen/src/structure/db_info_structure.dart';

class MsJsonConverter {
  MsJsonConverter({
    required this.jsonData,
    this.schemas,
  });

  MsDatabase? db;
  final Map<String, dynamic> jsonData;
  final List<String>? schemas;

  void parseDatabaseJson() {
    final schemas = _parseSchemas();
    final tablesMap = _parseTables();

    _fillTablesInSchemas(schemas, tablesMap);
    _parseRelations(tablesMap);

    db = MsDatabase(schemas: schemas);
  }

  List<MsSchema> _parseSchemas() {
    return (jsonData['schemes'] as List)
        .map(
          (schemeData) => MsSchema(
            name: schemeData['name'] as String,
            tables: [],
          ),
        )
        .toList();
  }

  Map<String, List<MsTable>> _parseTables() {
    final tablesMap = <String, List<MsTable>>{};

    final tblMap = jsonData['tables'] as Map<String, dynamic>;

    for (final schemaName in tblMap.keys) {
      final tablesData = tblMap[schemaName] as List;

      tablesMap[schemaName] = tablesData
          .map(
            (tableData) => MsTable(
              name: tableData['table'] as String,
              attributes: _parseAttributes(tableData['columns'] as List),
              relations: [], // Initially empty, will be filled later
            ),
          )
          .toList();
    }

    return tablesMap;
  }

  void _parseRelations(Map<String, List<MsTable>> tablesMap) {
    final relations = jsonData['relations'] as Map<String, dynamic>;
    for (final schemaName in relations.keys) {
      final schemaTables = tablesMap[schemaName];
      final allTables = tablesMap.values.expand((e) => e).toList();
      final relationsData = relations[schemaName] as List<dynamic>;

      if (schemaTables != null) {
        for (final data in relationsData) {
          final fromTable = schemaTables.firstWhere(
            (table) => table.name == data['table'].split('.').last,
            orElse: () => throw ArgumentError('Unknown table'),
          );

          final toTableNames = data['relations']
              .split('}{')
              .map((String e) => e.split('.').last)
              .toList() as List<dynamic>;

          MsTable? toTable;
          for (final tableName in toTableNames) {
            toTable = allTables.firstWhere(
              (table) => table.name == tableName,
              orElse: () => throw ArgumentError('Unknown table'),
            );
            break;
          }

          if (toTable == null) {
            print('Error: toTable is null');
          }
/*
          final toTable = schemaTables.firstWhere(
            (table) => toTableNames.contains(table.name),
            orElse: () {
              throw ArgumentError('Unknown table:$fromTable');
            },
          );
*/
          final relationType = (data['relations'] as String).contains('o--o')
              ? MseRelationType.manyToMany
              : MseRelationType.oneToMany;
          if (toTable != null) {
            fromTable.relations.add(
              MsRelation(
                fromTable: fromTable,
                toTable: toTable,
                type: relationType,
              ),
            );
          }
        }
      }
    }
  }

  List<MsAttribute> _parseAttributes(List<dynamic> columnsData) {
    return columnsData
        .map(
          (columnData) => MsAttribute(
            name: columnData['name'] as String,
            type: MseType.values.firstWhere(
              (e) => e.toString() == 'MseType.${columnData['type']}',
              orElse: () => MseType.text,
            ),
            isNullable: columnData['nullable'] != null,
            isRequired: columnData['nullable'] == null,
            isPrimaryKey: columnData['keyInformations'] == 'PRIMARY KEY',
            isForeignKey: columnData['keyInformations'] == 'FOREIGN KEY',
            isArray: columnData['type'].startsWith('_') != null,
          ),
        )
        .toList();
  }

  void _fillTablesInSchemas(
    List<MsSchema> schemas,
    Map<String, List<MsTable>> tablesMap,
  ) {
    for (final schema in schemas) {
      schema.tables.addAll(tablesMap[schema.name] ?? []);
    }
  }
}
