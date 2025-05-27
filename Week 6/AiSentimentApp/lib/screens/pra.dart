import 'package:flutter/material.dart';

class Pra extends StatefulWidget {
  const Pra({super.key});

  @override
  State<Pra> createState() => _PraState();
}

class _PraState extends State<Pra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: SizedBox(
              //height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("data"),
                  const SizedBox(height: 8),
                  ...List.generate(5, (i) {
                    return Padding(
                      padding: EdgeInsets.all(4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Item $i'),
                          SizedBox(width: 5),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: i.toDouble() / 10,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
