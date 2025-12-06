import 'package:ecommerce_app/features/cart/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response/brand.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_response/category.dart';




class Product {
  const Product({

    required this.id,
    required this.title,
   // required this.quantity,
    required this.imageCover,
    // required this.category,
    // required this.brand,
    required this.ratingsAverage,
  });

  final String id;
  final String title;
  //final int quantity;
  final String imageCover;
  // final Category category;
  // final Brand brand;
  final double ratingsAverage;

  factory Product.fromJson(dynamic json) {
    return Product(id: json['_id'],
        title: json['title'],
        //quantity: json['quantity'],
        imageCover: json['imageCover'],
        // category: Category.fromJson(json['category']),
        // brand: Brand.fromJson(json['brand']),
        ratingsAverage:( json['ratingsAverage'] as num).toDouble());
  }
ProductEntity toProductEntity()=> ProductEntity(id: id, title: title, imageCover: imageCover);


}