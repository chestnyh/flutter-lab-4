import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/dummy_data/categories_data.dart';

class CategoriesCarouselWidget extends StatefulWidget {
  CategoriesCarouselWidget({Key key}) : super(key: key);

  @override
  _CategoriesCarouselWidgetState createState() =>
      _CategoriesCarouselWidgetState();
}

class _CategoriesCarouselWidgetState extends State<CategoriesCarouselWidget> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            aspectRatio: 500.0 / 300.0,
            autoPlayInterval: Duration(seconds: 3),
            autoPlay: true,
          ),
          items: categoriesImageData.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(image, fit: BoxFit.contain),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
            bottom: 0,
            right: 24,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                    onTap: () {
                      _controller.previousPage();
                    },
                    child:
                        Image.asset('assets/images/carousel_arrow_left.png')),
                SizedBox(width: 2),
                InkWell(
                    onTap: () {
                      _controller.nextPage();
                    },
                    child:
                        Image.asset('assets/images/carousel_arrow_right.png')),
              ],
            ))
      ],
    );
  }
}
