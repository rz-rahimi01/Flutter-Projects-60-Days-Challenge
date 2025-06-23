import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late String videoUrl = "https://youtu.be/oyQ2xvF3Bv8?si=NsiXUVqcb20fP36K";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(autoPlay: false, loop: true),
    );
    super.initState();
    // Initialize any necessary data or state here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ok")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [YoutubePlayer(controller: _controller, bottomActions: [])],
      ),
    );
  }
}
