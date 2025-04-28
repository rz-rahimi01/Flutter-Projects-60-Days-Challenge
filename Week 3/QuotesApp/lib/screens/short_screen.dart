import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotesapp/models/favorite.dart';
import 'package:quotesapp/providers/quotes.dart';
import 'package:quotesapp/screens/detail_screen.dart';
import 'package:quotesapp/models/theme_change.dart';
import 'package:quotesapp/screens/favorite_screen.dart';

class ShortScreen extends StatefulWidget {
  final int ch;
  const ShortScreen({super.key, required this.ch});

  @override
  State<ShortScreen> createState() => _ShortScreen();
}

class _ShortScreen extends State<ShortScreen> {
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
                  // color: Theme.of(context).dividerColor,
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
                        value.quotesdata[widget.ch][index],
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => DetailScreen(
                                  category: widget.ch,
                                  indexnbr: index,
                                ),
                          ),
                        );
                      },
                      trailing: Consumer<Favorite>(
                        builder: (context, fav, child) {
                          return IconButton(
                            icon: Icon(
                              fav.favoriteFlags.contains(index)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color:
                                  fav.favoriteFlags.contains(index)
                                      ? Colors.red
                                      : Theme.of(context)
                                          .iconTheme
                                          .color, // the border color will be based on the theme
                            ),
                            onPressed: () {
                              fav.changeFavorite(index);
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavoriteScreen()),
          );
        },
        child: Icon(Icons.favorite, color: Colors.red), // Example icon
      ),
    );
  }
}
