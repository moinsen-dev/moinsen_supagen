import 'package:moinsen_supagen/src/commands/supabase/sql_helper.dart';
import 'package:moinsen_supagen/src/commands/supabase/sql_table_infos.dart';
import 'package:moinsen_supagen/src/commands/supabase/sql_table_relations.dart';

const filenameSqlTableInfos = 'input/table_infos.sql';
const filenameSqlRelationInfos = 'input/table_relations.sql';

Future<String?> generateRelationFile(String outputDir) async {
  final result = await executeSqlAndWriteToFile(
    sqlStatement: sqlTableRelations,
    outputDir: outputDir,
    filetype: 'table-relations',
  );

  return result;
}

Future<String?> generateTableFile(String outputDir) async {
  final result = await executeSqlAndWriteToFile(
    sqlStatement: sqlTableInfos,
    outputDir: outputDir,
    filetype: 'table-infos',
  );

  return result;
}
