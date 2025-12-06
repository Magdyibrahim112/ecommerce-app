
import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response/brand.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_response/category.dart';
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
    required this.priceAfterDiscount,
    required this.availableColors,
    required this.imageCover,
    //required this.category,
    //required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
  });
  final int? sold;
  final List<String> images;

  final int ratingsQuantity;
  final double ratingsAverage;
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int price;
  final int? priceAfterDiscount;
  final List<dynamic>? availableColors;
  final String imageCover;
  //final Category category;
  //final Brand brand;
  final String createdAt;
  final String updatedAt;

  factory Product.fromJson(dynamic json) {
    return Product(sold: (json['sold'] as num?)?.toInt(),
        images: (json['images'] as List<dynamic>).cast<String>(),
        ratingsQuantity: json['ratingsQuantity'],
        id: json['_id'],
        title: json['title'],
        slug: json['slug'],
        description: json['description'],
        quantity: json['quantity'],
        price: json['price'],
        priceAfterDiscount: json['priceAfterDiscount'],
        availableColors: json['availableColors'],
        imageCover: json['imageCover'],
       // category: Category.fromJson(json['category']),
        //brand: Brand.fromJson(json['brand']),
        ratingsAverage:( json['ratingsAverage'] as num ).toDouble(),
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);

  }

ProductEntity toProductEntity()=> ProductEntity(sold: sold, images: images, ratingsQuantity: ratingsQuantity, id: id, title: title, slug: slug, description: description, quantity: quantity, price: price, priceAfterDiscount: priceAfterDiscount, availableColors: availableColors, imageCover: imageCover, ratingsAverage: ratingsAverage);


}