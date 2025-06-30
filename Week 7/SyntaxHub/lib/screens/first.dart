import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syntaxhub/screens/about.dart';
import 'package:syntaxhub/screens/bookmarked.dart';
import 'package:syntaxhub/screens/video_selection.dart';
import 'package:url_launcher/url_launcher.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  late Uri url;
  List items = [
    "Python",
    "Java",
    "C++",
    "JavaScript",
    "Dart",
    "Ruby",
    "PHP",
    "Swift",
    "Flutter",
  ];

  List icons = [
    FontAwesomeIcons.python,
    FontAwesomeIcons.java,
    FontAwesomeIcons.cuttlefish,
    FontAwesomeIcons.js,
    FontAwesomeIcons.dartLang,
    FontAwesomeIcons.diamond,
    FontAwesomeIcons.php,
    FontAwesomeIcons.swift,
    FontAwesomeIcons.flutter,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("SyntaxHub"),
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        elevation: 3,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(FontAwesomeIcons.barsStaggered),
            );
          },
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All Categories :",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),

                SizedBox(height: 10),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Creates 2 columns in a vertical grid
                      mainAxisSpacing: 30, // Spacing between items vertically
                      crossAxisSpacing:
                          25.0, // Spacing between items horizontally
                      childAspectRatio:
                          1.0, // Ratio of width to height of each item
                    ),
                    itemCount:
                        items.length, // Total number of items in the grid
                    itemBuilder: (context, index) {
                      return GridTile(
                        child: GestureDetector(
                          onTap: () {
                            // Handle item tap
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoSelection(title: items[index]),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 5,
                            shadowColor: Colors.black,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  icons[index], // Display the icon for each item
                                  size: 50,
                                  color: Colors.indigo,
                                ),
                                SizedBox(height: 15),
                                Text(
                                  items[index], // Display the item name
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },

                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: BottomAppBar(
          color: Colors.indigo,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => First()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.bookmark, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          Bookmarked(title: "Bookmarked Videos"),
                    ),
                  );
                },
              ),

              IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  // Handle settings button press
                },
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
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
            ListTile(
              leading: Icon(Icons.person, color: Colors.indigo),
              title: Text("Profile"),
              onTap: () {
                Navigator.pop(context);
                // Add profile navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.video_library, color: Colors.indigo),
              title: Text("My Courses"),
              onTap: () {
                Navigator.pop(context);
                // Add courses navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.download, color: Colors.indigo),
              title: Text("Downloads"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.history, color: Colors.indigo),
              title: Text("Watch History"),
              onTap: () {},
            ),
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
                url = Uri.parse(
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
      ),
    );
  }
}
