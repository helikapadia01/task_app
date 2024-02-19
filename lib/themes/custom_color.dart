import 'package:flutter/material.dart';

const ontertiary = Color(0xFFFFFFFF);
const error = Color(0xFFF44336);

CustomColors lightCustomColors = const CustomColors(
  sourceOntertiary: Color(0xFFFFFFFF),
  ontertiary: Color(0xFF006874),
  onOntertiary: Color(0xFFFFFFFF),
  ontertiaryContainer: Color(0xFF97F0FF),
  onOntertiaryContainer: Color(0xFF001F24),
  sourceError: Color(0xFFF44336),
  error: Color(0xFFBB1614),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD5),
  onErrorContainer: Color(0xFF410001),
);

CustomColors darkCustomColors = const CustomColors(
  sourceOntertiary: Color(0xFFFFFFFF),
  ontertiary: Color(0xFF4FD8EB),
  onOntertiary: Color(0xFF00363D),
  ontertiaryContainer: Color(0xFF004F58),
  onOntertiaryContainer: Color(0xFF97F0FF),
  sourceError: Color(0xFFF44336),
  error: Color(0xFFFFB4A9),
  onError: Color(0xFF690002),
  errorContainer: Color(0xFF930005),
  onErrorContainer: Color(0xFFFFDAD5),
);

/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceOntertiary,
    required this.ontertiary,
    required this.onOntertiary,
    required this.ontertiaryContainer,
    required this.onOntertiaryContainer,
    required this.sourceError,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
  });

  final Color? sourceOntertiary;
  final Color? ontertiary;
  final Color? onOntertiary;
  final Color? ontertiaryContainer;
  final Color? onOntertiaryContainer;
  final Color? sourceError;
  final Color? error;
  final Color? onError;
  final Color? errorContainer;
  final Color? onErrorContainer;

  @override
  CustomColors copyWith({
    Color? sourceOntertiary,
    Color? ontertiary,
    Color? onOntertiary,
    Color? ontertiaryContainer,
    Color? onOntertiaryContainer,
    Color? sourceError,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
  }) {
    return CustomColors(
      sourceOntertiary: sourceOntertiary ?? this.sourceOntertiary,
      ontertiary: ontertiary ?? this.ontertiary,
      onOntertiary: onOntertiary ?? this.onOntertiary,
      ontertiaryContainer: ontertiaryContainer ?? this.ontertiaryContainer,
      onOntertiaryContainer:
          onOntertiaryContainer ?? this.onOntertiaryContainer,
      sourceError: sourceError ?? this.sourceError,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceOntertiary: Color.lerp(sourceOntertiary, other.sourceOntertiary, t),
      ontertiary: Color.lerp(ontertiary, other.ontertiary, t),
      onOntertiary: Color.lerp(onOntertiary, other.onOntertiary, t),
      ontertiaryContainer:
          Color.lerp(ontertiaryContainer, other.ontertiaryContainer, t),
      onOntertiaryContainer:
          Color.lerp(onOntertiaryContainer, other.onOntertiaryContainer, t),
      sourceError: Color.lerp(sourceError, other.sourceError, t),
      error: Color.lerp(error, other.error, t),
      onError: Color.lerp(onError, other.onError, t),
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t),
      onErrorContainer: Color.lerp(onErrorContainer, other.onErrorContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith();
  }
}
