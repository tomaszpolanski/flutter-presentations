import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:shared_pages/shared_pages.dart';
import 'package:shared_ui/shared_ui.dart';
import 'package:talk_but_does_it_scale/src/assets.dart';

class OldAndroid extends StatefulWidget {
  const OldAndroid(
    this.controller, {
    super.key,
  });

  final PresentationController controller;

  @override
  State<OldAndroid> createState() => _OldAndroidState();
}

enum _Step { init, oldStructure, newStructure, next }

class _OldAndroidState extends State<OldAndroid>
    with SingleTickerProviderStateMixin {
  late PageStepper<_Step> _stateController;
  bool _showOld = false;
  bool _showNew = false;

  @override
  void initState() {
    super.initState();
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.oldStructure,
        forward: () => setState(() {
          _showOld = true;
        }),
        reverse: () => setState(() {
          _showOld = false;
        }),
      )
      ..add(
        fromStep: _Step.oldStructure,
        toStep: _Step.newStructure,
        forward: () => setState(() {
          _showNew = true;
        }),
        reverse: () => setState(() {
          _showNew = false;
        }),
      )
      ..add(
        fromStep: _Step.newStructure,
        toStep: _Step.next,
        forward: widget.controller.nextSlide,
      )
      ..build();
  }

  @override
  void dispose() {
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TitledPage(
      title: const Text('Structure'),
      child: FutureBuilder<List<String>>(
        future: Future.wait(
          [
            Assets.oldAndroid,
            Assets.newAndroid,
          ].map((p) => DefaultAssetBundle.of(context).loadString(p)),
        ),
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
              FadeInVisibility(
                visible: _showOld,
                child: SizedBox(
                  width: 500,
                  height: 350,
                  child: Snippet(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ProjectStructure(
                        expanded: true,
                        module: oldAndroid,
                      ),
                    ),
                  ),
                ),
              ),
              FadeInVisibility(
                visible: _showNew,
                child: SizedBox(
                  width: 500,
                  height: 350,
                  child: Snippet(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ProjectStructure(
                        expanded: true,
                        module: newAndroid,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
