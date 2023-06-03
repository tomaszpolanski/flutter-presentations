import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:klar_bloc_base/klar_bloc_base.dart';

typedef {{name.pascalCase()}}State = PersistentCubitState<{{name.pascalCase()}}Data, Object>;
typedef Loading{{name.pascalCase()}}State
    = PersistentLoadingCubitState<{{name.pascalCase()}}Data, Object>;
typedef Loaded{{name.pascalCase()}}State
    = PersistentLoadedCubitState<{{name.pascalCase()}}Data, Object>;
typedef Error{{name.pascalCase()}}State
    = PersistentErrorCubitState<{{name.pascalCase()}}Data, Object>;

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit() : super(PersistentCubitState.loading(null));

  Future<void> refresh() async {
    await updateNumber(number: 42);
  }

  Future<void> updateNumber({required int number}) async {
    emit(state.toLoading(state.data));

    try {
      emit(state.toLoaded({{name.pascalCase()}}Data(number: number)));
    } catch (e) {
      emit(state.toError(e, data: state.data));
    }
  }

  @override
  Future<void> close() async => super.close();
}

class {{name.pascalCase()}}Data extends Equatable {
  const {{name.pascalCase()}}Data({
    required this.number,
  });

  final int number;

  {{name.pascalCase()}}Data copyWith({
    int? number,
  }) =>
      {{name.pascalCase()}}Data(
        number: number ?? this.number,
      );

  @override
  List<Object?> get props => [
        number,
      ];
}
