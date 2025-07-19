import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_error_widget.dart';
import 'package:fruit_hub/features/products/cubits/products_cubit/products_cubit.dart';

import 'products_grid_view.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          if (state.products.isEmpty) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 72.0),
                child: CustomErrorWidget(text: 'لا توجد منتجات لعرضها'),
              ),
            );
          }
          return ProductsGridView(products: state.products);
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.errMessage),
          );
        } else if (state is ProductsLoading) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 72.0),
              child: CustomErrorWidget(text: 'جار التحميل...'),
            ),
          );
        } else {
          return ShimmerProductsGridView();
        }
      },
    );
  }
}
