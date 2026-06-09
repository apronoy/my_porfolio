import 'package:flutter/material.dart';

class ScrollHelper {
  static void scrollTo(
    GlobalKey key,
  ) {
    if (key.currentContext == null) return;

    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(
        milliseconds: 700,
      ),
      curve: Curves.easeInOut,
    );
  }
}