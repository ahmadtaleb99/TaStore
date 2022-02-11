import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:taa_store/logic/controller/ProductController.dart';
import 'package:taa_store/view/widgets/favorite/FavoriteCard.dart';

class FavoriteScreeen extends StatelessWidget {
   FavoriteScreeen({Key? key}) : super(key: key);


    final controller =    Get.put(ProductController());

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Obx(() {

          if(controller.favoriteList.isEmpty){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: Image.asset("assets/images/heart.png"),
                  ),
                   SizedBox(
                    height: 20.h,
                  ),
                  Text('Please, Add your favorites products.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18.sp,
                      )),
                ],
              ),
            );
          }
          else return ListView.separated(itemBuilder: (context,index){
            return FavoriteCard(
                        index: index,
                image : controller.favoriteList[index].image,
              title : controller.favoriteList[index].title,
                price : controller.favoriteList[index].price,

            );


          }
              , separatorBuilder: (context,indxe){
                return Divider(
                  height: 25.h,
                  thickness: 0,
                  color: Colors.transparent,
                  indent: 0,
                );
              }, itemCount: controller.favoriteList.length);
        }

            )
    );
  }
}
