import 'package:fruit_hub/core/styles/images/app_images.dart';
import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(170, 74, 74, 74),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesWifiOff),
          ],
        ),
      ),
    );
  }
}
