import 'package:flutter/material.dart';

class ImageSliderItem extends StatelessWidget {
  const ImageSliderItem({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });
final String title;
final String image;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image:  DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ),
    );
  }
}
