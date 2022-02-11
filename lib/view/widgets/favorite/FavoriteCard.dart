import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taa_store/logic/controller/ProductController.dart';
import 'package:taa_store/view/widgets/text_utils.dart';

class FavoriteCard extends StatelessWidget {
  FavoriteCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.price,
      required this.index})
      : super(key: key);

  final String image;
  final String title;
  final double price;
  final int index;

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 351.74.w,
      height: 93.5.h,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Container(
              width: 89.w,
              height: 93.5.h,
              child: Image.network(
                image,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$title',
                    style: TextStyle(
                        fontSize: 15.sp,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextUtils(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      text: '\$ $price',
                      color: Get.isDarkMode ? Colors.white : Colors.black)
                ],
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  var productId =  controller.favoriteList[index].id;
                  controller.toggleFavorite(productId);

                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 27.w,
                ))


          ],
        ),
      ),
    ) ;
  }
}




