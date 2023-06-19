import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_ui/shared_ui.dart';

class OldAndroid extends StatelessWidget {
  const OldAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: Future.wait([
        DefaultAssetBundle.of(context).loadString(
            'packages/talk_but_does_it_scale/assets/old_android.json'),
        DefaultAssetBundle.of(context).loadString(
            'packages/talk_but_does_it_scale/assets/new_android.json')
      ]),
      builder: (context, snapshot) {
        final _jsons = snapshot.data;
        if (_jsons == null) {
          return const SizedBox();
        }
        final oldAndroid = Module.fromJson(json.decode(_jsons[0]));
        final newAndroid = Module.fromJson(json.decode(_jsons[1]));
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 500,
              height: 300,
              child: Snippet(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ProjectStructure(
                    modules: oldAndroid.modules,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 500,
              height: 300,
              child: Snippet(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ProjectStructure(
                    modules: newAndroid.modules,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
