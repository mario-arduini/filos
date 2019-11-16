import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';

enum _Option { fullScreen, sized }

class ZoomImage extends StatelessWidget {
  final _Option _option;

  final ImageProvider imageProvider;

  final double width;

  final double height;

  final Widget placeholder;

  ZoomImage.fullScreen({
    @required this.imageProvider,
    this.placeholder = const Center(child: CircularProgressIndicator()),
  })  : _option = _Option.fullScreen,
        width = double.infinity,
        height = double.infinity;

  ZoomImage.sized({
    @required this.imageProvider,
    this.width = double.infinity,
    this.height = double.infinity,
    this.placeholder = const Center(child: CircularProgressIndicator()),
  }) : _option = _Option.sized;

  @override
  Widget build(BuildContext context) {
    if (_option == _Option.fullScreen) return Container(child: _photoView());
    if (_option == _Option.sized)
      return ClipRect(
        child: Container(
          width: width,
          height: height,
          child: _photoView(),
        ),
      );
    throw UnimplementedError('Unknown option $_option');
  }

  Widget _photoView() => PhotoView(
        imageProvider: imageProvider,
        loadingChild: placeholder,
        minScale: PhotoViewComputedScale.contained,
        scaleStateCycle: (PhotoViewScaleState current) =>
            current == PhotoViewScaleState.initial
                ? PhotoViewScaleState.originalSize
                : PhotoViewScaleState.initial,
      );
}
