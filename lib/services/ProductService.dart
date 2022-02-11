import 'package:taa_store/model/Product.dart';
import 'package:taa_store/services/networking.dart';
import 'package:taa_store/utils/constants.dart';

class ProductService {
      NetworkingHelper _networkingHelper = NetworkingHelper();


    Future<List<Product>> getAllProducts() async {
      var json = await _networkingHelper.getData('https://fakestoreapi.com/products');
      return Product.productsFromJson(json);

    }
}