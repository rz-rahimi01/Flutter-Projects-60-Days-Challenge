import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:syntaxhub/providers/bookmark_provider.dart';
import 'package:syntaxhub/providers/theme_provider.dart';
import 'package:syntaxhub/screens/player_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoSelection extends StatefulWidget {
  final String title;
  const VideoSelection({super.key, required this.title});

  @override
  State<VideoSelection> createState() => _VideoSelectionState();
}

class _VideoSelectionState extends State<VideoSelection> {
  late Stream<QuerySnapshot> firebasedata;

  final bookMark = Hive.box('bookmarks');

  @override
  void initState() {
    super.initState();
    firebasedata = FirebaseFirestore.instance
        .collection("languages")
        .doc(widget.title)
        .collection("videos")
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
          widget.title,
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

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: firebasedata,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Loading videos...",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                );
              }
              if (!snap.hasData || snap.data!.docs.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.video_library_outlined,
                        size: 60,
                        color: Colors.indigo.shade200,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "No Videos Available",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (snap.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 60,
                        color: Colors.red.shade300,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Something went wrong!",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red.shade400,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                itemCount: snap.data!.docs.length,
                itemBuilder: (context, index) {
                  final videoId = YoutubePlayer.convertUrlToId(
                    snap.data!.docs[index]['videolink'],
                  );
                  return Card(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Color(0xFF0f3460),
                    elevation: 7,
                    shadowColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    //  margin: EdgeInsets.symmetric(vertical: 8),
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
                              height: 205,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Video Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Theme.of(
                                      context,
                                    ).textTheme.labelMedium?.color,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Consumer<Bookmark>(
                                builder: (context, mark, child) {
                                  final isbookmarked = bookMark.containsKey(
                                    videoId,
                                  );
                                  return IconButton(
                                    onPressed: () {
                                      mark.changeBookmark(videoId);
                                    },
                                    icon: Icon(
                                      isbookmarked
                                          ? FontAwesomeIcons.solidBookmark
                                          : FontAwesomeIcons.bookmark,
                                      color: Theme.of(
                                        context,
                                      ).textTheme.labelMedium?.color,
                                      size: 25,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
