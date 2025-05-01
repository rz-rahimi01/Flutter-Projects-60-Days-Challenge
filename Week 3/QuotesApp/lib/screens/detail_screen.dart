import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quotesapp/models/theme_change.dart';
import 'package:quotesapp/providers/quotes.dart';

class DetailScreen extends StatefulWidget {
  final int category;
  final int indexnbr;
  const DetailScreen({
    super.key,
    required this.category,
    required this.indexnbr,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Detail Screen',
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

        //backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Consumer<QuotesModel>(
        builder: (context, value, child) {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  value.quotesdata[widget.category][widget.indexnbr],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  value.description[widget.category][widget.indexnbr],
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '   Go Back   ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    ElevatedButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(
                            text:
                                value.quotesdata[widget.category][widget
                                    .indexnbr],
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Quote copied to clipboard!"),
                            duration: Duration(milliseconds: 1000),
                          ),
                        );
                      },
                      child: Text(
                        'Copy Quote',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
