import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppStyle {
  static const fontName = 'Roboto';

  static const double fontSizeSmall = 11;
  static const double fontSizeNormal = 13;
  static const double fontSizeMedian = 15;
  static const double fontSizeLarge = 17;
  static const double fontSizeHuge = 19;
  static const double fontSizeExtreme = 24;

  static TextStyle get regular => const TextStyle(
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );

  static TextStyle get black => const TextStyle(
        fontFamily: fontName,
        fontWeight: FontWeight.w900,
        color: Colors.black,
      );

  static TextStyle get bold => const TextStyle(
        fontFamily: fontName,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      );

  static TextStyle get semiBold => const TextStyle(
        fontFamily: fontName,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );

  static TextStyle get light => const TextStyle(
        fontFamily: fontName,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      );

  static TextStyle get medium => const TextStyle(
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );

  static TextStyle get thin => const TextStyle(
        fontFamily: fontName,
        fontWeight: FontWeight.w100,
        color: Colors.black,
      );

  static TextStyle get smallRegular => regular.copyWith(
        fontSize: fontSizeSmall,
      );

  static TextStyle get normalRegular => regular.copyWith(
        fontSize: fontSizeNormal,
      );

  static TextStyle get medianRegular => regular.copyWith(
        fontSize: fontSizeMedian,
      );

  static TextStyle get largeRegular => regular.copyWith(
        fontSize: fontSizeLarge,
      );

  static TextStyle get hugeRegular => regular.copyWith(
        fontSize: fontSizeHuge,
      );

  static TextStyle get exTremeRegular => regular.copyWith(
        fontSize: fontSizeExtreme,
      );

  static TextStyle get smallBold => bold.copyWith(
        fontSize: fontSizeSmall,
      );

  static TextStyle get normalBold => bold.copyWith(
        fontSize: fontSizeNormal,
      );

  static TextStyle get medianBold => bold.copyWith(
        fontSize: fontSizeMedian,
      );

  static TextStyle get largeBold => bold.copyWith(
        fontSize: fontSizeLarge,
      );

  static TextStyle get hugeBold => bold.copyWith(
        fontSize: fontSizeHuge,
      );

  static TextStyle get exTremeBold => bold.copyWith(
        fontSize: fontSizeExtreme,
      );

  static TextStyle get smallSemiBold => semiBold.copyWith(
        fontSize: fontSizeSmall,
      );

  static TextStyle get normalSemiBold => semiBold.copyWith(
        fontSize: fontSizeNormal,
      );

  static TextStyle get medianSemiBold => semiBold.copyWith(
        fontSize: fontSizeMedian,
      );

  static TextStyle get largeSemiBold => semiBold.copyWith(
        fontSize: fontSizeLarge,
      );

  static TextStyle get hugeSemiBold => semiBold.copyWith(
        fontSize: fontSizeHuge,
      );

  static TextStyle get smallLight => light.copyWith(
        fontSize: fontSizeSmall,
      );

  static TextStyle get normalLight => light.copyWith(
        fontSize: fontSizeNormal,
      );

  static TextStyle get medianLight => light.copyWith(
        fontSize: fontSizeMedian,
      );

  static TextStyle get largeLight => light.copyWith(
        fontSize: fontSizeLarge,
      );

  static TextStyle get hugeLight => light.copyWith(
        fontSize: fontSizeHuge,
      );

  static TextStyle get smallMedium => medium.copyWith(
        fontSize: fontSizeSmall,
      );

  static TextStyle get normalMedium => medium.copyWith(
        fontSize: fontSizeNormal,
      );

  static TextStyle get medianMedium => medium.copyWith(
        fontSize: fontSizeMedian,
      );

  static TextStyle get largeMedium => medium.copyWith(
        fontSize: fontSizeLarge,
      );

  static TextStyle get hugeMedium => medium.copyWith(
        fontSize: fontSizeHuge,
      );

  static TextStyle get smallThin => thin.copyWith(
        fontSize: fontSizeSmall,
      );

  static TextStyle get normalThin => thin.copyWith(
        fontSize: fontSizeNormal,
      );

  static TextStyle get medianThin => thin.copyWith(
        fontSize: fontSizeMedian,
      );

  static TextStyle get largeThin => thin.copyWith(
        fontSize: fontSizeLarge,
      );

  static TextStyle get hugeThin => thin.copyWith(
        fontSize: fontSizeHuge,
      );

  static TextStyle get smallBlack => black.copyWith(
        fontSize: fontSizeSmall,
      );

  static TextStyle get normalBlack => black.copyWith(
        fontSize: fontSizeNormal,
      );

  static TextStyle get medianBlack => black.copyWith(
        fontSize: fontSizeMedian,
      );

  static TextStyle get largeBlack => black.copyWith(
        fontSize: fontSizeLarge,
      );

  static TextStyle get hugeBlack => black.copyWith(
        fontSize: fontSizeHuge,
      );

  static TextStyle get extremeBlack => black.copyWith(
        fontSize: fontSizeExtreme,
      );
}
