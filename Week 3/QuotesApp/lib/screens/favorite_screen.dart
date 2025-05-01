import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quotesapp/models/favorite_change.dart';
import 'package:quotesapp/providers/quotes.dart';
import 'package:quotesapp/screens/detail_screen.dart';
import 'package:quotesapp/models/theme_change.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List favs = [];
  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  void loadFavorites() {
    final box = Hive.box('favorites');
    favs = box.values.cast().toList();
  }

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
          return favs.isEmpty
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
                      itemCount: favs.length,
                      separatorBuilder: (context, index) {
                        return Divider(thickness: 2, indent: 20, endIndent: 20);
                      },
                      itemBuilder: (context, index) {
                        return Consumer<QuotesModel>(
                          builder: (context, txt, child) {
                            return ListTile(
                              title: Text(
                                // txt.shortQuotes[value.favoriteFlags[index]],
                                txt.quotesdata[favs[index][0]][favs[index][1]],
                                style: TextStyle(fontSize: 20),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => DetailScreen(
                                          category: favs[index][0],
                                          indexnbr: favs[index][1],
                                        ),
                                  ),
                                );
                              },
                              trailing: IconButton(
                                icon: Icon(Icons.favorite, color: Colors.red),
                                iconSize: 30,
                                onPressed: () {
                                  value.changeFavorite(
                                    favs[index][0],
                                    favs[index][1],
                                  );
                                  favs.removeAt(index);
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
