import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taa_store/model/Product.dart';
import 'package:taa_store/services/ProductService.dart';

class ProductController extends GetxController {
  var prodcutsList = <Product>[].obs;
  var favoriteList = <Product>[].obs;
  final _productService = ProductService();
  var isLoading = false.obs;
  var isFavorite = false.obs;
  var favoriteStorage = GetStorage();
  var searchList = <Product>[];

  TextEditingController searchTextController = TextEditingController();

  // var productList = [
  //   Product(id: 1,price: 15,description: 'hello',category: Category., title: '', image: '', rating: Rating(count: 15, rate: 15))
  // ];

  Future<void> getAllProducts() async {
    isLoading.value = true;
    try {
      var products = await _productService.getAllProducts();
      prodcutsList.addAll(products);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // ever(favoriteList, (value) async {
    //  await favoriteStorage.write('favList', favoriteList.toList() );
    // });

    var list = favoriteStorage
            .read<List>('favList')
            ?.map((e) => Product.fromJson(e))
            .toList()
            .obs ??
        <Product>[].obs;

    if (list != null) {
      favoriteList = list;
    }
    // favoriteList = list!.toList().obs;
    getAllProducts();
  }

  bool isFav(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }

  Future<void> toggleFavorite(int productID) async {
    var product = prodcutsList.firstWhere((element) => element.id == productID);

    if (isFav(productID)) {
      favoriteList.removeWhere((element) => element.id == productID);
    }
    // product.isFavorite = !product.isFavorite;

    else {
      favoriteList.add(product);
    }
    // else {
    //   favoriteList.removeWhere((element) => element.id == productID);
    // }

    var list = favoriteList.map((e) => e.toJson()).toList();
    await favoriteStorage.write('favList', list);

    //
    update();
  }

  void addSearchToList(String searchString) {
    searchList.addAll(prodcutsList.where((search) =>
        search.title.contains(searchString.toLowerCase()) ||
        search.price.toString().contains(searchString.toLowerCase())));

    update();
  }

  void clearSearchList() {
    searchTextController.clear();
  }
}
