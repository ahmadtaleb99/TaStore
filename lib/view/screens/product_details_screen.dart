import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:taa_store/model/Product.dart';
import 'package:taa_store/view/widgets/Cart/CartCheckOut.dart';
import 'package:taa_store/view/widgets/productDetails/AddToCart.dart';
import 'package:taa_store/view/widgets/productDetails/ImageSlider.dart';
import 'package:taa_store/view/widgets/productDetails/ProductsInfo.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);
    final Product product ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlider(image: product.image,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ProductsInfo(productId: product.id,product: product,),
            ),
            AddToCart(product: product)


          ],
        ),
      ),
          );
  }
}
