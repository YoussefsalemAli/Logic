import 'package:flutter/material.dart';
import 'package:logic/screens/one/image_selection.dart';
import 'package:logic/screens/one/multi_selection.dart';
import 'package:logic/screens/one/single_selection.dart';
import 'package:logic/screens/one/toggle_selection.dart';
import 'package:logic/screens/two/upload_file.dart';
import 'package:logic/screens/two/upload_image.dart';
import 'package:logic/screens/two/upload_multi_images.dart';
import 'package:logic/screens/two/upload_video.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  PageController pageController = PageController();
  List<Widget> screens = [
    SingleSelection(),
    ImageSelection(),
    ToggleSelection(),
    MultiSelection(),
    UploadImage(),
    UploadMultiImages(),
    UploadVideo(),
    UploadFile(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        children: screens,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.jumpToPage(selectedIndex - 1);
                    });
                  },
                  child: Row(
                    children: [Icon(Icons.arrow_back, color: Colors.black)],
                  ),
                ),
              ),
            ),
            SizedBox(width: 15),
            Container(
              height: 40,

              decoration: BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      pageController.jumpToPage(selectedIndex + 1);
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'Next Page',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ],
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
