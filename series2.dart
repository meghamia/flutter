import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return secondpage1();
  }
}

class secondpage1 extends StatefulWidget {
  const secondpage1({Key? key});

  @override
  State<secondpage1> createState() => _secondpage1State();
}

class _secondpage1State extends State<secondpage1> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Example'),
      ),
      body: Center(
        child: Text(
          'Page $_currentIndex',
          style: TextStyle(fontSize: 8), // Decrease the text size even more
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: GNav(
                backgroundColor: Colors.blueGrey,
                tabs: [
                  GButton(
                    text: 'Home',
                    icon: Icons.home,
                    iconSize: 12, // Adjust the icon size
                  ),
                  GButton(
                    text: 'Favorite',
                    icon: Icons.favorite,
                    iconSize: 14, // Adjust the icon size
                  ),
                  GButton(
                    text: 'Profile',
                    icon: Icons.person,
                    iconSize: 14, // Adjust the icon size
                  ),
                ],
                selectedIndex: _currentIndex,
                onTabChange: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                haptic: true,
                tabBorderRadius: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}