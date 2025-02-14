import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ImagePicker picker = ImagePicker();
  XFile? image;

  pickImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Scan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            image != null
                ? SizedBox(
                    width: 200,
                    child: Image.file(File(image!.path), fit: BoxFit.fitWidth))
                : Container(),
            ElevatedButton(onPressed: pickImage, child: Text("Upload Image")),
          ],
        ),
      ),
    );
  }
}
