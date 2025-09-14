import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/dependancy_injection/service_locator.dart';
import 'package:fruit_hub/features/products/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/features/products/repos/products_repo/products_repo.dart';

import 'widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(sl.get<ProductsRepo>()),
      child: const ProductsViewBody(),
    );
  }
}
