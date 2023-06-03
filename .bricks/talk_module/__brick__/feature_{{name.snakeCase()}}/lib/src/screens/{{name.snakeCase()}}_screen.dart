import 'package:feature_{{name.snakeCase()}}/src/screens/{{name.snakeCase()}}_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klar_dependencies/klar_dependencies.dart';
import 'package:feature_{{name.snakeCase()}}/src/screens/{{name.snakeCase()}}_cubit.dart';
import 'package:klar_theme/klar_theme.dart';

class {{name.pascalCase()}}Screen extends StatelessWidget {
  const {{name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) => ThemeV2(
        child: BlocProvider<{{name.pascalCase()}}Cubit>(
          create: (context) {
            final data = InjectorDelegateProvider.of(context);

            return {{name.pascalCase()}}Cubit(
              {{name.camelCase()}}Api: data.resolve(),
            )..init();
          },
          child: const {{name.pascalCase()}}ScreenBlocConsumer(),
        ),
      );
}

class {{name.pascalCase()}}ScreenBlocConsumer extends StatelessWidget {
  const {{name.pascalCase()}}ScreenBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final cubit = BlocProvider.of<{{name.pascalCase()}}Cubit>(context);

    return BlocBuilder<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
      builder: (context, state) => const {{name.pascalCase()}}ScreenContent(),
    );
  }
}
