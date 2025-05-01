import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quotesapp/models/favorite_change.dart';
import 'package:quotesapp/providers/quotes.dart';
import 'package:quotesapp/screens/detail_screen.dart';
import 'package:quotesapp/models/theme_change.dart';

class ShortScreen extends StatefulWidget {
  final int category;
  final String categoryName;
  const ShortScreen({
    super.key,
    required this.category,
    required this.categoryName,
  });

  @override
  State<ShortScreen> createState() => _ShortScreen();
}

class _ShortScreen extends State<ShortScreen> {
  final favData = Hive.box('favorites');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
          overflow: TextOverflow.ellipsis,
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
      body: Consumer<QuotesModel>(
        builder: (context, value, child) {
          return Expanded(
            child: ListView.separated(
              itemCount: value.quotesdata[widget.category].length,
              separatorBuilder: (context, index) {
                return Divider(
                  color: Theme.of(context).dividerColor,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    value.quotesdata[widget.category][index],
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => DetailScreen(
                              category: widget.category,
                              indexnbr: index,
                            ),
                      ),
                    );
                  },
                  trailing: Consumer<Favorite>(
                    builder: (context, fav, child) {
                      return IconButton(
                        icon: Icon(
                          favData.values.any(
                                (item) =>
                                    item[0] == widget.category &&
                                    item[1] == index,
                              )
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              favData.values.any(
                                    (item) =>
                                        item[0] == widget.category &&
                                        item[1] == index,
                                  )
                                  ? Colors.red
                                  : Theme.of(context)
                                      .iconTheme
                                      .color, // the border color will be based on the theme
                        ),
                        iconSize: 30,
                        onPressed: () {
                          fav.changeFavorite(widget.category, index);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
