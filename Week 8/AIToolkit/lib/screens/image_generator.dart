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
  Map genModels = {
    1: ["FLUX.1-dev", "black-forest-labs/FLUX.1-dev"],
    2: ["FLUX.1-schnell", "black-forest-labs/FLUX.1-schnell"],
    3: ["Stable Diffusion", "stabilityai/stable-diffusion-xl-base-1.0"],
  };
  List ratios = ["1/1", "4/3", "16/9"];
  List imageCountOptions = ["1", "2", "3", "4"];
  String selectedModel = "black-forest-labs/FLUX.1-dev";
  String selectedRatio = "1/1";
  String selectedCount = "1";
  List<Uint8List> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.deepPurple.shade50, Colors.deepPurple.shade100],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Prompt',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple.shade800,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: textcontroller,
                            maxLines: 3,
                            decoration: InputDecoration(
                              hintText:
                                  "Describe the image you want to generate...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.deepPurple.shade200,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.deepPurple,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Settings',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple.shade800,
                            ),
                          ),
                          const SizedBox(height: 12),

                          _buildDropdownRow(
                            label: 'Model',
                            value: selectedModel,
                            items: genModels.values
                                .map<DropdownMenuItem<String>>(
                                  (valuelist) => DropdownMenuItem<String>(
                                    value: valuelist[1],
                                    child: Text(valuelist[0]),
                                  ),
                                )
                                .toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedModel = newValue.toString();
                              });
                            },
                          ),

                          const SizedBox(height: 12),

                          _buildDropdownRow(
                            label: 'Aspect Ratio',
                            value: selectedRatio,
                            items: ratios
                                .map<DropdownMenuItem<String>>(
                                  (ratio) => DropdownMenuItem<String>(
                                    value: ratio,
                                    child: Text(ratio),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedRatio = value.toString();
                              });
                            },
                          ),

                          const SizedBox(height: 12),

                          _buildDropdownRow(
                            label: 'Image Count',
                            value: selectedCount,
                            items: imageCountOptions
                                .map<DropdownMenuItem<String>>(
                                  (count) => DropdownMenuItem<String>(
                                    value: count,
                                    child: Text(count),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCount = value.toString();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Consumer<ImageApiUpload>(
                    builder: (context, pov, child) {
                      return ElevatedButton(
                        onPressed: () async {
                          if (textcontroller.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter a prompt"),
                              ),
                            );
                            return;
                          }

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
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Error: $e")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          "Generate Image",
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  if (images.isNotEmpty)
                    Text(
                      'Generated Images',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple.shade800,
                      ),
                    ),

                  const SizedBox(height: 12),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.only(bottom: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.memory(images[index]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownRow({
    required String label,
    required String value,
    required List<DropdownMenuItem<String>> items,
    required Function(dynamic) onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(color: Colors.deepPurple.shade600),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.deepPurple.shade200),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButton<String>(
              value: value,
              onChanged: onChanged,
              items: items,
              underline: const SizedBox(),
              isExpanded: true,
              borderRadius: BorderRadius.circular(8),
              dropdownColor: Colors.white,
              style: TextStyle(color: Colors.deepPurple.shade800),
            ),
          ),
        ),
      ],
    );
  }
}
