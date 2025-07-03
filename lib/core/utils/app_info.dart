import 'package:fruit_hub/core/language/app_Localizations.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  const AppInfo._();

  static Future<String> getAppVersion(BuildContext context) async {
    var buildNumberText = '';

    if (!AppLocalizations.of(context)!.isEnLocale) {
      final packgeInfo = await PackageInfo.fromPlatform();
      buildNumberText = '(${packgeInfo.buildNumber}) ${packgeInfo.version}';
    } else {
      final packgeInfo = await PackageInfo.fromPlatform();
      buildNumberText = '${packgeInfo.version} (${packgeInfo.buildNumber})';
    }

    return buildNumberText;
  }
}
