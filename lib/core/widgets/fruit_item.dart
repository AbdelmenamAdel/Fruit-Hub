import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/products/entities/product_entity.dart';
import 'package:fruit_hub/core/styles/texts/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fruit_hub/core/widgets/custom_network_image.dart';
import 'package:fruit_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 40),
                productEntity.imageUrl != null
                    ? Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: CustomNetworkImage(
                            imageUrl: productEntity.imageUrl!,
                          ),
                        ),
                      )
                    : Container(
                        color: Colors.grey.shade400,
                        height: 125,
                        width: double.infinity,
                      ),

                // const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4.0,
                    left: 12.0,
                    right: 12.0,
                    bottom: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerRight,
                            child: Text(
                              productEntity.name,
                              textAlign: TextAlign.right,
                              style: TextStyles.semiBold13,
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerRight,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${productEntity.price} جنية ',
                                    style: TextStyles.bold13.copyWith(
                                      fontSize: 11,
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '/',
                                    style: TextStyles.bold13.copyWith(
                                      fontSize: 11,
                                      color: AppColors.lightSecondaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ',
                                    style: TextStyles.semiBold13.copyWith(
                                      fontSize: 11,
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'كيلو',
                                    style: TextStyles.semiBold13.copyWith(
                                      fontSize: 11,
                                      color: AppColors.lightSecondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<CartCubit>().addProduct(
                                productEntity,
                              );
                            },
                            child: Container(
                              // padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryColor,
                              ),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(Icons.add, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ListTile(
                //   contentPadding: EdgeInsets.zero,
                //   title: FittedBox(
                //     fit: BoxFit.scaleDown,
                //     alignment: Alignment.centerRight,
                //     child: Text(
                //       productEntity.name,
                //       textAlign: TextAlign.right,
                //       style: TextStyles.semiBold16,
                //     ),
                //   ),
                //   subtitle: FittedBox(
                //     fit: BoxFit.scaleDown,
                //     alignment: Alignment.centerRight,
                //     child: Text.rich(
                //       TextSpan(
                //         children: [
                //           TextSpan(
                //             text: '${productEntity.price}جنية ',
                //             style: TextStyles.bold13.copyWith(
                //               color: AppColors.secondaryColor,
                //             ),
                //           ),
                //           TextSpan(
                //             text: '/',
                //             style: TextStyles.bold13.copyWith(
                //               color: AppColors.lightSecondaryColor,
                //             ),
                //           ),
                //           TextSpan(
                //             text: ' ',
                //             style: TextStyles.semiBold13.copyWith(
                //               color: AppColors.secondaryColor,
                //             ),
                //           ),
                //           TextSpan(
                //             text: 'كيلو',
                //             style: TextStyles.semiBold13.copyWith(
                //               color: AppColors.lightSecondaryColor,
                //             ),
                //           ),
                //         ],
                //       ),
                //       textAlign: TextAlign.right,
                //     ),
                //   ),
                //   trailing: GestureDetector(
                //     onTap: () {
                //       context.read<CartCubit>().addProduct(productEntity);
                //     },
                //     child: Container(
                //       padding: const EdgeInsets.all(4),
                //       decoration: const BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: AppColors.primaryColor,
                //       ),
                //       child: Icon(Icons.add, color: Colors.white),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// class ShimmerFruitItem extends StatelessWidget {
//   const ShimmerFruitItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade300,
//       highlightColor: Colors.grey.shade100,
//       child: Container(
//         decoration: ShapeDecoration(
//           color: const Color(0xFFF3F5F7),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//         ),
//         child: Stack(
//           children: [
//             const Positioned(
//               top: 0,
//               right: 0,
//               child: Icon(Icons.favorite_outline, color: Colors.grey),
//             ),
//             Positioned.fill(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const SizedBox(height: 20),
//                   Expanded(
//                     child: Center(
//                       child: Container(
//                         height: 80,
//                         width: 80,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[300],
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   ListTile(
//                     contentPadding: const EdgeInsets.symmetric(horizontal: 8),
//                     title: Container(
//                       height: 12,
//                       width: double.infinity,
//                       color: Colors.grey[300],
//                     ),
//                     subtitle: Container(
//                       margin: const EdgeInsets.only(top: 8),
//                       height: 10,
//                       width: 60,
//                       color: Colors.grey[300],
//                     ),
//                     trailing: const CircleAvatar(
//                       backgroundColor: AppColors.primaryColor,
//                       child: Icon(Icons.add, color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ShimmerFruitItem extends StatelessWidget {
  const ShimmerFruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFFF3F5F7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Stack(
          children: [
            // Favorite icon placeholder
            const Positioned(
              top: 0,
              right: 0,
              child: Icon(Icons.favorite_outline, color: Colors.grey),
            ),

            Positioned.fill(
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  // Image placeholder
                  Flexible(
                    child: Container(
                      height: 125,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  // Text + Price placeholders
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 4.0,
                      left: 16.0,
                      right: 16.0,
                      bottom: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Name + Price placeholders
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 12,
                              width: 80,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(height: 6),
                            Container(
                              height: 10,
                              width: 60,
                              color: Colors.grey[300],
                            ),
                          ],
                        ),

                        // Add button placeholder
                        Container(
                          height: 32,
                          width: 32,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
