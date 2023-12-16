import 'package:appdev/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:appdev/models/news%20app/screens/general_screen.dart';
import 'package:appdev/models/news%20app/screens/health_screen.dart';
import 'package:appdev/models/news%20app/screens/science_screen.dart';
import 'package:appdev/models/news%20app/screens/technology_screen.dart';
import 'package:appdev/models/news%20app/screens/top_headlines_screen.dart';
import 'package:appdev/pages/more/more_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 2:
        // Handle Call page navigation
        break;
      case 3:
        // Handle Notifications page navigation
        break;
      case 4:
        // Handle More page navigation
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MoreScreen()),
        );
        break;
    }
  }

  void popUpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Popup Dialog"),
          content: Text("This is a popup dialog."),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "CampusCraftors",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Color.fromARGB(255, 11, 173, 242),
            ),
            isScrollable: true,
            tabs: const [
              Tab(text: "General"),
              Tab(text: "Health"),
              Tab(text: "Technology"),
              Tab(text: "Science"),
              Tab(text: "Top headlines"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GeneralScreen(),
            HealthScreen(),
            TechnologyScreen(),
            ScienceScreen(),
            TopHeadlinesScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            popUpDialog(context);
          },
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: Color.fromARGB(255, 13, 200, 225),
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              navigateToPage(index);
              // Placeholder onPressed actions
              switch (index) {
                case 0:
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  break;
                case 1:
                  // TODO: Add logic for Blog onPressed
                  break;
                case 4:
                  // TODO: Add logic for More onPressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MoreScreen()),
                  );
                  break;
              }
            });
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
        ),
      ),
    );
  }
}
