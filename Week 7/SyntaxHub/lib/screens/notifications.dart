import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Notfications",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        backgroundColor: Colors.blueGrey,
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(5),

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
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Icon(Icons.notifications, color: Colors.white),
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snap.data!.docs[index]['msg'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      Text(
                        snap.data!.docs[index]['time'].toDate().toString(),
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),

                  // subtitle: Text(snap.data!.docs[index]['message']),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
