import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Represents an image source.
sealed class ImageSource {
  const ImageSource(this.path);

  /// The path of the image source.
  final String path;

  /// Creates an Image widget from the source
  Widget toImage({double? width, double? height, BoxFit? fit});
}

/// Represents an image source from an asset
final class AssetImageSource extends ImageSource {
  /// Creates an image source from an asset
  const AssetImageSource(super.path);

  /// Creates an Image widget from the asset
  @override
  Widget toImage({double? width, double? height, BoxFit? fit}) {
    return Image.asset(path, width: width, height: height, fit: fit);
  }
}

/// Represents an image source from a network
final class NetworkImageSource extends ImageSource {
  /// Creates an image source from a network
  const NetworkImageSource(super.path);

  /// Creates an Image widget from the network source
  @override
  Widget toImage({double? width, double? height, BoxFit? fit}) {
    return Image.network(path, width: width, height: height, fit: fit);
  }
}

/// Represents an image source from an SVG asset
final class SvgAssetSource extends ImageSource {
  /// Creates an image source from an SVG asset
  const SvgAssetSource(super.path);

  @override
  Widget toImage({double? width, double? height, BoxFit? fit}) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}

/// Represents an image source from an SVG network
final class SvgNetworkSource extends ImageSource {
  /// Creates an image source from an SVG network
  const SvgNetworkSource(super.path);

  @override
  Widget toImage({double? width, double? height, BoxFit? fit}) {
    return SvgPicture.network(
      path,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}
