import 'dart:io';

import 'package:middle_east_haraje/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;
  final picker = ImagePicker();
  bool isUploading = false;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _image != null
          ? isUploading
              ? 150
              : 420
          : true
              ? 320
              : 320,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          (_image != null)
              ? SizedBox(
                  height: isUploading ? 100 : 300,
                  child: isUploading
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: secondaryColor,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                                'Uploading your image to the database ...')
                          ],
                        )
                      : Image.file(_image!),
                )
              : Icon(
                      CupertinoIcons.photo_on_rectangle,
                      size: 200,
                      color: disabledColor,
                    ),
          const SizedBox(
            height: 20,
          ),
          (_image == null)
              ? Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: getImage,
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20)),
                                backgroundColor:
                                    MaterialStateProperty.all(secondaryColor)),
                            child: const Text('Select Image')),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
              : (isUploading)
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isUploading = true;
                                });
                              },
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20)),
                                  backgroundColor:
                                      MaterialStateProperty.all(blackColor)),
                              child: const Text('Upload Image')),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _image = null;
                                  });
                                },
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20)),
                                    backgroundColor:
                                        MaterialStateProperty.all(blackColor)),
                                child: const Text('Cancel')))
                      ],
                    ),
        ],
      ),
    );
  }
}
