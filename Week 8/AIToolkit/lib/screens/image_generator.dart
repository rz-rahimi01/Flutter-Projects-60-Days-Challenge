import 'dart:typed_data';

import 'package:aitoolkit/providers/image_api_upload.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageGenerator extends StatefulWidget {
  const ImageGenerator({super.key});

  @override
  State<ImageGenerator> createState() => _ImageGeneratorState();
}

class _ImageGeneratorState extends State<ImageGenerator> {
  TextEditingController textcontroller = TextEditingController();
  List genModels = ["FLUX.1-dev", "FLUX.1-schnell", "Stable Diffusion"];
  List ratios = ["1/1", "4/3", "16/9"];
  List imageCountOptions = ["1", "2", "3", "4"];
  String selectedModel = "FLUX.1-dev";
  String selectedRatio = "1/1";
  String selectedCount = "1";
  List<Uint8List> images = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },

        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    controller: textcontroller,
                    decoration: InputDecoration(
                      label: Text("Enter your prompt"),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 10),
                  Column(
                    children: [
                      DropdownButton(
                        value: selectedModel,
                        onChanged: (newvalues) {
                          setState(() {
                            selectedModel = newvalues.toString();
                          });
                        },

                        items: [
                          for (var item in genModels)
                            DropdownMenuItem(value: item, child: Text(item)),
                        ],
                      ),
                      DropdownButton(
                        value: selectedRatio,
                        onChanged: (value) {
                          setState(() {
                            selectedRatio = value.toString();
                          });
                        },
                        items: [
                          for (var i = 0; i < 3; i++)
                            DropdownMenuItem(
                              value: ratios[i],
                              child: Text(ratios[i]),
                            ),
                        ],
                      ),
                      DropdownButton(
                        value: selectedCount,
                        onChanged: (value) {
                          setState(() {
                            selectedCount = value.toString();
                          });
                        },

                        items: [
                          for (var i in imageCountOptions)
                            DropdownMenuItem(value: i, child: Text(i)),
                        ],
                      ),
                      Consumer<ImageApiUpload>(
                        builder: (context, pov, child) {
                          return ElevatedButton(
                            onPressed: () async {
                              try {
                                final imageBytes = await pov.imageapi(
                                  textcontroller.text,
                                  selectedModel,
                                  selectedRatio,
                                  int.parse(selectedCount),
                                );
                                setState(() {
                                  images.add(imageBytes);
                                });
                              } catch (e) {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(SnackBar(content: Text("$e")));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purpleAccent[50],
                              foregroundColor: Colors.black,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              side: BorderSide(color: Colors.purpleAccent),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                            ),
                            child: Text("Generate"),
                          );
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.memory(images[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
