import 'package:ecommerce_app/features/products_screen/domain/entities/product_entity.dart';

class Product {
  const Product({
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
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
    required this.priceAfterDiscount,
  });

  factory Product.fromJson(dynamic json) {
    return Product(
        sold: (json['sold'] as num?)?.toInt(),
        images: (json['images'] as List<dynamic>)
            .map((obj) => obj.toString())
            .toList(),
        ratingsQuantity: json['ratingsQuantity'],
        id: json['_id'],
        title: json['title'],
        slug: json['slug'],
        description: json['description'],
        quantity: json['quantity'],
        price: json['price'],
        imageCover: json['imageCover'],
        ratingsAverage: (json['ratingsAverage']as num).toDouble() ,
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        priceAfterDiscount: json['priceAfterDiscount']
    );
  }
  final int? sold;
  final List<String> images;
  final int ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int price;
  final String imageCover;
  //final Category category;
  //final Brand brand;
  final double ratingsAverage;
  final String createdAt;
  final String updatedAt;
  final int? priceAfterDiscount;

  ProductEntity toProductEntity() => ProductEntity(
        sold: sold,
        images: images,
        ratingsQuantity: ratingsQuantity,
        id: id,
        title: title,
        slug: slug,
        description: description,
        quantity: quantity,
        price: price,
        imageCover: imageCover,
        ratingsAverage: ratingsAverage,
        priceAfterDiscount: priceAfterDiscount,
      );
}
