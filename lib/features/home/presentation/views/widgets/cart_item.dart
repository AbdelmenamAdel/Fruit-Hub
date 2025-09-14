import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/styles/images/app_images.dart';
import 'package:fruit_hub/core/styles/texts/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/widgets/custom_network_image.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruit_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:svg_flutter/svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.carItemEntity});

  final CartItemEntity carItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == carItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  width: 80,
                  padding: const EdgeInsets.all(3),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F5F7),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: CustomNetworkImage(
                    // imageUrl: carItemEntity.productEntity.imageUrl!,
                    imageUrl:
                        'https://t4.ftcdn.net/jpg/02/27/04/15/240_F_227041521_R30fm1zPGoX3hQeGkGgFAKykT5irrv79.jpg',
                  ),
                ),
              ),
              const SizedBox(width: 17),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          carItemEntity.productEntity.name,
                          style: TextStyles.bold13,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().deleteCarItem(
                              carItemEntity,
                            );
                          },
                          child: SvgPicture.asset(Assets.imagesTrash),
                        ),
                      ],
                    ),
                    Text(
                      '${carItemEntity.calculateTotalWeight()} كم',
                      textAlign: TextAlign.right,
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        CartItemActionButtons(cartItemEntity: carItemEntity),
                        const Spacer(),
                        Text(
                          '${carItemEntity.calculateTotalPrice()} جنيه ',
                          style: TextStyles.bold16.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
