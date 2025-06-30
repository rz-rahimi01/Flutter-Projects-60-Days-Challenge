import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:syntaxhub/providers/bookmark_provider.dart';
import 'package:syntaxhub/screens/first.dart';
import 'package:syntaxhub/screens/player_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Bookmarked extends StatefulWidget {
  final String title;
  const Bookmarked({super.key, required this.title});

  @override
  State<Bookmarked> createState() => _Bookmarked();
}

class _Bookmarked extends State<Bookmarked> {
  late Stream<QuerySnapshot> firebasedata;
  List bookmarks = [];

  @override
  void initState() {
    super.initState();
    refreshBookmarks();
  }

  void refreshBookmarks() {
    final bookmarkdata = Hive.box('bookmarks');
    bookmarks = bookmarkdata.keys.cast<String>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.title),
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        elevation: 3,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ListView.builder(
            itemCount: bookmarks.length,
            itemBuilder: (context, index) {
              final videoId = YoutubePlayer.convertUrlToId(bookmarks[index]);
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  PLayerScreen(videoId: videoId),
                            ),
                          );
                        },
                        child: Image.network(
                          YoutubePlayer.getThumbnail(videoId: videoId!),
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Video Title',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Consumer<Bookmark>(
                            builder: (context, mark, child) {
                              return IconButton(
                                onPressed: () {
                                  mark.changeBookmark(videoId);
                                  setState(() {
                                    bookmarks.removeAt(
                                      index,
                                    ); // triggers UI rebuild
                                  });
                                },
                                icon: Icon(
                                  FontAwesomeIcons.solidBookmark,

                                  color: Colors.indigo,
                                  size: 20,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
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
    );
  }
}
