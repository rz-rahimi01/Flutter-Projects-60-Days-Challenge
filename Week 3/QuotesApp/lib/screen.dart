import 'package:flutter/material.dart';
import 'package:quotesapp/detail_screen.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<String> shortQuotes = [
    "Be yourself;\neveryone else is already taken.",
    "Two things are infinite:\nthe universe and human stupidity.",
    "So many books,\nso little time.",
    "Be the change\nthat you wish to see in the world.",
    "If you tell the truth,\nyou don't have to remember anything.",
    "A room without books\nis like a body without a soul.",
    "You only live once,\nbut if you do it right, once is enough.",
    "In three words\nI can sum up everything I've learned about life.",
    "To live is the rarest thing in the world.\nMost people exist, that is all.",
    "Without music,\nlife would be a mistake.",
    "We accept the love\nwe think we deserve.",
    "It is never too late\nto be what you might have been.",
    "Fairy tales are more than true:\nnot because they tell us dragons exist.",
    "It does not do\nto dwell on dreams and forget to live.",
    "There is no friend\nas loyal as a book.",
    "Everything you can imagine\nis real.",
    "Do what you can,\nwith what you have, where you are.",
    "And, when you want something,\nall the universe conspires in helping you.",
    "Success is not final,\nfailure is not fatal.",
    "We are all in the gutter,\nbut some of us are looking at the stars.",
    "Life isn't about finding yourself.\nLife is about creating yourself.",
    "A friend is someone\nwho knows all about you and still loves you.",
    "The only way\nto do great work is to love what you do.",
    "The future belongs\nto those who believe in the beauty of their dreams.",
    "It is our choices\nthat show what we truly are.",
    "Happiness can be found\neven in the darkest of times.",
    "Imagination is more important\nthan knowledge.",
    "Not all those who wander\nare lost.",
    "The purpose of our lives\nis to be happy.",
    "You must be the change\nyou wish to see in the world.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quotes App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 30,
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.deepPurpleAccent,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    shortQuotes[index],
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(indexnbr: index),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
