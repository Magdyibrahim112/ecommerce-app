import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:ecommerce_app/features/products_screen/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductWidget extends StatelessWidget {
  final double width;
  final double height;
  final ProductEntity product;

  const CustomProductWidget({
    super.key,
    required this.width,
    required this.height,
    required this.product
  });

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return "${words.sublist(0, 2).join(' ')}..";
    }
  }

  String truncateDescription(String description) {
    List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 4) {
      return description;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.productDetails, arguments: product),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.primary.withOpacity(0.3),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(14.r)),
                    child: Image.network(
                      product.imageCover ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.error)),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: HeartButton(onTap: () {}),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // العنوان
                    Text(
                      truncateTitle(product.title ?? ''),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getMediumStyle(
                        color: ColorManager.textColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    // الوصف
                    Text(
                      truncateDescription(product.description ?? ''),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getRegularStyle(
                        color: ColorManager.textColor,
                        fontSize: 12.sp, // تصغير الخط قليلاً لتوفير مساحة
                      ),
                    ),

                    // --- السعر (هذا هو الجزء الذي تم إصلاحه) ---
                    Row(
                      children: [
                        Text(
                          "EGP ${product.priceAfterDiscount ?? product.price}",
                          style: getRegularStyle(
                            color: ColorManager.textColor,
                            fontSize: 14.sp,
                          ),
                        ),
                        const SizedBox(width: 8),
                        // إظهار السعر القديم فقط إذا كان هناك خصم
                        if (product.priceAfterDiscount != null)
                          Text(
                            "${product.price}",
                            style: getTextWithLine(),
                          ),
                      ],
                    ),

                    // التقييم وزر الإضافة
                    Row(
                      children: [
                        Text(
                          "Review (${product.ratingsAverage})",
                          style: getRegularStyle(
                            color: ColorManager.textColor,
                            fontSize: 12.sp,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.star_rate_rounded,
                          color: ColorManager.starRateColor,
                          size: 16,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: ColorManager.primary,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
