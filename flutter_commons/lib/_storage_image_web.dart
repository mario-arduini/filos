import 'dart:async';

import 'package:firebase/firebase.dart' as fb;
import 'package:flutter_commons/storage_image.dart';

class FirebaseStorageImageRepository implements StorageImageRepository {
  const FirebaseStorageImageRepository();

  fb.Storage get storage => fb.storage();

  @override
  Future<String> urlForImage(String path, ImageSize size) async {
    final sizedPath = pathForSize(path, size);
    final uri = await storage.ref(sizedPath).getDownloadURL();
    return uri.toString();
  }
}
