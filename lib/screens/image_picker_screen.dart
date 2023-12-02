import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media/controllers/image_picker_controller.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(CupertinoIcons.back),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Post'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.black12,
                alignment: Alignment.center,
                width: double.infinity,
                child: Obx(
                  () => imagePickerController.selectedImagePath.value == ''
                      ? const Icon(CupertinoIcons.photo_on_rectangle)
                      : Image.file(
                          File(imagePickerController.selectedImagePath.value)),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () async {
                              final files = await imagePickerController
                                  .pickImage(source: ImageSource.gallery);

                              if (files.isNotEmpty) {
                                final croppedFile =
                                    await imagePickerController.crop(
                                  file: files.first,
                                  cropStyle: CropStyle.rectangle,
                                );

                                if (croppedFile != null) {
                                  imagePickerController.selectedImagePath
                                      .value = croppedFile.path;
                                }
                              }
                            },
                            child: Container(
                              width: 140,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF7737FF),
                                border: Border.all(
                                  width: 2,
                                  color: const Color(0xFF7737FF),
                                ),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: const Text(
                                'Gallery',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: () async {
                              final files = await imagePickerController
                                  .pickImage(source: ImageSource.camera);

                              if (files.isNotEmpty) {
                                final croppedFile =
                                    await imagePickerController.crop(
                                  file: files.first,
                                  cropStyle: CropStyle.rectangle,
                                );

                                if (croppedFile != null) {
                                  imagePickerController.selectedImagePath
                                      .value = croppedFile.path;
                                }
                              }
                            },
                            child: Container(
                              width: 140,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF7737FF),
                                border: Border.all(
                                  width: 2,
                                  color: const Color(0xFF7737FF),
                                ),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: const Text(
                                'Camera',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: TextField(
                        decoration: InputDecoration(
                          label: Text('Description'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
