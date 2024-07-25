import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final Widget? placeHolder, errorWidget;
  final double? width, height;
  final BoxFit? fit;

  const CustomNetworkImage(
      {super.key,
      required this.imageUrl,
      this.placeHolder,
      this.errorWidget,
      this.width,
      this.height,
      this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => placeHolder ?? const SizedBox(),
      errorWidget: (context, url, error) => errorWidget ?? const SizedBox(),
      width: width,
      height: height,
      fit: fit,
    );
  }
}
