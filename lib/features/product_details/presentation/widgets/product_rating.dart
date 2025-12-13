import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/product_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductRating extends StatefulWidget {
  final String productBuyers;
  final String productRating;
  final void Function(int) increment;
  final void Function(int) decrement;
  int quantity;
  ProductRating({super.key , required this.productBuyers , required this.productRating,
  required this.increment, required this.decrement, required this.quantity
  });

  @override
  State<ProductRating> createState() => _ProductRatingState();
}

class _ProductRatingState extends State<ProductRating> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(
                color: ColorManager.primary.withOpacity(.3),
                width: 1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding:
          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Text(
            '${widget.productBuyers} Sold',
            overflow: TextOverflow.ellipsis,
            style: getMediumStyle(color: ColorManager.primary)
                .copyWith(fontSize: 18.sp),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Image.asset(
          ImageAssets.rate,
          width: 30.w,
        ),
        SizedBox(
          width: 4.w,
        ),
        Expanded(
          child: Text(
            widget.productRating,
            overflow: TextOverflow.ellipsis,
            style:
            getMediumStyle(color: ColorManager.appBarTitleColor)
                .copyWith(fontSize: 14.sp),
          ),
        ),
        ProductCounter(add:widget.increment, remove: widget.decrement,
            productCounter: widget.quantity)
      ],
    );
  }
}

/// the originalCode in the top



//
// import 'package:ecommerce_app/core/resources/assets_manager.dart';
// import 'package:ecommerce_app/core/resources/color_manager.dart';
// import 'package:ecommerce_app/core/resources/styles_manager.dart';
// import 'package:ecommerce_app/core/widget/product_counter.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class ProductRating extends StatefulWidget {
//   final String productBuyers;
//   final String productRating;
//   final void Function(int) increment;
//   final void Function(int) decrement;
//   int quantity;
//   ProductRating({super.key , required this.productBuyers , required this.productRating,
//     required this.increment, required this.decrement, required this.quantity
//   });
//
//   @override
//   State<ProductRating> createState() => _ProductRatingState();
// }
//
// class _ProductRatingState extends State<ProductRating> {
//
//   @override
//   Widget build(BuildContext context) {
//     // ****  الحل النهائي يبدأ هنا ****
//     return FittedBox(
//       fit: BoxFit.scaleDown, // <--- هذا سيقوم بتقليص المحتوى إذا كان أكبر من الشاشة
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // --- عدد المبيعات ---
//           Container(
//             clipBehavior: Clip.antiAlias,
//             decoration: BoxDecoration(
//               border: Border.all(
//                   color: ColorManager.primary.withOpacity(.3),
//                   width: 1),
//               borderRadius: BorderRadius.circular(20.r),
//             ),
//             padding:
//             EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//             child: Text(
//               '${widget.productBuyers} Sold',
//               style: getMediumStyle(color: ColorManager.primary)
//                   .copyWith(fontSize: 18.sp),
//             ),
//           ),
//
//           // مسافة فاصلة بسيطة
//           SizedBox(width: 10.w),
//
//           // --- التقييم ---
//           Row(
//             children: [
//               Image.asset(
//                 ImageAssets.rate,
//                 width: 24.w,
//               ),
//               SizedBox(width: 4.w),
//               Text(
//                 widget.productRating,
//                 style:
//                 getMediumStyle(color: ColorManager.appBarTitleColor)
//                     .copyWith(fontSize: 14.sp),
//               ),
//             ],
//           ),
//
//           // مسافة فاصلة بسيطة
//           SizedBox(width: 10.w),
//
//           // --- عداد المنتج ---
//           ProductCounter(
//             add: widget.increment,
//             remove: widget.decrement,
//             productCounter: widget.quantity,
//           ),
//         ],
//       ),
//     );
//   }
// }
