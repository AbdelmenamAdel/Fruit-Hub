import 'package:flutter/material.dart';
import 'package:fruit_hub/core/styles/texts/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FittedBox(
            child: Text(
              'تسوق الان',
              style: TextStyles.bold13.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
