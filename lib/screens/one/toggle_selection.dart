import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSelection extends StatefulWidget {
  const ToggleSelection({super.key});

  @override
  State<ToggleSelection> createState() => _ToggleSelectionState();
}

class _ToggleSelectionState extends State<ToggleSelection> {
  bool isFollow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/pfp.png'),
                  radius: 150,
                ),
                Positioned(
                  bottom: -25,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFollow = !isFollow;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xfffede0ff),
                      radius: 25,
                      child: Icon(
                        isFollow
                            ? CupertinoIcons.check_mark
                            : CupertinoIcons.add,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            AnimatedContainer(
              duration: Duration(seconds: 5),
              decoration: BoxDecoration(
                color: Color(0xfffede0ff),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isFollow ? CupertinoIcons.check_mark : CupertinoIcons.add,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(width: 10),
                  Text(
                    isFollow ? 'Done' : 'Follow',
                    style: TextStyle(color: Colors.deepPurple, fontSize: 25),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
