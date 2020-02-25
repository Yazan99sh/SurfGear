import 'package:ci/domain/command.dart';
import 'package:ci/domain/element.dart';
import 'package:ci/exceptions/exceptions.dart';
import 'package:ci/services/parsers/pubspec_parser.dart';
import 'package:ci/tasks/checks.dart';
import 'package:ci/tasks/core/scenario.dart';
import 'package:ci/tasks/utils.dart';

/// Сценарий для команды check_linter.
///
/// Пример вызова:
/// dart ci check_linter
class CheckLinterScenario extends ChangedElementScenario {
  static const String commandName = 'check_linter';

  CheckLinterScenario(
    Command command,
    PubspecParser pubspecParser,
  ) : super(
          command,
          pubspecParser,
        );

  @override
  Future<void> doExecute(List<Element> elements) async {
    try {
      /// запускаем проверку
      await checkModulesWithLinter(elements);
    } on BaseCiException {
      rethrow;
    }
  }
}
