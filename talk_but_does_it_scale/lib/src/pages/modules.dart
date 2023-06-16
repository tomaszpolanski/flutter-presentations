import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:talk_but_does_it_scale/src/data/module.dart';

class Modules extends StatelessWidget {
  const Modules({super.key});

  @override
  Widget build(BuildContext context) {
    const encoder = JsonEncoder.withIndent('  ');
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('packages/talk_but_does_it_scale/assets/modules.json'),
      builder: (context, snapshot) {
        final _json = snapshot.data;
        print('Snapshot ${snapshot.error}');
        if (_json == null) {
          return const SizedBox();
        }
        final m = Module.fromJson(json.decode(_json));
        return Text(
          encoder.convert(m.toJson()),
          style: const TextStyle(fontSize: 8),
        );
      },
    );
  }
}
