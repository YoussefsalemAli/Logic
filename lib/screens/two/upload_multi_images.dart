import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadMultiImages extends StatefulWidget {
  const UploadMultiImages({super.key});

  @override
  State<UploadMultiImages> createState() => _UploadMultiImagesState();
}

class _UploadMultiImagesState extends State<UploadMultiImages> {
  List<XFile?> selectedImages = [null, null, null];
  Future<void> _uploadMultiImage() async {
    final pickedImage = await ImagePicker().pickMultiImage(limit: 3);
    for (int i = 0; i < 3; i++) {
      selectedImages[i] = i < pickedImage.length ? pickedImage[i] : null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade900,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 140),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(selectedImages.length, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 60),
            GestureDetector(
              onTap: _uploadMultiImage,
              child: Container(
                height: 40,
                width: 180,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Upload-Image',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
