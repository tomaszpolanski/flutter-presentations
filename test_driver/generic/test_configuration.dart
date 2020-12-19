import 'package:fast_flutter_driver/tool.dart';

class TestConfiguration implements BaseConfiguration {
  const TestConfiguration({
    required this.resolution,
    this.platform,
  });

  factory TestConfiguration.fromJson(Map<String, dynamic> json) {
    return TestConfiguration(
      resolution: Resolution.fromJson(json['resolution']),
      platform: TestPlatformEx.fromString(json['platform']),
    );
  }
  @override
  final TestPlatform? platform;
  @override
  final Resolution resolution;
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'resolution': resolution,
        if (platform != null) 'platform': platform.asString(),
      };
}
