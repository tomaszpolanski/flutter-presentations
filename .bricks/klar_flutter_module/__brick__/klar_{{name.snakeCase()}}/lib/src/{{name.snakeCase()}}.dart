import 'package:equatable/equatable.dart';

class {{name.pascalCase()}} extends Equatable {
  const {{name.pascalCase()}}(this.string);

  final String string;

  @override
  List<Object> get props => [string];
}
