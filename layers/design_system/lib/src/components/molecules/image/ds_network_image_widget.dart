import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/src/components/molecules/loading/loading.dart';
import 'package:design_system/src/components/atoms/atoms.dart';

abstract class DSNetworkLoading {
  Widget get loadingWidget;
}

class DSNetworkImageWidget extends StatelessWidget {
  const DSNetworkImageWidget(
    this.url, {
    required this.height,
    required this.weight,
    this.boxFit = BoxFit.cover,
    this.loading,
    super.key,
  });

  final String url;
  final double height;
  final double weight;
  final BoxFit boxFit;
  final DSNetworkLoading? loading;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: boxFit,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return (loading ?? _Loading(height, weight)).loadingWidget;
      },
      errorWidget: (context, url, error) => FittedBox(
        child: Center(child: DSErrorIconWidget(height: height, width: weight)),
      ),
    );
  }
}

class _Loading implements DSNetworkLoading {
  _Loading(this.height, this.width);

  final double height;
  final double width;

  @override
  Widget get loadingWidget {
    return Center(
      child: DSLoadingWidget(width: width, height: height),
    );
  }
}
