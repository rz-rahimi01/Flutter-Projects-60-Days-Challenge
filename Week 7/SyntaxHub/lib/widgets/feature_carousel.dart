import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureCarousel extends StatefulWidget {
  const FeatureCarousel({super.key});

  @override
  State<FeatureCarousel> createState() => _FeatureCarouselState();
}

class _FeatureCarouselState extends State<FeatureCarousel> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _carouselItems = [
    {
      'title': 'Master Programming',
      'subtitle': 'Learn from experts with hands-on projects',
      'icon': Icons.school,
      'gradient': [const Color(0xFF667eea), const Color(0xFF764ba2)],
    },
    {
      'title': 'Practice Daily',
      'subtitle': 'Build coding habits with daily challenges',
      'icon': Icons.fitness_center,
      'gradient': [const Color(0xFFf093fb), const Color(0xFFf5576c)],
    },
    {
      'title': 'Build Projects',
      'subtitle': 'Create real-world applications with examples',
      'icon': Icons.build,
      'gradient': [
        const Color.fromARGB(255, 75, 141, 198),
        const Color.fromARGB(255, 92, 129, 131),
      ],
    },
    {
      'title': 'Join Community',
      'subtitle': 'Connect with Experenced fellow developers',
      'icon': Icons.people,
      'gradient': [
        const Color.fromARGB(255, 156, 223, 178),
        const Color.fromARGB(255, 15, 146, 122),
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CarouselSlider.builder(
            itemCount: _carouselItems.length,
            itemBuilder: (context, index, realIndex) {
              final item = _carouselItems[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: item['gradient'],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item['icon'], size: 50, color: Colors.white),
                      const SizedBox(height: 16),
                      Text(
                        item['title'],
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      // const SizedBox(height: 8),
                      Text(
                        item['subtitle'],
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: const Color.fromRGBO(255, 255, 255, 0.95),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _carouselItems.asMap().entries.map((entry) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == entry.key
                    ? Colors.white
                    : Colors.white.withAlpha(90),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
