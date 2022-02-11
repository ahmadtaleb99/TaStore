import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taa_store/routes/route.dart';
import 'package:taa_store/utils/theme.dart';
import 'package:taa_store/view/widgets/productDetails/ColorPicker.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final CarouselController sliderController = CarouselController();
  final colorList = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider.builder(
          carouselController: sliderController,
          itemCount: 5,
          itemBuilder: (context, int itemIndex, int pageViewIndex) {
            return SizedBox(
              height: 350.h,
              child: Hero(
                tag: 'detail',
                child: Container(
                  width: double.infinity,
                  height: 350.h,
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
              height: 500.h,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              })),
      Positioned.fill(
        bottom: 6,
        child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: 5,
              effect: JumpingDotEffect(
                  spacing: 8.0,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 1,
                  dotColor: Colors.grey,
                  activeDotColor: Get.isDarkMode ? pinkClr : mainColor),
              onDotClicked: (index) {
                setState(() {
                  sliderController.animateToPage(index,
                      duration: Duration(milliseconds: 800));
                });
              },
            )),
      ),
      Positioned.fill(
        top: 55,
          right: 7,
          child: Align(
              alignment: Alignment.centerRight,
              child: ColorPicker(
                colorList: colorList,
              ))),
      Positioned.fill(

        top: 30,
        left: 15,

          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? pinkClr.withOpacity(0.8) :  mainColor.withOpacity(0.8) ,
                      shape: BoxShape.circle,
                    ),
                  child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
                    Get.back();
                  },),
                ),
                SizedBox(width: 50.w),
                Container(
                  width: 44.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? pinkClr.withOpacity(0.8) :  mainColor.withOpacity(0.8) ,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,),onPressed: (){

                  },),
                ),

              ],
            ),
          ),
      )
    ]);
  }
}
