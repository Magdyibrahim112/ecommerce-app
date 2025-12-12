import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/products_screen/presentation/cubit/products_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.categoryId});
  final String categoryId ;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //String categoryId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: const HomeScreenAppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: BlocProvider(
          create: (context) => getIt<ProductsCubit>()..getProducts(),
          child: Column(
            children: [
              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state){
                  if(state is ProductLoading){
                    return Center(child: CircularProgressIndicator(),);
                  }else if(state is ProductError){
                    return Center(child: Text(state.message),);
                  }else if(state is ProductSuccess){
                   return Expanded(
                      child: GridView.builder(
                        itemCount: state.products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 7 / 9,
                        ),
                        itemBuilder: (context, index) {
                          return CustomProductWidget(
                            height: height,
                            width: width,
                            product: state.products[index],
                          );
                        },
                        scrollDirection: Axis.vertical,
                      ),
                    );
                  }
                  return SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
