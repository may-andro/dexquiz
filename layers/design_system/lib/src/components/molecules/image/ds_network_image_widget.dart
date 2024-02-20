import 'package:design_system/src/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/src/components/molecules/loading/loading.dart';
import 'package:design_system/src/components/atoms/atoms.dart';

class DSNetworkImageWidget extends StatelessWidget {
  const DSNetworkImageWidget(
    this.url, {
    this.sizeFactor = 0.2,
    this.boxFit = BoxFit.cover,
    this.loadingError,
    this.loadingProgress,
    super.key,
  });

  final String url;
  final double sizeFactor;
  final BoxFit boxFit;
  final Widget? loadingError;
  final Widget? loadingProgress;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: boxFit,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Center(
          child: SizedBox(
            width: context.shortestSide * sizeFactor,
            height: context.shortestSide * sizeFactor,
            child: loadingError ?? const DSLoadingWidget(),
          ),
        );
      },
      errorWidget: (context, url, error) => FittedBox(
        child: Center(
          child: SizedBox(
            height: context.shortestSide * sizeFactor,
            width: context.shortestSide * sizeFactor,
            child: const DSErrorIconWidget(),
          ),
        ),
      ),
    );
  }
}
