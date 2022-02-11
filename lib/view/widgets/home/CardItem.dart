import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:taa_store/logic/controller/CartController.dart';
import 'package:taa_store/logic/controller/ProductController.dart';
import 'package:taa_store/utils/theme.dart';
import 'package:taa_store/view/screens/product_details_screen.dart';
import 'package:taa_store/view/widgets/text_utils.dart';

class CardItem extends StatefulWidget{
  final String imageUrl;
  final double price;
  final double rate;
  final bool isFavorite;
  final int index;
  CardItem(
      {Key? key,
      required this.imageUrl,
      required this.price,
      required this.rate,
      required this.isFavorite,
      required this.index})
      : super(key: key);

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem>   with SingleTickerProviderStateMixin{
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

 late AnimationController _controller;
  late Animation _myAnimation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _myAnimation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 195.h,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey.shade600 : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        child: Column(
          children: [
            GetBuilder<ProductController>(builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        var productId = controller.prodcutsList[widget.index].id;
                        controller.toggleFavorite(productId);
                      },
                      icon: controller.isFav(controller.prodcutsList[widget.index].id)
                          ? Icon(
                              Icons.favorite,
                              color: Get.isDarkMode ? pinkClr : Colors.red,
                            )
                          : Icon(
                              Icons.favorite_border_outlined,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            )),
                  IconButton(
                      onPressed: () {
                        cartController
                            .addItemToCart(controller.prodcutsList[widget.index]);
                        print(cartController.itemPrice);
                        print(cartController.totalPrice);
                      },
                      icon: Transform(   alignment: FractionalOffset.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.002)
                            ..rotateX(3.14*(_myAnimation.value)),child: Icon(Icons.shopping_cart))),
                ],
              );
            }),
            Container(
              width: 149.w,
              height: 155.5.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Hero(
                tag: 'detail',
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                                product: controller.prodcutsList[widget.index])));
                  },
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              child: Row(
                children: [
                  TextUtils(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      text: '\$${widget.price}',
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                  SizedBox(
                    width: 47.w,
                  ),
                  Container(
                    height: 20.h,
                    width: 39.w,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? pinkClr : mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            text: "${widget.rate}",
                            color: Colors.white,
                            underLine: TextDecoration.none,
                          ),
                          const Icon(
                            Icons.star,
                            size: 13,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
