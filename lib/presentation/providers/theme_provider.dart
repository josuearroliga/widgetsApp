import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final isDarkModeEnabled = StateProvider((ref) => false);
final colorListProvider = Provider((ref) => colorList);
final colorSelectedProvider = StateProvider((ref) => 0);
