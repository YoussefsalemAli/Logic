import 'package:flutter/material.dart';

class ImageSelection extends StatefulWidget {
  const ImageSelection({super.key});

  @override
  State<ImageSelection> createState() => _ImageSelectionState();
}

class _ImageSelectionState extends State<ImageSelection> {
  int selectedIndex = 0;
  List<String> labtop = [
    'assets/laptop/labtop1.png',
    'assets/laptop/labtop2.png',
    'assets/laptop/labtop3.png',
    'assets/laptop/labtop4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 253, 236, 0),
      body: Column(
        children: [
          SizedBox(height: 80),
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.asset(labtop[selectedIndex], fit: BoxFit.cover),
          ),
          SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                labtop.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.black
                            : Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    height: 150,
                    width: 130,
                    child: Image.asset(labtop[index], fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
