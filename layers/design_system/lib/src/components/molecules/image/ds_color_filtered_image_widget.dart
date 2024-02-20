import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DSColorFilteredImageWidget extends StatelessWidget {
  const DSColorFilteredImageWidget({
    required this.imageUrl,
    this.filterColor = Colors.transparent,
    this.blendMode = BlendMode.saturation,
    this.boxFit = BoxFit.cover,
    this.sizeFactor = 0.2,
    super.key,
  });

  final Color filterColor;
  final BlendMode blendMode;
  final String imageUrl;
  final BoxFit boxFit;
  final double sizeFactor;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(filterColor, blendMode),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: boxFit,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Center(
            child: DSLoadingWidget(
              height: context.shortestSide * sizeFactor,
              width: context.shortestSide * sizeFactor,
            ),
          );
        },
        errorWidget: (context, url, error) => FittedBox(
          child: Center(
            child: DSErrorIconWidget(
              height: context.shortestSide * sizeFactor,
              width: context.shortestSide * sizeFactor,
            ),
          ),
        ),
      ),
    );
  }
}
