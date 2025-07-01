import 'package:flutter/material.dart';
import 'package:syntaxhub/screens/about.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerData extends StatelessWidget {
  @override
  const DrawerData({super.key});

  Widget buildComingSoonTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: Row(
        children: [
          Text(title, style: TextStyle(color: Colors.grey[600])),
          SizedBox(width: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Coming Soon",
              style: TextStyle(fontSize: 10, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.indigo.shade700, Colors.indigo.shade400],
              ),
            ),
            accountName: Text("John Doe"),
            accountEmail: Text("john.doe@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "JD",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.indigo.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Card(
            color: Colors.indigo.shade50,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(Icons.upcoming, color: Colors.indigo),
              title: Text(
                "Upcoming Features",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Quizzes, Assigments, offline access and much more more!",
              ),
            ),
          ),

          buildComingSoonTile(Icons.person, "Profile"),
          buildComingSoonTile(Icons.video_library, "My Courses"),
          buildComingSoonTile(Icons.download, "Downloads"),
          buildComingSoonTile(Icons.history, "Watch History"),

          Divider(),
          ListTile(
            leading: Icon(Icons.info, color: Colors.indigo),
            title: Text("About Us"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.star, color: Colors.indigo),
            title: Text("Rate App"),
            onTap: () {
              Uri url = Uri.parse(
                'https://play.google.com/store/apps/details?id=com.example.syntaxhub',
              );

              launchUrl(url, mode: LaunchMode.externalApplication);
            },
          ),
          ListTile(
            leading: Icon(Icons.share, color: Colors.indigo),
            title: Text("Share App"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
