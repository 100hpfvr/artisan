import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModel extends StatelessWidget {
  ImageSourceModel(this.onImageSelected);

  final Function(File) onImageSelected;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FlatButton(
                    onPressed: getFromCamera, child: const Text("Câmera")),
                FlatButton(
                    onPressed: getFromGallery, child: const Text("Galeria"))
              ],
            ));
  }

  Future<void> getFromCamera() async {
    final pickedFile = await ImagePicker().getImage(
        source: ImageSource.camera); // expressão da tipologia do imagepicker
    if (pickedFile == null) return;
    final image = // arquivo de fato
        imageSelected(File(pickedFile.path));
  }

  Future<void> getFromGallery() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    final image = imageSelected(File(pickedFile.path));
  }

  Future<void> imageSelected(File image) async {
    final croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: "Editar Imagem",
          toolbarColor: Colors.orange,
          toolbarWidgetColor: Colors.white),
    );
    if (croppedFile != null)
    onImageSelected(croppedFile);
  }
}
