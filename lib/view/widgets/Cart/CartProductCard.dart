import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taa_store/logic/controller/CartController.dart';
import 'package:taa_store/model/Product.dart';
import 'package:taa_store/utils/theme.dart';

class CartProductCard extends StatelessWidget {
  CartProductCard(
      {Key? key,
      required this.image,
      required this.price,
      required this.quanity,
      required this.discription,
      required this.index,
      required this.product})
      : super(key: key);
  final cartController = Get.find<CartController>();
  final image;
  final double price;
  final quanity;
  final discription;
  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w ),

      padding: EdgeInsets.only(left: 10.w),

      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? pinkClr.withOpacity(0.7)
            : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(image))
              ),
              width: 50.w,
              height: 120.h,
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  discription,
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text('\$ ${price.toStringAsFixed(2)}'),
              ],
            ),
          )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      cartController.addItemToCart(product);
                    },
                    icon: Icon(Icons.add_circle),
                    splashRadius: 20,
                  ),
                  Text(quanity.toString()),
                  IconButton(
                    onPressed: () {
                      cartController.removeOneItemFromCart(product);
                    },
                    icon: Icon(Icons.remove_circle),
                    splashRadius: 20,
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  cartController.removeItemFromCart(product);
                },
                icon: Icon(
                  Icons.delete,
                  color: Get.isDarkMode ? Colors.white : Colors.red,
                ),
                splashRadius: 20,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
