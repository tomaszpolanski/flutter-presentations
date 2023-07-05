import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatelessWidget {
  const QrCode(this.data, {this.color, super.key});

  final Uri data;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final _color = color ?? Theme.of(context).colorScheme.onBackground;
    return QrImageView(
      data: data.toString(),
      size: 400.0,
      eyeStyle: QrEyeStyle(
        eyeShape: QrEyeShape.circle,
        color: _color,
      ),
      dataModuleStyle: QrDataModuleStyle(
        dataModuleShape: QrDataModuleShape.circle,
        color: _color,
      ),
    );
  }
}
