import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/products_screen/presentation/cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.categoryId});
final String categoryId;
  @override
  Widget build(BuildContext context) {
    print("CategoryID$categoryId");
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const HomeScreenAppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: BlocProvider(
          create: (_)=> serviceLocator.get<ProductsCubit>()..getProducts(productId: categoryId),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (_, state){
                    if(state is ProductsLoading){
                      return Center(child: CircularProgressIndicator(),);
                    }else if(state is ProductsError){
                      return Center(child: Text(state.message),);
                    }else if(state is ProductsSuccess){
                      return GridView.builder(
                        itemCount: state.products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 7 / 11,
                        ),
                        itemBuilder: (context, index) {
                          return CustomProductWidget(
                            product: state.products[index],
                            image: ImageAssets.categoryHomeImage,
                            title: "Nike Air Jordon",
                            price: 1100,
                            rating: 4.7,
                            discountPercentage: 10,
                            height: height,
                            width: width,
                            description:
                            "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                          );
                        },
                        scrollDirection: Axis.vertical,
                      );
                    }
                    return SizedBox();
                  },

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
