import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/app/fruit_hub.dart';
import 'package:fruit_hub/core/app/app_cubit/app_cubit.dart';
import 'package:fruit_hub/core/app/bloc_observer.dart';
import 'package:fruit_hub/core/app/internet_settings/connectivity_controller.dart';
import 'package:fruit_hub/core/common/widgets/error_widget.dart';
import 'package:fruit_hub/core/services/dependancy_injection/service_locator.dart';
import 'package:fruit_hub/core/widgets/custom_error_widget.dart';
import 'package:fruit_hub/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupGlobalConfigs();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupInjector();
  await ConnectivityController.instance.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return CustomErrorWidget(text: 'حدث خطأ ما، يرجى المحاولة لاحقًا');
  };
  runApp(
    const AppRoot(),
    // DevicePreview(enabled: true, builder: (context) => const AppRoot())
  );
}

void _setupGlobalConfigs() {
  flutterErrorWidget();
  AppBlocObserver.init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppCubit()..getLang(),
      child: const FruitHub(),
    );
  }
}
