import 'package:flutter/material.dart';
import 'package:fruit_hub/core/styles/images/app_images.dart';
import 'package:fruit_hub/core/styles/texts/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/cart_view.dart';
import 'package:fruit_hub/features/home/presentation/views/products_view.dart';
import 'home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [HomeView(), ProductsView(), CartView(), ProfileView()],
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBar(
            context,
            title: 'حسابي',
            showNotification: false,
            showBackButton: false,
          ),

          Row(
            spacing: 12,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(Assets.imagesProfile, fit: BoxFit.fill),
                  ),
                  Positioned(
                    bottom: -16,
                    right: 0,
                    left: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Color(0xffF9FAFA),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: IconButton(
                            onPressed: () {
                              print("object");
                            },
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('عبدالمنعم عادل', style: TextStyles.bold13.copyWith()),
                  Text(
                    'abdo.adel5@gmail.com',
                    style: TextStyles.regular13.copyWith(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text("الاعدادات", style: TextStyles.bold13.copyWith()),
        ],
      ),
    );
  }
}
