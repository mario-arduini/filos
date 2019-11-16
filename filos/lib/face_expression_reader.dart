import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';

bool isDetecting = false;

Future<CameraDescription> getFrontCamera() async{
  return await availableCameras().then((cameras)=> cameras.firstWhere(
      (camera)=> camera.lensDirection == CameraLensDirection.front));
}

void cameraBytesToDetector({
 @required CameraController camera,
 @required FaceDetector detector,
 @required void updateFace(Face face),
}){
  camera.startImageStream((image) {
     if(isDetecting) return;

     isDetecting = true;

     detector.processImage(FirebaseVisionImage.fromBytes(image.planes[0].bytes, FirebaseVisionImageMetadata(
       size: camera.value.previewSize,
       rotation: ImageRotation.rotation270,
       planeData: []
     )))
     .then((faces){
      updateFace(faces.isEmpty ? null : faces[0]);
      isDetecting = false;
     });
  });
}

class FaceExpressionReader extends ValueNotifier<Face> {
  FaceExpressionReader() : super(null){
    init();
  }

  CameraController camera;
  FaceDetector detector;

  void init() async{
    camera = CameraController(await getFrontCamera(), ResolutionPreset.low);
    await camera.initialize();

    detector = FirebaseVision.instance.faceDetector(FaceDetectorOptions(
      enableClassification: true,
      mode: FaceDetectorMode.accurate,
    ));

    cameraBytesToDetector(
      camera:camera,
      detector:detector,
      updateFace: (face){
        value = face;
      },
    );

  }
}

