import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:moinsen_supagen/src/commands/supabase/generate.dart';

/// {@template db_command}
///
/// `moinsen_supagen db`
/// A [Command] to exemplify a sub command
/// {@endtemplate}
class DbCommand extends Command<int> {
  /// {@macro sample_command}
  DbCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser.addFlag(
      'relations',
      abbr: 'r',
      help: 'Generate JSON file with table relations informations.',
    );
    argParser.addFlag(
      'table',
      abbr: 't',
      help: 'Generate JSON file with table informations.',
    );
    argParser.addOption(
      'output',
      abbr: 'o',
      help: 'Output directory. Eg. lib/prisma or lib/entities',
    );
  }

  @override
  String get description => '''
Db command extracts data from a supabase database and generate JSON files with the requested informations.
''';

  @override
  String get name => 'db';

  final Logger _logger;

  @override
  Future<int> run() async {
    const output = 'db command.';

    if (argResults != null) {
      final outputDir = (argResults?['output'] as String).trim();

      final r = await generateFile(outputDir);

      if (r) {
        _logger.info('Success');
      } else {
        _logger.info('Error');
      }
    }

    _logger.info(output);
    return ExitCode.success.code;
  }

  bool checkFlag(List<String> argResults, String flag) {
    return argResults.contains(flag);
  }
}
