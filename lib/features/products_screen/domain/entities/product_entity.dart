class ProductEntity{
  const ProductEntity({
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
    required this.ratingsAverage,

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

}