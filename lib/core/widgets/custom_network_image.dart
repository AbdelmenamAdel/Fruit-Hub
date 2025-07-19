import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey,
              child: const Icon(Icons.error, color: Colors.red),
            );
          },
        ),
      ),
    );
  }
}
