import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syntaxhub/providers/theme_provider.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late Stream<QuerySnapshot> firebasedata;

  @override
  void initState() {
    super.initState();

    firebasedata = FirebaseFirestore.instance
        .collection("notifications")
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        elevation: 0,
        title: Text(
          "Notiifications",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        actions: [
          Icon(
            Icons.light_mode_outlined,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
          Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
          Icon(
            Icons.dark_mode_outlined,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ],
        scrolledUnderElevation: 0,
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(2),

        child: StreamBuilder(
          stream: firebasedata,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: snap.data!.docs.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: Theme.of(context).brightness == Brightness.dark
                          ? [Color(0xFF1a1a2e), Color(0xFF0f3460)]
                          : [
                              const Color.fromARGB(255, 180, 148, 237),
                              Colors.deepPurpleAccent.shade100,
                              const Color.fromARGB(255, 134, 99, 232),
                            ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white24
                            : Colors.black45,

                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      // ignore: deprecated_member_use
                      backgroundColor: Colors.deepPurple.withOpacity(0.9),
                      child: Icon(Icons.notifications, color: Colors.white),
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snap.data!.docs[index]['msg'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),

                        Text(
                          snap.data!.docs[index]['time'].toDate().toString(),
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    // subtitle: Text(snap.data!.docs[index]['message']),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
