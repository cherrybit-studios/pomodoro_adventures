import 'package:flutter/material.dart';

class SpriteImage extends StatelessWidget {
  const SpriteImage({
    required this.url,
    required this.src,
    super.key,
  });

  final String url;
  final Rect src;

  @override
  Widget build(BuildContext context) {
    return _ImageLoader(
      imageProvider: AssetImage(url),
      src: src,
    );
  }
}

class _ImageLoader extends StatefulWidget {
  const _ImageLoader({
    required this.imageProvider,
    required this.src,
  });

  final Rect src;

  final ImageProvider imageProvider;

  @override
  State<_ImageLoader> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<_ImageLoader> {
  ImageStream? _imageStream;
  ImageInfo? _imageInfo;
  final _paint = Paint()..color = Colors.white;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getImage();
  }

  @override
  void didUpdateWidget(_ImageLoader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageProvider != oldWidget.imageProvider) {
      _getImage();
    }
  }

  void _getImage() {
    final oldImageStream = _imageStream;
    _imageStream =
        widget.imageProvider.resolve(createLocalImageConfiguration(context));
    if (_imageStream!.key != oldImageStream?.key) {
      final listener = ImageStreamListener(_updateImage);
      oldImageStream?.removeListener(listener);
      _imageStream!.addListener(listener);
    }
  }

  void _updateImage(ImageInfo imageInfo, bool synchronousCall) {
    setState(() {
      // Trigger a build whenever the image changes.
      _imageInfo?.dispose();
      _imageInfo = imageInfo;
    });
  }

  @override
  void dispose() {
    _imageStream?.removeListener(ImageStreamListener(_updateImage));
    _imageInfo?.dispose();
    _imageInfo = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_imageInfo == null) {
      return const SizedBox();
    }

    return CustomPaint(
      painter: _SpritePainter(
        _imageInfo!,
        _paint,
        widget.src,
      ),
    );
  }
}

class _SpritePainter extends CustomPainter {
  _SpritePainter(this.imageInfo, this._paint, this.src);

  final ImageInfo imageInfo;
  final Paint _paint;
  final Rect src;

  @override
  void paint(Canvas canvas, Size size) {
    //canvas.drawRect(
    //  Rect.fromLTWH(0, 0, src.width, src.height),
    //  Paint()
    //  ..color = Colors.red
    //  ..style = PaintingStyle.fill,
    //  );
    canvas.drawImageRect(
      imageInfo.image,
      src,
      Rect.fromLTWH(0, 0, src.width, src.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
