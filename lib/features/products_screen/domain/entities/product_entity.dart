import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response/brand.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category_response/category.dart';

class ProductEntity{
  final int? sold;
  final List<String>? images;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  //final Category category;
  //final Brand brand;
  final double? ratingsAverage;
  final int? priceAfterDiscount;

  ProductEntity({
    required this.sold,
    required this.images,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    //required this.category,
    //required this.brand,
    required this.ratingsAverage,
    required this.priceAfterDiscount

});
}