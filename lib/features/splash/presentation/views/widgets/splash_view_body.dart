import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/backend/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/dependancy_injection/service_locator.dart';
import 'package:fruit_hub/core/styles/extensions/context_extension.dart';
import 'package:fruit_hub/core/routes/app_routes.dart';
import 'package:fruit_hub/core/services/local/local_storage.dart';
import 'package:fruit_hub/core/styles/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNaviagtion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          Assets.imagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void excuteNaviagtion() {
    bool isOnBoardingViewSeen =
        sl<LocalStorage>().getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        var isLoggedIn = FirebaseAuthService().isLoggedIn();

        if (isLoggedIn) {
          if (mounted) {
            context.pushReplacementNamed(AppRoutes.main);
          }
        } else {
          if (mounted) {
            context.pushReplacementNamed(AppRoutes.login);
          }
        }
      } else {
        if (mounted) {
          context.pushReplacementNamed(AppRoutes.onBoarding);
        }
      }
    });
  }
}
