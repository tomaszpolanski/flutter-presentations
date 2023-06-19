import 'dart:convert';

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
                child: ProjectStructure(
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
