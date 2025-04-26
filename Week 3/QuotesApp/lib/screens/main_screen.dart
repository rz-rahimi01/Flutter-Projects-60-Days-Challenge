import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotesapp/providers/quotes.dart';
import 'package:quotesapp/screens/detail_screen.dart';
import 'package:quotesapp/models/theme_change.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quotes App',
          style: TextStyle(
            //color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(Icons.light_mode),
          Consumer<ThemeChange>(
            builder: (context, themeProvider, child) {
              return Switch(
                value: themeProvider.isDark,
                onChanged: (value) {
                  themeProvider.change(value);
                },
              );
            },
          ),
          Icon(Icons.dark_mode),
        ],

        //backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 30,
              separatorBuilder: (context, index) {
                return Divider(
                  color: Theme.of(context).dividerColor,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                );
              },
              itemBuilder: (context, index) {
                return Consumer<QuotesModel>(
                  builder: (context, value, child) {
                    return ListTile(
                      title: Text(
                        value.shortQuotes[index],
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
