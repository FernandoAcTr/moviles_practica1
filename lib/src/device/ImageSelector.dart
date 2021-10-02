import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ImageSelector {
  Future<File?> _getPicture({required ImageSource source}) async {
    final _image = await ImagePicker().pickImage(
      source: source,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (_image != null) {
      //get new image path
      Directory? directory = await getExternalStorageDirectory();
      String fileName = path.basename(_image.path);
      String imagePath = path.join(directory!.path, fileName);
      //save image
      await _image.saveTo(imagePath);
      return File(imagePath);
    }
  }

  Future<File?> showSelectionDialog(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: new Wrap(
            children: [
              new ListTile(
                  leading: new Icon(Icons.photo_library),
                  title: new Text('Galería'),
                  onTap: () async {
                    final file = await _getPicture(source: ImageSource.gallery);
                    Navigator.of(context).pop(file);
                  }),
              new ListTile(
                leading: new Icon(Icons.photo_camera),
                title: new Text('Cámara'),
                onTap: () async {
                  final file = await _getPicture(source: ImageSource.camera);
                  Navigator.of(context).pop(file);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
