import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/image_picker_controller.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  final files = await imagePickerController.pickImage(
                      source: ImageSource.gallery);
                  if (files.isNotEmpty) {
                    final croppedFile = await imagePickerController.crop(
                      file: files.first,
                      cropStyle: CropStyle.rectangle,
                    );
                    if (croppedFile != null) {
                      imagePickerController.selectedImagePath.value =
                          croppedFile.path;
                    }
                  }
                },
                child: Container(
                    color: const Color(0xFFEFEFEF),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Obx(() {
                      return imagePickerController.selectedImagePath.value == ''
                          ? const Icon(CupertinoIcons.photo_on_rectangle)
                          : Image.file(File(
                              imagePickerController.selectedImagePath.value));
                    })),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEFEF),
                    border: Border.all(
                      width: 1,
                      color: const Color(0xFFACACAC),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      labelText: 'Captions',
                      labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFACACAC),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFF7737FF),
                    ),
                    child: const Text(
                      'Post',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
