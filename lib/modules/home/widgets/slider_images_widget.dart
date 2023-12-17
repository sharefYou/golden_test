import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:golden_test/layout/home_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliderWidget extends StatelessWidget {
  const ImageSliderWidget({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CarouselSlider(
            carouselController: CarouselController(),
            items: List.generate(
              cubit.sliderList.length,
                  (index) => Image.network(
                cubit.rootPath + cubit.sliderList[index].image,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            options: CarouselOptions(
                height: 140.0,
                onPageChanged: (index, reason) {
                  cubit.changeCarouselIndex(index);
                },
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                viewportFraction: 1.0,
                autoPlayAnimationDuration:
                const Duration(seconds: 1),
                autoPlayInterval: const Duration(seconds: 3),
                scrollDirection: Axis.horizontal,
                autoPlayCurve: Curves.fastOutSlowIn),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Center(
          child: AnimatedSmoothIndicator(
            activeIndex: cubit.carouselIndex,
            count: cubit.sliderList.length,
            effect: const ExpandingDotsEffect(
                activeDotColor: Color(0xFFD10400),
                dotHeight: 5,
                dotWidth: 5,
                spacing: 2),
          ),
        ),
      ],
    );
  }
}
