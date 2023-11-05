import 'package:mason/mason.dart';

void run(HookContext context) {
  _validateUseCaseName(context);
  _setRepoName(context);

  final inputType = context.vars['inputType'] as String;
  context.vars['isWithoutParam'] = inputType == 'none';

  final useCaseType = context.vars['useCaseType'] as String;
  context.vars['isSyncUseCase'] = useCaseType == 'sync';
  context.vars['isAsyncUseCase'] = useCaseType == 'async';
  context.vars['isStreamUseCase'] = useCaseType == 'stream';
}

void _validateUseCaseName(HookContext context) {
  final name = context.vars['name'] as String;

  if (!name.endsWith('_use_case')) {
    final newName = '${name}_use_case';
    context.vars['name'] = newName;
  }
}

void _setRepoName(HookContext context) {
  final name = context.vars['name'] as String;
  final repoName = '${name.replaceAll('_use_case', '')}_repository';
  context.vars['repository'] = repoName;
}
