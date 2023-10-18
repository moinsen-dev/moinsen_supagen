import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:moinsen_supagen/src/commands/converter/_index.dart';

/// {@template convert_command}
///
/// `moinsen_supagen convert`
/// A [Command] to exemplify a sub command
/// {@endtemplate}
class ConvertCommand extends Command<int> {
  /// {@macro sample_command}
  ConvertCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser.addOption(
      'input',
      abbr: 'i',
      help: 'Input JSON file with table informations.',
      valueHelp: 'input.json',
    );
    argParser.addOption(
      'output',
      abbr: 'o',
      help: 'Output directory. Eg. lib/prisma or lib/entities',
    );
    argParser.addOption(
      'generate',
      abbr: 'g',
      help: 'Gererate files [erd|dart|prisma].',
    );
  }

  @override
  String get description => '''
Convert command to generate dart or prisma files from a json file with table informations.
''';

  @override
  String get name => 'convert';

  final Logger _logger;

  @override
  Future<int> run() async {
    var output = 'Convert command.';

    if (argResults != null) {
      final inputFile = (argResults?['input'] as String).trim();
      final outputDir = (argResults?['output'] as String).trim();
      final generate = (argResults?['generate'] as String?)?.trim() ?? '';

      var generateOptions = <String>[];
      if (generate.isNotEmpty) {
        generateOptions = generate.split(',');
      }

      if (checkFlag(generateOptions, 'dart')) {
        output = 'Generate dart files.';
        await generateDartFiles(inputFile, outputDir);
      }

      if (checkFlag(generateOptions, 'erd')) {
        output = 'Generate ERD files.';
        await generateErdFile(inputFile, outputDir);
      }

      if (checkFlag(generateOptions, 'prisma')) {
        output = 'Generate prisma files.';
        await generatePrismaFile(inputFile, outputDir);
      }

      _logger.info(output);
    }

    return ExitCode.success.code;
  }

  bool checkFlag(List<String> argResults, String flag) {
    return argResults.contains(flag);
  }
}
