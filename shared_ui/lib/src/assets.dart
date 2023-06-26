import 'dart:ui';

class AssetPaths {
  static const package = 'shared_ui';

  static const String orbShader =
      'packages/$package/assets/shaders/orb_shader.frag';
  static const String uiShader =
      'packages/$package/assets/shaders/ui_glitch.frag';
}

typedef FragmentPrograms = ({FragmentProgram orb, FragmentProgram ui});

Future<FragmentPrograms> loadFragmentPrograms() async {
  return (
    orb: (await FragmentProgram.fromAsset(AssetPaths.orbShader)),
    ui: (await FragmentProgram.fromAsset(AssetPaths.uiShader)),
  );
}
