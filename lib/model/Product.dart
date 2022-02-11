import 'package:taa_store/view/screens/category_screen.dart';
import 'dart:convert';
class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  Category category;
  final String image;
  final Rating rating;
   bool isFavorite = false;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});


  static List<Product> productsFromJson(dynamic json){

    Iterable  IterableJson = json;
     return List<Product>.from(IterableJson.map((e) => Product.fromJson(e)));

  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: json['price'].toDouble(),
        description: json['description'],
        category: categoryValues.map![json['category']]!,
        image: json['image'],
        rating: Rating.fromJson(json['rating']));
  }


   Map<String,dynamic> toJson (){
    return {
      'id' : this.id,
      'title':this.title,
      'price': this.price,
      'description' : this.description,
      'category' : categoryValues.reverse![category],
      'image' : this.image,
      'rating' : this.rating.toJson()

    };
   }

}

class Rating {

  final double rate;
  final int count;

  Rating({required this.rate,required this.count});


  factory Rating.fromJson ( Map<String,dynamic> json){

    return Rating(rate: json['rate'].toDouble(), count: json['count']);
  }

  Map<String,dynamic> toJson(){

    return {
      'rate' : this.rate,
      'count' : this.count
    };
  }


}

    final categoryValues = EnumValues(
        {
          "electronics": Category.ELECTRONICS,
          "jewelery": Category.JEWELERY,
          "men's clothing": Category.MEN_S_CLOTHING,
          "women's clothing": Category.WOMEN_S_CLOTHING
        }
    );

enum Category {MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }


class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}