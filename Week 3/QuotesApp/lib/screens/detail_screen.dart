import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotesapp/models/theme_change.dart';
import 'package:quotesapp/providers/quotes.dart';

class DetailScreen extends StatefulWidget {
  final int indexnbr;
  const DetailScreen({super.key, required this.indexnbr});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final quotesdetailsLocal =
        Provider.of<QuotesModel>(context, listen: false).initial[widget
            .indexnbr];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Detail Screen',
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
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Text((quotesdetailsLocal), style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },

            child: Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
