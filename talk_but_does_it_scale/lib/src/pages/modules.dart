import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:shared_ui/shared_ui.dart';
import 'package:talk_but_does_it_scale/src/data/module.dart';

class Modules extends StatelessWidget {
  const Modules({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('packages/talk_but_does_it_scale/assets/modules.json'),
      builder: (context, snapshot) {
        final _json = snapshot.data;
        if (_json == null) {
          return const SizedBox();
        }
        final m = Module.fromJson(json.decode(_json));
        return Center(
          child: SizedBox(
            width: 500,
            height: 700,
            child: Snippet(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _Modules(
                  modules: m.modules,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Modules extends StatefulWidget {
  const _Modules({
    super.key,
    required this.modules,
  });

  final List<Module> modules;

  @override
  State<_Modules> createState() => _ModulesState();
}

class _ModulesState extends State<_Modules> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...widget.modules.map(_SingleModule.new),
      ],
    );
  }
}

class _SingleModule extends StatefulWidget {
  const _SingleModule(this.module, {super.key});

  final Module module;

  @override
  State<_SingleModule> createState() => _SingleModuleState();
}

class _SingleModuleState extends State<_SingleModule> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final chevron = FadeInVisibility(
      visible: widget.module.modules.isNotEmpty,
      child: Transform.rotate(
        angle: _expanded ? math.pi / 2 : 0,
        child: const Icon(Icons.chevron_right_sharp),
      ),
    );

    return GestureDetector(
      onTap: widget.module.modules.isNotEmpty
          ? () {
              setState(() {
                _expanded = !_expanded;
              });
            }
          : null,
      child: ColoredBox(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            chevron,
            FadeInVisibility(
              visible: widget.module.type == Type.ui,
              child: const FlutterLogo(),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.module.name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  if (_expanded)
                    ...widget.module.modules.map(_SingleModule.new),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
