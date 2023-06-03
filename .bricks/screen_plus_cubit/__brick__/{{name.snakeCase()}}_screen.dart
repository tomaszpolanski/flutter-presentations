import '{{name.snakeCase()}}_content.dart';
import '{{name.snakeCase()}}_cubit.dart';
import 'package:flutter/material.dart';
import 'package:klar_bloc_base/klar_bloc_base.dart';
import 'package:klar_dependencies/klar_dependencies.dart';
import 'package:klar_l10n/klar_l10n.dart';
import 'package:klar_shared_ui/klar_shared_ui.dart';
import 'package:klar_theme/klar_theme.dart';

class {{name.pascalCase()}}Screen extends StatelessWidget {
  const {{name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<{{name.pascalCase()}}Cubit>(
        create: (context) => {{name.pascalCase()}}Cubit(),
        child: const ThemeV2(
          child: {{name.pascalCase()}}Consumer(),
        ),
      );
}

class {{name.pascalCase()}}Consumer extends StatelessWidget {
  const {{name.pascalCase()}}Consumer({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            tr(
              context,
              const TermKey('title'),
            ),
          ),
        ),
        body: CubitConsumer<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
          builder: (context, state) => state.match(
            onLoading: (data) => const Center(
              child: KlarProgressIndicator(),
            ),
            onError: (error, _) => ErrorContent(
              error: error,
              onPressed: () => context.bloc<{{name.pascalCase()}}Cubit>().refresh(),
            ),
            onLoaded: (data) => {{name.pascalCase()}}Content(
              number: data.number,
            ),
          ),
        ),
      );
}
