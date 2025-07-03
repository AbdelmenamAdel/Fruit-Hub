import 'package:fruit_hub/core/services/dependancy_injection/service_locator.dart';
import 'package:fruit_hub/core/services/local/local_storage.dart';
import 'package:fruit_hub/core/services/local/secure_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

enum ThemeEnum { light, dark, system }

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  ThemeEnum appTheme = ThemeEnum.system;

//Theme Mode
  Future<void> changeAppThemeMode({ThemeEnum? selectedMode}) async {
    if (selectedMode != null) {
      appTheme = selectedMode;
    } else {
      // toggle manually between modes (for example, just dark/light)
      if (appTheme == ThemeEnum.light) {
        appTheme = ThemeEnum.dark;
      } else if (appTheme == ThemeEnum.dark) {
        appTheme = ThemeEnum.light;
      } else {
        appTheme = ThemeEnum.light;
      }
    }

    // Save selected mode to local storage
    sl<LocalStorage>().setString(SecureKeys.themeMode, appTheme.name);
    emit(ThemeChangeModeState(appTheme: appTheme));
  }

  Future<void> getSavedThemeMode() async {
    final cachedMode = sl<LocalStorage>().getString(SecureKeys.themeMode);
    if (cachedMode != null) {
      appTheme = ThemeEnum.values.firstWhere(
        (e) => e.name == cachedMode,
        orElse: () => ThemeEnum.system,
      );
    } else {
      appTheme = ThemeEnum.system;
    }
    emit(ThemeChangeModeState(appTheme: appTheme));
  }

  String langCode = 'en';

  //! get lang and set it in sharedPrefrances
  void updateLang(String code) {
    emit(ChangeLangLoading());
    langCode = code;
    sl<LocalStorage>().changLanguage(code);
    emit(ChangeLangSuccess());
  }

  //! update langauge and use it while starting app
  void getLang() {
    emit(ChangeLangLoading());
    final cachedLang = sl<LocalStorage>().getCachedLanguage();
    langCode = cachedLang;
    emit(ChangeLangSuccess());
  }
}
