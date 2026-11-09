import 'dart:io';

import 'package:image/image.dart';

void main() async {
  final posterDir = Directory('assets/images');
  if (!await posterDir.exists()) {
    await posterDir.create(recursive: true);
  }

  await _writeFile(
    'assets/images/the_last_ember.png',
    _buildPoster(
      baseColor: ColorRgba8(24, 33, 58, 255),
      accent: ColorRgba8(97, 196, 224, 255),
      highlight: ColorRgba8(255, 188, 72, 255),
      stripe: ColorRgba8(16, 18, 28, 255),
    ),
  );

  await _writeFile(
    'assets/images/neon_harbor.png',
    _buildPoster(
      baseColor: ColorRgba8(9, 15, 28, 255),
      accent: ColorRgba8(59, 166, 255, 255),
      highlight: ColorRgba8(255, 105, 180, 255),
      stripe: ColorRgba8(18, 25, 38, 255),
    ),
  );
}

Future<void> _writeFile(String path, Image image) async {
  final file = File(path);
  await file.writeAsBytes(encodePng(image));
}

Image _buildPoster({
  required ColorRgba8 baseColor,
  required ColorRgba8 accent,
  required ColorRgba8 highlight,
  required ColorRgba8 stripe,
}) {
  final image = Image(width: 720, height: 960);
  fill(image, color: baseColor);

  for (var y = 0; y < image.height; y++) {
    final intensity = (y / image.height * 80).round();
    final color = ColorRgba8(
      (baseColor.r + intensity).clamp(0, 255).toInt(),
      (baseColor.g + intensity).clamp(0, 255).toInt(),
      (baseColor.b + intensity).clamp(0, 255).toInt(),
      255,
    );
    fillRect(
      image,
      x1: 0,
      y1: y,
      x2: image.width,
      y2: y + 1,
      color: color,
    );
  }

  for (var index = 0; index < 9; index++) {
    final x = 55 + index * 65;
    final width = 42;
    final height = (index % 2 == 0) ? 320 : 460;
    fillRect(
      image,
      x1: x,
      y1: 100,
      x2: x + width,
      y2: 100 + height,
      color: stripe,
    );
    fillRect(
      image,
      x1: x + 12,
      y1: 100,
      x2: x + width - 12,
      y2: 100 + height,
      color: accent,
    );
  }

  fillRect(
    image,
    x1: 0,
    y1: 620,
    x2: image.width,
    y2: 960,
    color: stripe,
  );
  drawRect(
    image,
    x1: 110,
    y1: 100,
    x2: 610,
    y2: 820,
    color: highlight,
    thickness: 12,
  );
  drawCircle(image, x: 360, y: 420, radius: 170, color: highlight);
  drawCircle(image, x: 360, y: 420, radius: 110, color: accent);
  fillRect(
    image,
    x1: 160,
    y1: 760,
    x2: 560,
    y2: 830,
    color: accent,
  );
  fillRect(
    image,
    x1: 175,
    y1: 770,
    x2: 545,
    y2: 820,
    color: highlight,
  );

  return image;
}
