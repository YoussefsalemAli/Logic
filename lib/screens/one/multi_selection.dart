import 'package:flutter/material.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection({super.key});

  @override
  State<MultiSelection> createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  List<String> types = [
    'Sports highlights',
    'Live matches',
    'Breaking news',
    'Technology updates',
    'Entertainment news',
    'Funny videos',
    'Motivational content',
    'Educational threads',
    'Gaming content',
  ];
  // 'Music updates',
  // 'Movie trailers',
  // 'Celebrity news',
  // 'Startup stories',
  // 'Programming tips',
  // 'Design inspiration',
  // 'Fitness tips',
  // 'Health advice',
  // 'Travel experiences',
  // 'Photography',
  // 'Memes',
  Set<String> selectedTypes = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              'What do you want to see on X?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Wrap(
              spacing: 15,
              runSpacing: 10,
              children: List.generate(types.length, (index) {
                final type = types[index];
                final isSelected = selectedTypes.contains(type);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      !isSelected
                          ? selectedTypes.add(type)
                          : selectedTypes.remove(type);
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 5),
                    curve: Curves.easeIn,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      type,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 50),
            // Column(
            //   children: List.generate(selectedTypes.length, (index) {
            //     final type = selectedTypes[index];
            //     return Container(
            //       decoration: BoxDecoration(
            //         border: Border.all(color: Colors.white, width: 2),
            //         color: Colors.blue.shade900,
            //         borderRadius: BorderRadius.circular(5),
            //       ),
            //       margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //       child: Text(
            //         type,
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     );
            //   }),
            // ),
            Center(
              child: Column(
                spacing: 10,
                children: selectedTypes
                    .map(
                      (e) => Text(
                        e,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
