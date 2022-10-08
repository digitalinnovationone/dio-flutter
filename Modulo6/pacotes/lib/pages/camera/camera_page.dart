import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  XFile? photo;

  cropImage(XFile imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      await GallerySaver.saveImage(croppedFile.path);
      photo = XFile(croppedFile.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return Wrap(
                        children: [
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.camera),
                            title: Text("Camera"),
                            onTap: () async {
                              final ImagePicker _picker = ImagePicker();
                              photo = await _picker.pickImage(
                                  source: ImageSource.camera);
                              if (photo != null) {
                                String path = (await path_provider
                                        .getApplicationDocumentsDirectory())
                                    .path;
                                String name = basename(photo!.path);
                                await photo!.saveTo("$path/$name");

                                await GallerySaver.saveImage(photo!.path);
                                Navigator.pop(context);

                                cropImage(photo!);
                              }
                            },
                          ),
                          ListTile(
                              leading: FaIcon(FontAwesomeIcons.images),
                              title: Text("Galeria"),
                              onTap: () async {
                                final ImagePicker _picker = ImagePicker();
                                photo = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                Navigator.pop(context);

                                cropImage(photo!);
                              })
                        ],
                      );
                    });
              },
              child: Text("Camera")),
          photo != null
              ? Container(
                  child: Image.file(File(photo!.path)),
                )
              : Container()
        ],
      ),
      appBar: AppBar(
        title: Text("Camera"),
      ),
    ));
  }
}
