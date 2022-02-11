import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taa_store/logic/controller/CartController.dart';
import 'package:taa_store/logic/controller/ProductController.dart';
import 'package:taa_store/view/widgets/home/CardItem.dart';
import 'package:taa_store/view/widgets/text_utils.dart';

class BuildCardItems extends StatelessWidget {
   BuildCardItems({Key? key}) : super(key: key);
  final productController = Get.find<ProductController>();


   @override
  Widget build(BuildContext context) {
      print(productController.prodcutsList);
    return
      Obx(() =>   productController.isLoading.value ? Center(
        child: Column(
          children: [
            SizedBox(height: 70.h,),
            CircularProgressIndicator(),
            SizedBox(height: 10.h,),

            TextUtils(fontSize: 15, fontWeight: FontWeight.w800, text: 'Loading data...', color:Get.isDarkMode ? Colors.white :  Colors.black)
          ],
        ),
      ) : Expanded(
      child: GridView.builder(
          padding: EdgeInsets.all(20),

          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              mainAxisSpacing: 25.h,
              crossAxisSpacing:  27.w,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.22 ),

          ),
          itemCount: productController.prodcutsList.length,
          itemBuilder: (context, index) {
              return CardItem(
                price: productController.prodcutsList[index].price,
                index: index,
                rate : productController.prodcutsList[index].rating.rate,
                  imageUrl: productController.prodcutsList[index].image,
                isFavorite: productController.prodcutsList[index].isFavorite,
              );
          }),
    ));
  }
}
