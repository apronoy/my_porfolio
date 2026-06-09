import 'package:flutter/material.dart';

import 'responsive.dart';

class FontSizes {

  static double heroTitle(
      BuildContext context) {

    if (Responsive.isMobile(context)) {
      return 36;
    }

    if (Responsive.isTablet(context)) {
      return 46;
    }

    return 58;
  }
}