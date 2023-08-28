import 'dart:io';

import 'package:flutter/material.dart';
import 'package:portfolio/core/common/constants/app_colors.dart';
import 'package:portfolio/core/common/extensions/widget_extension.dart';

// ignore: must_be_immutable
class ImageCached extends StatelessWidget {
  const ImageCached({
    super.key,
    required this.width,
    required this.height,
    this.url,
    this.heroTag,
    this.fit,
  });

  final String? url;
  final String? heroTag;
  final double height;
  final double width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (url == null) return _errorWidget();

    return Image.file(
      File(url!),
      height: height,
      width: width,
      errorBuilder: (context, error, stackTrace) => _errorWidget(),
      fit: fit ?? BoxFit.cover,
    ).hero(heroTag);
  }

  Container _errorWidget() => Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: AppColors.brown_500,
        ),
        child: Center(
          child: Icon(
            Icons.person,
            color: AppColors.white.withOpacity(0.7),
            size: width / 2.5,
          ),
        ),
      );
}
