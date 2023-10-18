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
    case 'timestamp':
    case 'timestamptz':
      return 'DateTime';
    default:
      throw UnsupportedError('Unsupported type $type');
  }
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
