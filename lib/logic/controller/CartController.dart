import 'package:get/get.dart';
import 'package:taa_store/model/Product.dart';

  class CartController extends GetxController {

      Map<dynamic,dynamic> cartItems  = {};

      void addItemToCart (Product product) {
          if(cartItems.containsKey(product))
        cartItems[product] +=  1;
          else
            cartItems[product] = 1;

            update();

      }


      void removeOneItemFromCart(Product product){
        if(cartItems.containsKey(product) && cartItems[product] ==1 )
          cartItems.remove(product);
        else
          cartItems[product]  -= 1;

        update();


      }

      void removeItemFromCart(Product product){
          cartItems.remove(product);
          update();

      }
      void clearCart(){
        cartItems.clear();
        update();

      }

       List get itemPrice =>
          cartItems.entries.map((e) => e.value * e.key.price).toList();

      double get  totalPrice => itemPrice.reduce((value, element) => value + element);
  }