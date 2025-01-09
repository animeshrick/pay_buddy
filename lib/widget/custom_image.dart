import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const/color_const.dart';
import '../extension/hex_color.dart';

class CircularProfileImage extends StatelessWidget {
  final String? imageUrl; // URL for network image
  final String? assetImage; // Path for asset image
  final String? initials; // Initials fallback (e.g., "AB")
  final double radius; // Radius of the circle
  final Color borderColor; // Border color
  final double borderWidth; // Border width
  final Color backgroundColor; // Background color for initials

  const CircularProfileImage({
    Key? key,
    this.imageUrl,
    this.assetImage,
    this.initials,
    this.radius = 40.0,
    this.borderColor = Colors.grey,
    this.borderWidth = 2.0,
    this.backgroundColor = Colors.blueGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + borderWidth, // Adjust for border
      backgroundColor: borderColor, // Border color
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        backgroundImage: imageUrl != null
            ? NetworkImage(imageUrl!) // Load network image
            : assetImage != null
                ? AssetImage(assetImage!) as ImageProvider // Load asset image
                : null,
        child: (imageUrl == null && assetImage == null && initials != null)
            ? Text(
                initials!,
                style: TextStyle(
                  fontSize: radius / 2, // Dynamic font size
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            : null, // Fallback to initials
      ),
    );
  }
}

class CustomNetWorkImageView extends StatelessWidget {
  const CustomNetWorkImageView({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.fit = BoxFit.contain, // Default BoxFit value
    this.radius,
    this.color,
    this.errorWidget,
  });

  final String url;
  final double? height;
  final double? width;
  final BoxFit fit;
  final double? radius;
  final Color? color;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0.0),
      child: CachedNetworkImage(
        imageUrl: url,
        width: width != 0.0 ? width : null,
        height: height != 0.0 ? height : null,
        fit: fit,
        color: color,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Container(
            width: width,
            height: height,
            color: Colors.grey.shade50,
          );
        },
        errorWidget: (_, __, ___) {
          return errorWidget ??
              Image.asset(
                "AssetsConst.ssNoImageLogo",
                width: width,
                height: height,
                fit: fit,
              );
        },
        imageBuilder: (context, imageProvider) {
          return Image(
            image: imageProvider,
            width: width,
            height: height,
            fit: fit,
            color: color,
          );
        },
      ),
    );
  }
}

class CustomAssetImageView extends StatelessWidget {
  const CustomAssetImageView(
      {super.key,
      required this.path,
      this.height,
      this.width,
      this.fit,
      this.radius,
      this.color});

  final String path;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0.0),
      child: Image.asset(
        path,
        color: color,
        width: width != 0.0 ? width : null,
        height: height != 0.0 ? height : null,
        fit: fit ?? BoxFit.contain,
        frameBuilder: (BuildContext context, Widget child, int? frame,
            bool? wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded == true) {
            return child;
          } else {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: frame != null
                  ? child
                  : Container(
                      color: Colors.white,
                      height: height,
                      width: width,
                    ),
            );
          }
        },
        errorBuilder: (_, __, ___) {
          return Image.asset(
            "AssetsConst.ssNoImageLogo",
            width: width != 0.0 ? width : null,
            height: height != 0.0 ? height : null,
          );
        },
      ),
    );
  }
}

class CustomSvgAssetImageView extends StatelessWidget {
  const CustomSvgAssetImageView(
      {super.key,
      required this.path,
      this.height,
      this.width,
      this.fit,
      this.radius,
      this.color});

  final String path;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width != 0.0 ? width : null,
      height: height != 0.0 ? height : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0.0),
        child: SvgPicture.asset(
          path,
          width: width != 0.0 ? width : null,
          height: height != 0.0 ? height : null,
          fit: fit ?? BoxFit.contain,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          placeholderBuilder: (BuildContext context) {
            return Container(
              color: HexColor.fromHex(ColorConst.baseHexColor).withOpacity(0.3),
              height: height,
              width: width,
            );
          },
        ),
      ),
    );
  }
}

class CustomSvgNetworkImageView extends StatelessWidget {
  const CustomSvgNetworkImageView(
      {super.key,
      required this.url,
      this.height,
      this.width,
      this.fit,
      this.radius,
      this.color});

  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width != 0.0 ? width : null,
      height: height != 0.0 ? height : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0.0),
        child: SvgPicture.network(
          url,
          width: width != 0.0 ? width : null,
          height: height != 0.0 ? height : null,
          fit: fit ?? BoxFit.contain,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          placeholderBuilder: (BuildContext context) {
            return Container(
              color: HexColor.fromHex(ColorConst.baseHexColor).withOpacity(0.3),
              height: height,
              width: width,
            );
          },
        ),
      ),
    );
  }
}
