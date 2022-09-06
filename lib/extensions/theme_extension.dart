import 'package:flutter/material.dart';

@immutable
class MyCustomTheme extends ThemeExtension<MyCustomTheme> {
  const MyCustomTheme({
    required this.brandColor,
    required this.dangerColor,
    required this.h1Text,
  });

  final Color? brandColor;
  final Color? dangerColor;
  final TextStyle? h1Text;

  @override
  MyCustomTheme copyWith(
      {Color? brandColor, Color? dangerColor, TextStyle? h1Text}) {
    return MyCustomTheme(
      brandColor: brandColor ?? this.brandColor,
      dangerColor: dangerColor ?? this.dangerColor,
      h1Text: h1Text ?? this.h1Text,
    );
  }

  @override
  MyCustomTheme lerp(ThemeExtension<MyCustomTheme>? other, double t) {
    if (other is! MyCustomTheme) {
      return this;
    }
    return MyCustomTheme(
      brandColor: Color.lerp(brandColor, other.brandColor, t),
      dangerColor: Color.lerp(dangerColor, other.dangerColor, t),
      h1Text: TextStyle.lerp(h1Text, other.h1Text, t),
    );
  }
}
