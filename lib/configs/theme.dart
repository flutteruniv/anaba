import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = Provider(
  (ref) {
    const backgroundColor = Color(0xfffffbf3);
    const primaryColor = Color(0xff363237);
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xfffffbf3),
      primaryColor: primaryColor,
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: primaryColor,
            secondary: primaryColor,
          ),
      dialogTheme: const DialogTheme(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  },
);
