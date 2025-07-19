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
                SizedBox(height: 36),
                productEntity.imageUrl != null
                    ? Flexible(
                        child: CustomNetworkImage(
                          imageUrl: productEntity.imageUrl!,
                        ),
                      )
                    : Container(color: Colors.grey, height: 100, width: 100),
                // const SizedBox(height: 12),
                ListTile(
                  title: Text(
                    productEntity.name,
                    textAlign: TextAlign.right,
                    style: TextStyles.semiBold16,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${productEntity.price}جنية ',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: 'كيلو',
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().addProduct(productEntity);
                    },
                    child: const CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
            const Positioned(
              top: 0,
              right: 0,
              child: Icon(Icons.favorite_outline, color: Colors.grey),
            ),
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: Center(
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    title: Container(
                      height: 12,
                      width: double.infinity,
                      color: Colors.grey[300],
                    ),
                    subtitle: Container(
                      margin: const EdgeInsets.only(top: 8),
                      height: 10,
                      width: 60,
                      color: Colors.grey[300],
                    ),
                    trailing: const CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(Icons.add, color: Colors.white),
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
