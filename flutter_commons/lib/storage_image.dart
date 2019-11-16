import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_commons/_storage_image_default.dart'
    if (dart.library.html) 'package:flutter_commons/_storage_image_web.dart';

abstract class StorageImageRepository {
  Future<String> urlForImage(String path, ImageSize imageSize);
}

enum ImageSize { original, s256, s512, s1024, r256, r512, r1024 }

class StorageImage extends StatelessWidget {
  const StorageImage({
    @required this.path,
    this.imageSize = ImageSize.original,
    this.placeholder = const Center(child: CircularProgressIndicator()),
    this.width = double.infinity,
    this.height = double.infinity,
    this.boxFit,
    Key key,
  }) : super(key: key);

  final String path;

  final ImageSize imageSize;

  final Widget placeholder;

  final double width;

  final double height;

  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) => Image(
        image: StorageImageProvider(
          path: path,
          imageSize: imageSize,
        ),
        width: width,
        height: height,
        fit: boxFit,
      );
}

/// StorageImageProvider loads an image from Firebase Storage.
///
/// This implementation uses composition by delegating [ImageProvider] overrides
/// to a [NetworkImage] object once the resource URL has been resolved.
class StorageImageProvider extends ImageProvider<NetworkImage> {
  StorageImageProvider({
    @required this.path,
    this.imageSize = ImageSize.original,
    this.scale = 1.0,
    this.headers,
  })  : assert(path != null),
        assert(imageSize != null),
        assert(scale != null);

  final String path;

  final ImageSize imageSize;

  final double scale;

  final Map<String, String> headers;

  NetworkImage _delegateProvider;

  final repository = FirebaseStorageImageRepository();

  @override
  Future<NetworkImage> obtainKey(ImageConfiguration configuration) async {
    if (_delegateProvider == null) {
      final url = await repository.urlForImage(path, imageSize);
      _delegateProvider = NetworkImage(url, scale: scale);
    }
    return _delegateProvider.obtainKey(configuration);
  }

  @override
  ImageStreamCompleter load(NetworkImage key, decode) {
    assert(_delegateProvider != null);
    return _delegateProvider.load(key, decode);
  }
}

String prefixFor(ImageSize size) {
  final thumbPrefix = 'thumb';
  final resizePrefix = 'resized';
  if (size == ImageSize.s256) return '${thumbPrefix}_256';
  if (size == ImageSize.s512) return '${thumbPrefix}_512';
  if (size == ImageSize.s1024) return '${thumbPrefix}_1024';
  if (size == ImageSize.r256) return '${resizePrefix}_256';
  if (size == ImageSize.r512) return '${resizePrefix}_512';
  if (size == ImageSize.r1024) return '${resizePrefix}_1024';
  throw UnsupportedError('$size does not have a size');
}

String dirname(String filePath) {
  final lastSlash = filePath.lastIndexOf('/');
  return lastSlash == -1 ? '' : filePath.substring(0, lastSlash);
}

String filename(String filePath) {
  final lastSlash = filePath.lastIndexOf('/');
  return lastSlash == -1 ? filePath : filePath.substring(lastSlash + 1);
}

String pathForSize(String filePath, ImageSize size) {
  if (size == ImageSize.original) return filePath;
  final directory = dirname(filePath);
  final name = filename(filePath);
  return '$directory/${prefixFor(size)}_$name';
}
