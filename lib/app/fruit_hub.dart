import 'package:fruit_hub/core/Routes/app_routes.dart';
import 'package:fruit_hub/core/app/internet_settings/connectivity_controller.dart';
import 'package:fruit_hub/core/app/internet_settings/no_internet.dart';
import 'package:fruit_hub/core/language/app_Localizations.dart';
import 'package:fruit_hub/core/app/app_cubit/app_cubit.dart';
import 'package:fruit_hub/core/styles/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          // final cubit = context.read<AppCubit>();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', "US"),
              Locale('ar', "EG"),
            ],
            locale: Locale('ar', 'EG'
                // cubit.langCode,
                ),
            theme: themeLight(),
            darkTheme: themeDark(),
            themeMode: _getThemeMode(context.watch<AppCubit>().appTheme),
            builder: (context, child) => Stack(
              children: [
                if (child != null) child,
                ValueListenableBuilder(
                  valueListenable: ConnectivityController.instance.isConnected,
                  builder: (context, value, child) {
                    if (value) {
                      return const SizedBox.shrink();
                    } else {
                      return const NoInternet();
                    }
                  },
                ),
              ],
            ),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: AppRoutes.initial,
          );
        },
      ),
    );
  }

  ThemeMode _getThemeMode(ThemeEnum mode) {
    switch (mode) {
      case ThemeEnum.light:
        return ThemeMode.light;
      case ThemeEnum.dark:
        return ThemeMode.dark;
      case ThemeEnum.system:
        return ThemeMode.system;
    }
  }
}
