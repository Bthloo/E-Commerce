import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/models/ProductsFromCategoryModel.dart';

class ProductImagesSlider extends StatefulWidget {
  const ProductImagesSlider({super.key, required this.args});
  final Products args;

  @override
  State<ProductImagesSlider> createState() => _ProductImagesSliderState();
}

class _ProductImagesSliderState extends State<ProductImagesSlider> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "${widget.args.id}",
        child:
        widget.args.images!.isEmpty || widget.args.images?.length == 1 ?
        InteractiveViewer(
          alignment: Alignment.center,
          boundaryMargin: const EdgeInsets.all(double.infinity),
          child: CachedNetworkImage(
            progressIndicatorBuilder: (context, url, progress) {
              return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: const Color(0xffF5F5F5),
                    width: double.infinity,
                    height: 432.h,
                  )
              );

            },
            imageUrl:widget.args.thumbnail!,
            width: double.infinity,
            fit: BoxFit.fill,
            height: 432.h,
          ),
        )
            :Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CarouselSlider.builder(
                itemBuilder: (context, index, realIndex) {
                  return InteractiveViewer(
                    scaleEnabled: true,
                    alignment: Alignment.center,
                    boundaryMargin: const EdgeInsets.all(double.infinity),
                    child: CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) {
                        return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              color: const Color(0xffF5F5F5),
                              width: double.infinity,
                              height: 432.h,
                            )
                        );

                      },
                      imageUrl: widget.args.images![index],
                      width: double.infinity,
                      fit: BoxFit.contain,
                      //height: 432.h,
                    ),
                  );
                },
                itemCount: widget.args.images!.length,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;

                    });
                  },
                  height: 432.h,
                  initialPage: 0,
                  scrollPhysics: const BouncingScrollPhysics(),
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                 autoPlayInterval: const Duration(seconds: 3),
                 autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                 // enlargeCenterPage: true,
                  pageSnapping: true,
                )
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                   // color: Colors.transparent,
                    color: Colors.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: DotsIndicator(
                    dotsCount: widget.args.images?.length ?? 1,
                    position: currentIndex,

                    decorator: DotsDecorator(
                      color:  Colors.black,
                      activeColor: Colors.black,
                      //const Color(0xffF3F3F3),
                      size: const Size(8.0, 8.0),
                      activeSize: const Size(8.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color:  Colors.black,
                          width: 1,
                          strokeAlign: 5,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
