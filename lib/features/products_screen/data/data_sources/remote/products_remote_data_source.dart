import 'package:ecommerce_app/features/products_screen/data/models/ProductsResponse.dart';

abstract class ProductsRemoteDataSource {
 Future<ProductsResponse> getProducts({String? productId});
}