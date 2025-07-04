import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:syntaxhub/providers/theme_provider.dart';
import 'package:syntaxhub/providers/bookmark_provider.dart';
import 'package:syntaxhub/screens/player_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Bookmarked extends StatefulWidget {
  final String title;
  const Bookmarked({super.key, required this.title});

  @override
  State<Bookmarked> createState() => _Bookmarked();
}

class _Bookmarked extends State<Bookmarked> {
  List bookmarks = [];

  @override
  void initState() {
    super.initState();
    refreshBookmarks();
  }

  void refreshBookmarks() {
    final bookmarkdata = Hive.box('bookmarks');
    setState(() {
      bookmarks = bookmarkdata.keys.cast<String>().toList();
    });
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
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () => Navigator.pop(context),
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: bookmarks.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.find_in_page_sharp,
                        color: Colors.orange,
                        size: 70,
                      ),
                      Text(
                        'No Bookmarks Found',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: bookmarks.length,
                  itemBuilder: (context, index) {
                    final videoId = YoutubePlayer.convertUrlToId(
                      bookmarks[index],
                    );

                    return Card(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : const Color(0xFF0f3460),
                      elevation: 7,
                      shadowColor:
                          Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
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
                                      fontWeight: FontWeight.bold,
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
                                    return IconButton(
                                      onPressed: () {
                                        mark.changeBookmark(videoId);
                                        setState(() {
                                          bookmarks.removeAt(index);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 35,
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
    );
  }
}
