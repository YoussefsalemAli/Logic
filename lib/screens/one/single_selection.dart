import 'package:flutter/material.dart';

class SingleSelection extends StatefulWidget {
  const SingleSelection({super.key});

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  int? selectedIndex;

  List<Map> giftItems = [
    {"name": "Lion", "image": "assets/animals/lion.png"},
    {"name": "deer", "image": "assets/animals/deer.png"},
    {"name": "cow", "image": "assets/animals/cow.png"},
    {"name": "giraffe", "image": "assets/animals/giraffe.png"},
    {"name": "pingeon", "image": "assets/animals/pingeon.png"},
    {"name": "rat", "image": "assets/animals/rat.png"},
    {"name": "tiger", "image": "assets/animals/tiger.png"},
    {"name": "white-tiger", "image": "assets/animals/white-tiger.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 40,
            crossAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: giftItems.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => setState(() {
              selectedIndex = index;
            }),
            child: Stack(
              children: [
                selectedIndex == index
                    ? Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: AlignmentGeometry.topCenter,
                              end: AlignmentGeometry.bottomCenter,
                              colors: [
                                Colors.black12,
                                Colors.black26,
                                Colors.black12,
                              ],
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                Column(
                  children: [
                    Image.asset(
                      width: 300,
                      height: selectedIndex == index ? 120 : 100,
                      giftItems[index]["image"],
                    ),
                    SizedBox(height: 3),
                    selectedIndex == index
                        ? SizedBox.shrink()
                        : Text(
                            "${giftItems[index]['name']}".toUpperCase(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                  ],
                ),
                selectedIndex == index
                    ? Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
