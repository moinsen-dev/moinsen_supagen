// ignore_for_file: avoid_dynamic_calls

String modifyTableName(String tableName) {
  if (tableName.endsWith('s')) {
    return tableName.substring(0, tableName.length - 1);
  }
  return tableName;
}

String toPascalCase(String text) {
  return text
      .split('_')
      .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
      .join();
}

String toCamelCase(String text) {
  final words = text.split('_');
  final firstWord = words.first.toLowerCase();
  final otherWords = words
      .skip(1)
      .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
      .join();
  return firstWord + otherWords;
}

String baseType(String type) {
  if (type.contains('enum')) {
    return 'String';
  }

  switch (type) {
    case 'bool':
    case 'boolean':
      return 'bool';
    case 'text':
    case 'string':
    case 'json':
    case 'jsonb':
    case 'uuid':
    case 'vector':
      return 'String';
    case 'int':
    case 'int4':
    case 'int8':
      return 'int';
    case 'numeric':
      return 'double';
    case 'date':
    case 'timestamp':
    case 'timestamptz':
      return 'DateTime';
    default:
      throw UnsupportedError('Unsupported type $type');
  }
}

/// Sort a list of strings by name (ignore case)
List<String> sort(Iterable<String> list) {
  final sortedList = <String>[];

  for (final element in list) {
    final lowerCaseElement = element.toLowerCase();
    final index = sortedList.indexWhere(
      (e) => lowerCaseElement.compareTo(e.toLowerCase()) < 0,
    );

    if (index == -1) {
      sortedList.add(element);
    } else {
      sortedList.insert(index, element);
    }
  }

  return sortedList;
}

/// Sort a list of tablename. If a group is given, the tables are sorted
/// by the group of tables. All tables are sorted by name (ignore case)
/// in the group.
List<String> sortTablesByGroups(
  Iterable<String> tables, {
  Map<String, List<String>> group = const {},
}) {
  final sortedTables = <String>[];

  for (final entry in group.entries) {
    final groupTables = entry.value;
    final sortedGroupTables = sort(groupTables);
    sortedTables.addAll(sortedGroupTables);
  }

  final otherTables =
      tables.where((element) => !sortedTables.contains(element));
  final sortedOtherTables = sort(otherTables);
  sortedTables.addAll(sortedOtherTables);

  return sortedTables;
}

List<dynamic> sortAndFilterByName(List<dynamic> list) {
  final newList = [...list];

  newList.sort((a, b) {
    final sa = a['name'] as String;
    final sb = b['name'] as String;

    return sa.compareTo(sb);
  });

  // Remove duplicates
  for (var i = 0; i < newList.length - 1; i++) {
    final a = newList[i];
    final b = newList[i + 1];

    final sa = a['name'] as String;
    final sb = b['name'] as String;

    if (sa == sb) {
      newList.removeAt(i);
      i--;
    }
  }

  return newList;
}

String dartType(String type) {
  if (type.startsWith('_')) {
    final elementType = baseType(type.substring(1));
    return 'List<$elementType>';
  }

  return baseType(type);
}

String prismaType(String type) {
  if (type.startsWith('_')) {
    final elementType = baseType(type.substring(1));
    return toPascalCase('$elementType[]');
  }

  return toPascalCase(baseType(type));
}

String erdKey(String key) {
  if (key == 'PRIMARY KEY') {
    return 'PK';
  } else if (key == 'FOREIGN KEY') {
    return 'FK';
  }

  return '';
}

bool isArray(String type) {
  return type.startsWith('_');
}

// TODO(udi): Type UUID support
// TODO(udi): Id fields also as UUID
String erdType(String type) {
  if (isArray(type)) {
    final elementType = baseType(type.substring(1));
    return elementType;
  }

  return baseType(type);
}
