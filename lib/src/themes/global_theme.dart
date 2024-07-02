import 'package:flutter/material.dart';

import 'global_color.dart';

class GlobalTheme {
  static ThemeData theme() {
    return ThemeData(
        primaryColor: GlobalColor.primary,
        primaryColorDark: GlobalColor.primary,
        appBarTheme: const AppBarTheme(foregroundColor: GlobalColor.primary));
  }
}
