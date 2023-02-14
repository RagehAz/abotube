import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:filers/filers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stringer/stringer.dart';

class GalleryProtocols {
  // -----------------------------------------------------------------------------

  const GalleryProtocols();

  // -----------------------------------------------------------------------------

  /// PICKING

  // --------------------
  static Future<File> pickGalleryVideo() async {

    /// TASK : NEED TO BE SINGLETON
    final ImagePicker _picker = ImagePicker();

    final XFile image = await _picker.pickVideo(
      source: ImageSource.gallery,
      // maxDuration:,
      // preferredCameraDevice: ,
    );

    if (image == null) {
      return null;
    }
    else {
      return File(image.path);
    }

  }
  // -----------------------------------------------------------------------------

  /// CHECKERS

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<bool> doesFileExistInGallery(String fileName) async {
    bool exists = false;

    blog('fileName: ($fileName)');

    if (TextCheck.isEmpty(fileName) == false) {

      // final List<String> path = await ExternalPath.getExternalStorageDirectories();

      // Stringer.blogStrings(strings: path, invoker: 'doesFileExistInGallery');

      final String gallery = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOWNLOADS,
      );

      // blog('gallery: ($gallery)');
      // final Directory directory = await getExternalStorageDirectory();

      final String filePath = '$gallery/$fileName';
      final File file = File(filePath);
      exists = await file.exists();

      blog('file: ($file)');
      blog('exists : $exists');
    }

    return exists;
  }
  // -----------------------------------------------------------------------------
}
