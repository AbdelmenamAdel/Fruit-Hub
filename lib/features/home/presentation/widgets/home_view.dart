import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
    //   child: const
    return HomeViewBody();
    // );
  }
}
