import 'package:appdev/models/news%20app/screens/home_screen.dart';
import 'package:appdev/pages/home_page.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildOption(context, Icons.star, 'My Achievements', const MyAchievementsScreen()),
          _buildOption(context, Icons.message, 'Messages', const MessagesScreen()),
          _buildOption(context, Icons.settings, 'Settings', const SettingsScreen()),
          const Divider(),
          _buildOption(context, Icons.article, 'Blog', const BlogScreen()),
          _buildOption(context, Icons.event, 'Activity', const ActivityScreen()),
          const Divider(),
          _buildOption(context, Icons.video_library, 'Promo Videos', const PromoVideosScreen()),
          _buildOption(context, Icons.help, 'Help', const HelpScreen()),
          const Divider(),
          _buildOption(context, Icons.description, 'Terms of Service', const TermsOfServiceScreen()),
          _buildOption(context, Icons.privacy_tip, 'Privacy Policy', const PrivacyPolicyScreen()),
        ],
      ),
      bottomNavigationBar: BottomNavBar(index: 0),
    );
  }

  Widget _buildOption(BuildContext context, IconData icon, String label, Widget page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}

class MyAchievementsScreen extends StatelessWidget {
  const MyAchievementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Achievements'),
      ),
      body: const Center(
        child: Text(
          'Congratulations! You have achieved great things.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: const Center(
        child: Text(
          'Your Messages will appear here.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text(
          'Adjust your settings here.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
      ),
      body: const Center(
        child: Text(
          'Explore interesting blog posts in the community.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body: const Center(
        child: Text(
          'Your recent activity in the community.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class PromoVideosScreen extends StatelessWidget {
  const PromoVideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promo Videos'),
      ),
      body: const Center(
        child: Text(
          'Watch exciting promo videos in the Videos section.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: const Center(
        child: Text(
          'Need help? Find it in the Others section.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
      ),
      body: const Center(
        child: Text(
          'Read our terms of service in the Others section.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const Center(
        child: Text(
          'Your privacy is important to us in the Others section.',
          style: TextStyle(fontSize: 20),
        ),
      ),
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
          icon: Icon(Icons.message),
          label: 'Message',
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
