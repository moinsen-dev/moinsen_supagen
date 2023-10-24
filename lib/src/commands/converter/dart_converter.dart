import 'package:moinsen_supagen/src/commands/converter/dart_converter_entities.dart';
import 'package:moinsen_supagen/src/commands/converter/dart_converter_enums.dart';

Future<void> generateDartFiles(String inputFile, String outputDir) async {
  await generateEntityFiles(inputFile, outputDir);
  await generateEnumFile(inputFile, outputDir);
}
