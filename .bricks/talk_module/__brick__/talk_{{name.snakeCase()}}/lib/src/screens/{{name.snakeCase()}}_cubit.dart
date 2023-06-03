import 'package:equatable/equatable.dart';
import 'package:klar_bloc_base/klar_bloc_base.dart';
import 'package:feature_{{name.snakeCase()}}/src/data/{{name.snakeCase()}}_api.dart';

typedef {{name.pascalCase()}}State = CubitState<{{name.pascalCase()}}Data, Object>;

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit({
    required {{name.pascalCase()}}Api {{name.camelCase()}}Api,
  })  : _{{name.camelCase()}}Api = {{name.camelCase()}}Api,
        super(CubitState.loading());

  final {{name.pascalCase()}}Api _{{name.camelCase()}}Api;

  void init() async {
    emit(CubitState.loading());

    try {
      await _{{name.camelCase()}}Api.request();

      emit(state.toLoaded(const {{name.pascalCase()}}Data()));
    } catch (e) {
      emit(state.toError(e));
    }
  }
}

class {{name.pascalCase()}}Data extends Equatable {
  const {{name.pascalCase()}}Data();

  @override
  List<Object?> get props => [];
}
