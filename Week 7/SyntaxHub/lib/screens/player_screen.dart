import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:syntaxhub/providers/theme_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PLayerScreen extends StatefulWidget {
  const PLayerScreen({super.key, required this.videoId});
  final String videoId;

  @override
  State<PLayerScreen> createState() => _PLayerScreenState();
}

class _PLayerScreenState extends State<PLayerScreen> {
  late YoutubePlayerController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller =
        YoutubePlayerController(
          initialVideoId: widget.videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
            controlsVisibleAtStart: true,
            enableCaption: false,
            isLive: false,
          ),
        )..addListener(() {
          if (_controller.metadata.title.isNotEmpty && _isLoading) {
            setState(() {
              _isLoading = false;
            });
          }
        });
  }

  @override
  void dispose() {
    _controller.dispose();

    // 🔁 Reset orientation back to portrait on exit
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
        ),
        onReady: () {
          debugPrint('Player is ready.');
        },
        onEnded: (meta) {
          // optional
        },
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          // extendBodyBehindAppBar: true,
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

          body: Column(
            children: [
              player,

              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: Theme.of(context).brightness == Brightness.dark
                          ? [
                              Color.fromARGB(255, 29, 72, 124),
                              Color.fromARGB(255, 29, 72, 124),
                            ]
                          : [Colors.white, Colors.white],
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white24
                            : Colors.black26,
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _controller.metadata.title,
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).textTheme.labelMedium?.color,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Theme.of(
                                context,
                              ).textTheme.labelMedium?.color,
                              child: Icon(
                                Icons.person,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _controller.metadata.author,
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).textTheme.labelMedium?.color,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _isLoading
                            ? const LinearProgressIndicator(
                                color: Colors.red,
                                backgroundColor: Colors.grey,
                              )
                            : Text(
                                _controller.metadata.title,
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).textTheme.labelMedium?.color,
                                  fontSize: 14,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
