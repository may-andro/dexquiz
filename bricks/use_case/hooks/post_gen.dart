import 'package:mason/mason.dart';

void run(HookContext context) {
  final name = context.vars['name'] as String;
  context.logger.info('${name} has been created successfully');
}
