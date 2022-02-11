
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taa_store/logic/controller/ProductController.dart';
import 'package:taa_store/model/Product.dart';
import 'package:taa_store/utils/theme.dart';
import 'package:readmore/readmore.dart';

import 'SizesList.dart';

class ProductsInfo extends StatelessWidget {
   ProductsInfo({Key? key,required this.productId, required this.product}) : super(key: key);
  final int productId;
  final Product product;
   final List<String> sizes = ['S','M','L','XL','XXL'];


   final productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(product.title,
                maxLines: 2,
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
                overflow: TextOverflow.ellipsis
              ),),
            ),
            GetBuilder<ProductController>(builder: (_) =>             Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8) ,
                shape: BoxShape.circle,
              ),
              child: IconButton(onPressed: (){
                productController.toggleFavorite(productId);
              },
                icon: productController.isFav(productId)
                    ? Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? pinkClr : Colors.red,
                )
                    : Icon(
                  Icons.favorite_border_outlined,
                  color:
                  Get.isDarkMode ? Colors.white : Colors.black,

                ),
              ),

            )
            ),

          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: RatingBar.builder(
                      itemSize: 25,
                    initialRating: product.rating.rate,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0.w),
                    itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                    },
                    ),
        ),
        ReadMoreText(

        product.description,
          style: TextStyle(
            fontSize: 16.sp,
            height: 2.0,
            color: Get.isDarkMode ? Colors.white : Colors.black
          ),
          moreStyle:TextStyle(
              fontSize: 17.sp,
              height: 2.0,
              color: Get.isDarkMode ? pinkClr : mainColor,
            fontWeight: FontWeight.bold
          ),
          lessStyle:TextStyle(
              fontSize: 17.sp,
              height: 2.0,
              color: Get.isDarkMode ? pinkClr : mainColor,
              fontWeight: FontWeight.bold
          ),
          trimLines: 4,
          trimMode: TrimMode.Line,

        ),
        SizedBox(height: 10.h,),
        SizesList(sizesList: sizes,),

      ],
    );
  }
}
