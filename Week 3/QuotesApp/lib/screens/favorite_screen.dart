import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotesapp/models/favorite.dart';
import 'package:quotesapp/providers/quotes.dart';
import 'package:quotesapp/screens/detail_screen.dart';
import 'package:quotesapp/models/theme_change.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(fontWeight: FontWeight.bold),
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
      ),
      body: Consumer<Favorite>(
        builder: (context, value, child) {
          return value.favoriteFlags.isEmpty
              ? Center(
                child: Text(
                  "There is no favorite item available",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              )
              : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: value.favoriteFlags.length,
                      separatorBuilder: (context, index) {
                        return Divider(thickness: 2, indent: 20, endIndent: 20);
                      },
                      itemBuilder: (context, index) {
                        return Consumer<QuotesModel>(
                          builder: (context, txt, child) {
                            return ListTile(
                              title: Text(
                                // txt.shortQuotes[value.favoriteFlags[index]],
                                "wait",
                                textAlign: TextAlign.center,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => DetailScreen(
                                          category: 5,
                                          indexnbr: value.favoriteFlags[index],
                                        ),
                                  ),
                                );
                              },
                              trailing: IconButton(
                                icon: Icon(Icons.favorite, color: Colors.red),
                                onPressed: () {
                                  value.changeFavorite(
                                    value.favoriteFlags[index],
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
              );
        },
      ),
    );
  }
}
