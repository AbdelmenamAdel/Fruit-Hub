// import 'dart:async';
// import 'package:fruit_hub/core/routes/app_routes.dart';
// import 'package:flutter/material.dart';

// class LocalNotificationService {
//   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   //initial notification with android and ios

//   static Future<void> init() async {
//     const settings = InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       iOS: DarwinInitializationSettings(),
//     );

//     await flutterLocalNotificationsPlugin.initialize(
//       settings,
//       onDidReceiveNotificationResponse: onTap,
//     );
//   }

//   static void onTap(NotificationResponse notificationResponse) {
//     // navigator
//     if (int.parse(notificationResponse.payload.toString()) != -1) {
//       sl<GlobalKey<NavigatorState>>().currentState!.context.pushName(
//             AppRoutes.productDetails,
//             arguments: int.parse(notificationResponse.payload.toString()),
//           );
//     }
//   }

//   static Future<void> showSimpleNotification({
//     required String title,
//     required String body,
//     required String payload,
//   }) async {
//     const notificationDetails = NotificationDetails(
//       android: AndroidNotificationDetails(
//         'shopify-id',
//         'shopify-name',
//         channelDescription: 'shopify-channel',
//         importance: Importance.max,
//         priority: Priority.high,
//         icon: '@mipmap/ic_launcher',
//       ),
//       iOS: DarwinNotificationDetails(
//         presentAlert: true,
//         presentBadge: true,
//         presentSound: true,
//       ),
//     );
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       notificationDetails,
//       payload: payload,
//     );
//   }
// }
