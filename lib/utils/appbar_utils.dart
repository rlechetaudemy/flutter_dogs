import 'dart:io';

import 'package:flutter/services.dart';

class AppBarUtils {
  // Para deixar system bar do iOS branca antes de setar uma appbar.
  // https://stackoverflow.com/questions/50501799/flutter-how-to-set-status-bar-color-when-appbar-not-present
  static setSystemBarWhiteColor() {
    if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarBrightness: Brightness.dark,
        ),
      );
    }
  }
}
