import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:shared_ui/shared_ui.dart';

class ProjectStructure extends StatefulWidget {
  const ProjectStructure({
    super.key,
    this.expanded = false,
    required this.modules,
  });

  final bool expanded;
  final List<Module> modules;

  @override
  State<ProjectStructure> createState() => _ProjectStructureState();
}

class _ProjectStructureState extends State<ProjectStructure> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...widget.modules.map(
          (m) => _SingleModule(
            m,
            expanded: widget.expanded,
          ),
        ),
      ],
    );
  }
}

class _SingleModule extends StatefulWidget {
  const _SingleModule(
    this.module, {
    required this.expanded,
    super.key,
  });

  final Module module;
  final bool expanded;

  @override
  State<_SingleModule> createState() => _SingleModuleState();
}

class _SingleModuleState extends State<_SingleModule> {
  late bool _expanded = widget.expanded;

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
                    ...widget.module.modules.map(
                      (m) => _SingleModule(
                        m,
                        expanded: widget.expanded,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
