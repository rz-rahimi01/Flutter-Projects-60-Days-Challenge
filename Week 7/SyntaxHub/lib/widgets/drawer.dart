import 'package:flutter/material.dart';
import 'package:syntaxhub/screens/about.dart';
import 'package:syntaxhub/screens/bookmarked.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerData extends StatelessWidget {
  const DrawerData({super.key});

  Widget buildComingSoonTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Row(
        children: [
          Text(title, style: TextStyle(color: Colors.grey, fontSize: 13)),
          SizedBox(width: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Coming Soon",
              style: TextStyle(fontSize: 10, color: Colors.black),
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
              color: Colors.amber,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: Theme.of(context).brightness == Brightness.dark
                    ? [Color(0xFF1a1a2e), Color(0xFF0f3460)]
                    : [Colors.deepPurple, Colors.deepPurpleAccent],
              ),
            ),
            accountName: Text("John Doe"),
            accountEmail: Text("john.doe@example.com"),
            currentAccountPicture: CircleAvatar(
              foregroundImage: AssetImage("assets/profile.jpg"),
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
            color: Theme.of(context).brightness == Brightness.dark
                ? Color(0xFF0f3460)
                : Colors.deepPurple[50],

            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            elevation: 3,
            shadowColor: Theme.of(context).appBarTheme.shadowColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),

            child: ListTile(
              leading: Icon(Icons.upcoming, color: Colors.indigo),
              title: Text(
                "Upcoming Features",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Theme.of(context).textTheme.labelMedium?.color,
                ),
              ),
              subtitle: Text(
                "Quizzes, Assigments, offline access and much more more!",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).textTheme.labelMedium?.color,
                  fontSize: 13,
                ),
              ),
            ),
          ),

          buildComingSoonTile(Icons.person, "Profile"),
          buildComingSoonTile(Icons.download, "Downloads"),
          buildComingSoonTile(Icons.history, "Watch History"),
          buildComingSoonTile(Icons.settings, "Settings"),

          Divider(),

          ListTile(
            leading: Icon(
              Icons.video_library_outlined,
              color: Theme.of(context).textTheme.labelMedium?.color,
            ),
            title: Text(
              "My Courses",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.labelMedium?.color,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Bookmarked(title: "My Courses"),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline,
              color: Theme.of(context).textTheme.labelMedium?.color,
            ),
            title: Text(
              "About Us",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.labelMedium?.color,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.star_border_outlined,
              color: Theme.of(context).textTheme.labelMedium?.color,
            ),
            title: Text(
              "Rate App",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.labelMedium?.color,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Uri url = Uri.parse(
                'https://play.google.com/store/apps/details?id=com.example.syntaxhub',
              );

              launchUrl(url, mode: LaunchMode.externalApplication);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.ios_share_outlined,
              color: Theme.of(context).textTheme.labelMedium?.color,
            ),
            title: Text(
              "Share App",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.labelMedium?.color,
                fontSize: 15,
              ),
            ),
            onTap: () {},
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.red, fontSize: 15),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
