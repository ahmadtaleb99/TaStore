import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:taa_store/logic/controller/CartController.dart';
import 'package:taa_store/model/Product.dart';
import 'package:taa_store/utils/theme.dart';
import 'package:taa_store/view/widgets/Cart/CartCheckOut.dart';
import 'package:taa_store/view/widgets/Cart/EmptyCart.dart';
import 'package:taa_store/view/widgets/Cart/CartProductCard.dart';
import 'package:taa_store/view/widgets/text_utils.dart';

class CartScreen extends StatelessWidget {
     CartScreen({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart Items'),
          centerTitle: true,
          actions: [IconButton(onPressed: () {
            cartController.clearCart();
          }, icon: Icon(Icons.backspace))],
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        ),
        body: GetBuilder<CartController>(
          builder: (_){
            if (cartController.cartItems.isEmpty)
              return EmptyCart();
            else
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(

                        itemBuilder: (context, index) {
                          var cartItems = cartController.cartItems;
                          var product = cartItems.keys.toList()[index] as Product;
                          var quanity = cartItems.values.toList()[index] as int;
                          var price = cartController.itemPrice[index] as double;
                          return CartProductCard(image: product.image,
                              quanity: quanity,
                              price: price,
                            discription: product.description,
                            index : index,
                            product : product

                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20.h,
                          );
                        },
                        itemCount: cartController.cartItems.length),
                  ),
                  CartCheckOut()
                ],
            ),
              );
          },
        )//EmptyCart(),

        );
  }
}
