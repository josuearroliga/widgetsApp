import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final isDarkModeEnabled = StateProvider((ref) => false);
final colorListProvider = Provider((ref) => colorList);
final colorSelectedProvider = StateProvider((ref) => 0);

//Un objeto de tipo AppTheme custom
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

//Controller o notifier.
class ThemeNotifier extends StateNotifier<AppTheme> {
  //State = estado =new AppTheme()
  ThemeNotifier() : super(AppTheme());
  void toggleDarkMode() {
    state = state.copyWith(darkModeEnabled: !state.darkModeEnabled);
  }

  void toggleColor(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
