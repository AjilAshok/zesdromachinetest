import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../model/models.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key, required this.images});
  final List<Result> images;
  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List<Map<String, dynamic>> imageList = [];

  // List imageList = [
  //   {"id": 1, "image_path": 'asset/images/Frame 16.png'},
  //   {"id": 2, "image_path": 'asset/images/google 1.png'},
  //   {"id": 3, "image_path": 'asset/images/google 1.png'}
  // ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  void initState() {
    imageList = [
      {
        "id": 1,
        "image_path":
            widget.images.isNotEmpty ? widget.images[0].posterPath : ""
      },
      {
        "id": 2,
        "image_path":
            widget.images.isNotEmpty ? widget.images[1].posterPath : ""
      },
      {
        "id": 3,
        "image_path":
            widget.images.isNotEmpty ? widget.images[2].posterPath : ""
      },
    ];

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print(currentIndex);
          },
          child: CarouselSlider(
            items: imageList
                .map(
                  (item) => Image.network(
                    'https://image.tmdb.org/t/p/w500${item['image_path']}',
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                )
                .toList(),
            carouselController: carouselController,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              aspectRatio: 2,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 17 : 7,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: currentIndex == entry.key
                          ? Colors.white
                          : Colors.white),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
