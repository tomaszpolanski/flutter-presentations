enum Type {
  ui,
  logic,
}

class Module {
  Module({
    required this.name,
    required this.modules,
  });

  final String name;
  final List<Module> modules;

  factory Module.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;
    final modules = json['modules'] as List<dynamic>?;

    return Module(
      name: name,
      modules: modules != null
          // ignore: unnecessary_lambdas
          ? modules.map((m) => Module.fromJson(m)).toList()
          : [],
    );
  }

  Type get type {
    return name == 'example' ||
            name.startsWith('app') ||
            name.startsWith('feature')
        ? Type.ui
        : Type.logic;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      if (modules.isNotEmpty)
        'modules': modules.map((m) => m.toJson()).toList(),
    };
  }
}
