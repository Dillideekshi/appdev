import 'package:appdev/models/news%20app/screens/home_screen.dart';
import 'package:appdev/pages/home_page.dart';
import 'package:appdev/pages/more/more_screen.dart';
import 'package:flutter/material.dart';

class YourWidgetName extends StatefulWidget {
  @override
  _YourWidgetNameState createState() => _YourWidgetNameState();
}

class _YourWidgetNameState extends State<YourWidgetName> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Title'),

      ),
      body: Center(
        child: Text('Your Content Goes Here'),
      ),
      bottomNavigationBar: BottomNavBar(index: _currentIndex),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      selectedItemColor: Color.fromARGB(255, 13, 200, 225),
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MoreScreen()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()), 
          );
        }
        else if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()), 
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          label: 'Blog',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone),
          label: 'Call',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'More',
        ),
      ],
    );
  }
}

