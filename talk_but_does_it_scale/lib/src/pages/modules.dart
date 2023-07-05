import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_ui/shared_ui.dart';
import 'package:talk_but_does_it_scale/src/images.dart';

class Modules extends StatelessWidget {
  const Modules({super.key});

  @override
  Widget build(BuildContext context) {
    return TitledPage(
      title: const Text('Flutter Structure'),
      child: FutureBuilder<String>(
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
              width: 600,
              height: 700,
              child: Snippet(
                icon: SvgPicture.asset(
                  Images.klar,
                  package: Images.package,
                  height: 25,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimaryContainer,
                    BlendMode.srcIn,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ProjectStructure(
                    module: m,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
