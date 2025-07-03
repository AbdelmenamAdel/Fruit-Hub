// import 'package:fruit_hub/core/routes/app_routes.dart';
// import 'package:fruit_hub/core/services/notificatioins/local_notfication_service.dart';
// import 'package:flutter/material.dart';

// class FirebaseMessagingNavigate {
//   // forground
//   static Future<void> forGroundHandler(RemoteMessage? message) async {
//     if (message != null) {
//       await LocalNotificationService.showSimpleNotification(
//         title: message.notification?.title ?? '',
//         body: message.notification?.body ?? '',
//         payload: message.data['productId'].toString(),
//       );
//     }
//   }

//   // background
//   static Future<void> backGroundHandler(RemoteMessage? message) async {
//     if (message != null) {
//       _navigate(message);
//     }
//   }

//   // terminated
//   static void terminatedHandler(RemoteMessage? message) {
//     if (message != null) {
//       _navigate(message);
//     }
//   }

//   static void _navigate(RemoteMessage message) {
//     if (int.parse(message.data['productId'].toString()) == -1) return;
//     sl<GlobalKey<NavigatorState>>().currentState!.context.pushName(
//           AppRoutes.productDetails,
//           arguments: int.parse(message.data['productId'].toString()),
//         );
//   }
// }
