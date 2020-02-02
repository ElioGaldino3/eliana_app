import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  final Function(File) onImageSelected;

  ImageSourceSheet({this.onImageSelected});

  void imageSelected(File file) async {
    if (file != null) {
      File croppedImage = await ImageCropper.cropImage(
          sourcePath: file.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
      onImageSelected(croppedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FlatButton(
            child: Text("Câmera"),
            onPressed: () async {
              File image =
                  await ImagePicker.pickImage(source: ImageSource.camera);
              imageSelected(image);
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text("Galeria"),
            onPressed: () async {
              File image =
                  await ImagePicker.pickImage(source: ImageSource.gallery);
              imageSelected(image);
              Navigator.pop(context);
            },
          )
        ],
      ),
      onClosing: () {
      },
    );
  }
}
