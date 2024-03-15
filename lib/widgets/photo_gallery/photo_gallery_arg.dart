import 'dart:io';

class PhotoGalleryArg {
  final List<File> imagePaths;
  final int index;

  const PhotoGalleryArg({
    required this.imagePaths,
    required this.index,
  });
}
