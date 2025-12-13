// import 'Products.dart';
//
// class Cart {
//  const Cart({
//     required  this.id,
//     required  this.cartOwner,
//     required  this.products,
//    required   this.createdAt,
//     required  this.updatedAt,
//     required  this.v,
//     required  this.totalCartPrice,});
//
//   factory Cart.fromJson(dynamic json) {
//     return Cart(
//         id: json['_id'],
//         cartOwner: json['cartOwner'],
//         products: (json['products'] as List<dynamic>).map((json) =>
//             Products.fromJson(json)).toList(),
//         createdAt: json['createdAt'],
//         updatedAt: json['updatedAt'],
//         v: json['__v'],
//         totalCartPrice: json['totalCartPrice']
//     );
//   }
//  final List<Products> products;
//  final int totalCartPrice;
//  final String? id;
//  final String? cartOwner;
//  final String? createdAt;
//  final String? updatedAt;
//  final int? v;
//
// }