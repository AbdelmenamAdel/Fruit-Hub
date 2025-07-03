import 'package:flutter/material.dart';
import 'package:fruit_hub/core/routes/app_routes.dart';
import 'package:fruit_hub/core/styles/extensions/context_extension.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton.icon(
        label: Text('تسجيل الخروج'),
        icon: Icon(Icons.logout),
        onPressed: () async {
          // await FirebaseFirestore.instance
          //     .collection('users')
          //     .doc(FirebaseAuth.instance.currentUser!.uid)
          //     .delete();
          context.pushReplacementNamed(AppRoutes.login);
        },
      )),
    );
  }
}
