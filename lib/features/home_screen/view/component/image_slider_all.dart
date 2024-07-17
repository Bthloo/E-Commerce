import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'image_slider_item.dart';

class ImageSliderAll extends StatefulWidget {
  const ImageSliderAll({super.key});

  @override
  State<ImageSliderAll> createState() => _ImageSliderAllState();
}

class _ImageSliderAllState extends State<ImageSliderAll> {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CarouselSlider.builder(
            itemCount: imagesSlider.length,
            itemBuilder: (context, index, realIndex) {
              //currentIndex = realIndex;
              return imagesSlider[index];
            },

            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              height: 170.h,
              aspectRatio: 16/9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              // disableCenter: true
            ),

          ),
          DotsIndicator(
            dotsCount: imagesSlider.length,
            position: currentIndex,
            decorator: DotsDecorator(
              color: const Color(0xffF3F3F3),
              activeColor: const Color(0xffF3F3F3),
              size: const Size(8.0, 8.0),
              activeSize: const Size(8.0, 8.0),
              activeShape: RoundedRectangleBorder(
                side: const BorderSide(
                  color:  Colors.white,
                  width: 1,
                  strokeAlign: 5,

                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ]
    );
  }
}
List<ImageSliderItem> imagesSlider = [
  ImageSliderItem(
    title: "New Collection",
    image: "assets/images/autmn_collection.png",
    onTap: () {},
  ),
  ImageSliderItem(
    title: "Summer Sale",
    image: "assets/images/autmn_collection.png",
    onTap: () {
      debugPrint("Summer Sale");
    },
  ),
  ImageSliderItem(
    title: "Winter Sale",
    image: "assets/images/autmn_collection.png",
    onTap: () {},
  ),
  ImageSliderItem(
    title: "Black Friday",
    image: "assets/images/autmn_collection.png",
    onTap: () {},
  ),
];