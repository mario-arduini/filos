import 'dart:async';

import 'package:flutter_commons/storage_image.dart';

class FirebaseStorageImageRepository implements StorageImageRepository {
  const FirebaseStorageImageRepository();

  @override
  Future<String> urlForImage(String path, ImageSize imageSize) {
    throw UnimplementedError('TODO implement');
  }
}
