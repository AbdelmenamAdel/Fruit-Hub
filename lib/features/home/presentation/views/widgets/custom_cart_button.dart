import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_snackbar.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import '../../cubits/cart_item_cubit/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
              // Navigator.pushNamed(
              //   context,
              //   CheckoutView.routeName,
              //   arguments: context.read<CartCubit>().cartEntity,
              // );
            } else {
              showBar(context, 'لا يوجد منتجات في السلة');
            }
          },
          text: 'الدفع 16 جنيه',
          // 'الدفع  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه',
        );
      },
    );
  }
}
