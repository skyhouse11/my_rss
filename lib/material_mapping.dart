import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

extension CustomMaterialTheme on FThemeData {
  // Modify this method to customize how FThemeData is mapped to Material ThemeData.
  //
  // To use this method:
  // ```dart
  // final theme = FTheme.zinc.light;
  //
  // MaterialApp(
  //   theme: theme.toCustomMaterialTheme(),
  // );
  // ```
  ThemeData toCustomMaterialTheme() {
    final textTheme =
        TextTheme(
          displayLarge: typography.xl4.copyWith(
            height: 1,
            textBaseline: typography.xl4.textBaseline ?? .alphabetic,
          ),
          displayMedium: typography.xl3.copyWith(
            height: 1,
            textBaseline: typography.xl3.textBaseline ?? .alphabetic,
          ),
          displaySmall: typography.xl2.copyWith(
            height: 1,
            textBaseline: typography.xl2.textBaseline ?? .alphabetic,
          ),
          headlineLarge: typography.xl3.copyWith(
            height: 1,
            textBaseline: typography.xl3.textBaseline ?? .alphabetic,
          ),
          headlineMedium: typography.xl2.copyWith(
            height: 1,
            textBaseline: typography.xl2.textBaseline ?? .alphabetic,
          ),
          headlineSmall: typography.xl.copyWith(
            height: 1,
            textBaseline: typography.xl.textBaseline ?? .alphabetic,
          ),
          titleLarge: typography.lg.copyWith(
            height: 1,
            textBaseline: typography.lg.textBaseline ?? .alphabetic,
          ),
          titleMedium: typography.base.copyWith(
            height: 1,
            textBaseline: typography.base.textBaseline ?? .alphabetic,
          ),
          titleSmall: typography.sm.copyWith(
            height: 1,
            textBaseline: typography.sm.textBaseline ?? .alphabetic,
          ),
          labelLarge: typography.base.copyWith(
            height: 1,
            textBaseline: typography.base.textBaseline ?? .alphabetic,
          ),
          labelMedium: typography.sm.copyWith(
            height: 1,
            textBaseline: typography.sm.textBaseline ?? .alphabetic,
          ),
          labelSmall: typography.xs.copyWith(
            height: 1,
            textBaseline: typography.xs.textBaseline ?? .alphabetic,
          ),
          bodyLarge: typography.base.copyWith(
            height: 1,
            textBaseline: typography.base.textBaseline ?? .alphabetic,
          ),
          bodyMedium: typography.sm.copyWith(
            height: 1,
            textBaseline: typography.sm.textBaseline ?? .alphabetic,
          ),
          bodySmall: typography.xs.copyWith(
            height: 1,
            textBaseline: typography.xs.textBaseline ?? .alphabetic,
          ),
        )..apply(
          fontFamily: typography.defaultFontFamily,
          bodyColor: colors.foreground,
          displayColor: colors.foreground,
        );
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: colors.brightness,
        primary: colors.primary,
        onPrimary: colors.primaryForeground,
        secondary: colors.secondary,
        onSecondary: colors.secondaryForeground,
        error: colors.error,
        onError: colors.errorForeground,
        surface: colors.background,
        onSurface: colors.foreground,
        secondaryContainer: colors.secondary,
        onSecondaryContainer: colors.secondaryForeground,
      ),
      fontFamily: typography.defaultFontFamily,
      typography: Typography(
        black: textTheme,
        white: textTheme,
        englishLike: textTheme,
        dense: textTheme,
        tall: textTheme,
      ),
      textTheme: textTheme,
      splashFactory: NoSplash.splashFactory,
      useMaterial3: true,
      navigationBarTheme: NavigationBarThemeData(
        indicatorShape: RoundedRectangleBorder(
          borderRadius: style.borderRadius,
        ),
      ),
      navigationDrawerTheme: NavigationDrawerThemeData(
        indicatorShape: RoundedRectangleBorder(
          borderRadius: style.borderRadius,
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        indicatorShape: RoundedRectangleBorder(
          borderRadius: style.borderRadius,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: style.borderRadius,
          side: BorderSide(width: style.borderWidth, color: colors.border),
        ),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: style.borderRadius),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: WidgetStateInputBorder.resolveWith(
          textFieldStyle.border.resolve,
        ),
        labelStyle: textFieldStyle.descriptionTextStyle.maybeResolve({}),
        floatingLabelStyle: textFieldStyle.labelTextStyle.maybeResolve({}),
        hintStyle: textFieldStyle.hintTextStyle.maybeResolve({}),
        errorStyle: textFieldStyle.errorTextStyle,
        helperStyle: textFieldStyle.descriptionTextStyle.maybeResolve({}),
        counterStyle: textFieldStyle.counterTextStyle.maybeResolve({}),
        contentPadding: textFieldStyle.contentPadding,
      ),
      datePickerTheme: DatePickerThemeData(
        shape: RoundedRectangleBorder(borderRadius: style.borderRadius),
        dayShape: .all(
          RoundedRectangleBorder(borderRadius: style.borderRadius),
        ),
        rangePickerShape: RoundedRectangleBorder(
          borderRadius: style.borderRadius,
        ),
      ),
      timePickerTheme: TimePickerThemeData(
        hourMinuteTextColor: colors.secondaryForeground,
        hourMinuteColor: colors.secondary,
        hourMinuteShape: RoundedRectangleBorder(
          borderRadius: style.borderRadius,
        ),
        dayPeriodTextColor: colors.foreground,
        dayPeriodColor: colors.secondary,
        dayPeriodBorderSide: BorderSide(color: colors.border),
        dayPeriodShape: RoundedRectangleBorder(
          borderRadius: style.borderRadius,
        ),
        dialBackgroundColor: colors.secondary,
        shape: RoundedRectangleBorder(borderRadius: style.borderRadius),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: sliderStyles.horizontalStyle.activeColor.maybeResolve(
          {},
        ),
        inactiveTrackColor: sliderStyles.horizontalStyle.inactiveColor
            .maybeResolve({}),
        disabledActiveTrackColor: sliderStyles.horizontalStyle.activeColor
            .maybeResolve({WidgetState.disabled}),
        disabledInactiveTrackColor: sliderStyles.horizontalStyle.inactiveColor
            .maybeResolve({WidgetState.disabled}),
        activeTickMarkColor: sliderStyles.horizontalStyle.markStyle.tickColor
            .maybeResolve({}),
        inactiveTickMarkColor: sliderStyles.horizontalStyle.markStyle.tickColor
            .maybeResolve({}),
        disabledActiveTickMarkColor: sliderStyles
            .horizontalStyle
            .markStyle
            .tickColor
            .maybeResolve({WidgetState.disabled}),
        disabledInactiveTickMarkColor: sliderStyles
            .horizontalStyle
            .markStyle
            .tickColor
            .maybeResolve({WidgetState.disabled}),
        thumbColor: sliderStyles.horizontalStyle.thumbStyle.borderColor
            .maybeResolve({}),
        disabledThumbColor: sliderStyles.horizontalStyle.thumbStyle.borderColor
            .maybeResolve({WidgetState.disabled}),
        valueIndicatorColor:
            sliderStyles.horizontalStyle.tooltipStyle.decoration.color,
        valueIndicatorTextStyle:
            sliderStyles.horizontalStyle.tooltipStyle.textStyle,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: switchStyle.thumbColor,
        trackColor: switchStyle.trackColor,
        trackOutlineColor: switchStyle.trackColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: buttonStyles.secondary.contentStyle.textStyle,
          backgroundColor: WidgetStateColor.resolveWith(
            (states) =>
                buttonStyles.secondary.decoration.maybeResolve(states)?.color ??
                colors.secondary,
          ),
          foregroundColor: WidgetStateColor.resolveWith(
            (states) =>
                buttonStyles.secondary.contentStyle.textStyle
                    .maybeResolve(states)
                    ?.color ??
                colors.secondaryForeground,
          ),
          padding: .all(buttonStyles.secondary.contentStyle.padding),
          shape: .all(RoundedRectangleBorder(borderRadius: style.borderRadius)),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          textStyle: buttonStyles.primary.contentStyle.textStyle,
          backgroundColor: WidgetStateColor.resolveWith(
            (states) =>
                buttonStyles.primary.decoration.maybeResolve(states)?.color ??
                colors.secondary,
          ),
          foregroundColor: WidgetStateColor.resolveWith(
            (states) =>
                buttonStyles.secondary.decoration.maybeResolve(states)?.color ??
                colors.secondaryForeground,
          ),
          padding: .all(buttonStyles.primary.contentStyle.padding),
          shape: .all(RoundedRectangleBorder(borderRadius: style.borderRadius)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: buttonStyles.outline.contentStyle.textStyle,
          backgroundColor: WidgetStateColor.resolveWith(
            (states) =>
                buttonStyles.outline.decoration.maybeResolve(states)?.color ??
                Colors.transparent,
          ),
          foregroundColor: WidgetStateColor.resolveWith(
            (states) =>
                buttonStyles.outline.decoration.maybeResolve(states)?.color ??
                Colors.transparent,
          ),
          padding: .all(buttonStyles.outline.contentStyle.padding),
          side: WidgetStateBorderSide.resolveWith((states) {
            final border = buttonStyles.outline.decoration
                .maybeResolve(states)
                ?.border;
            return BorderSide(
              color:
                  border?.top.color ??
                  switch (states) {
                    _ when states.contains(WidgetState.disabled) =>
                      colors.disable(colors.border),
                    _ when states.contains(WidgetState.hovered) => colors.hover(
                      colors.border,
                    ),
                    _ => colors.border,
                  },
              width: border?.top.width ?? style.borderWidth,
            );
          }),
          shape: WidgetStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius:
                  buttonStyles.outline.decoration
                      .maybeResolve(states)
                      ?.borderRadius ??
                  style.borderRadius,
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: buttonStyles.ghost.contentStyle.textStyle,
          backgroundColor: WidgetStateColor.resolveWith(
            (states) =>
                buttonStyles.ghost.decoration.maybeResolve(states)?.color ??
                Colors.transparent,
          ),
          foregroundColor: WidgetStateColor.resolveWith(
            (states) =>
                buttonStyles.ghost.contentStyle.textStyle
                    .maybeResolve(states)
                    ?.color ??
                colors.secondaryForeground,
          ),
          shape: WidgetStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius:
                  buttonStyles.ghost.decoration
                      .maybeResolve(states)
                      ?.borderRadius ??
                  style.borderRadius,
            ),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: buttonStyles.primary.decoration
            .maybeResolve(const {})
            ?.color,
        foregroundColor: buttonStyles.primary.contentStyle.textStyle
            .maybeResolve(const {})
            ?.color,
        hoverColor: buttonStyles.primary.decoration.maybeResolve(const {
          WidgetState.hovered,
        })?.color,
        disabledElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius:
              buttonStyles.primary.decoration
                  .maybeResolve(const {})
                  ?.borderRadius ??
              style.borderRadius,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateColor.resolveWith(
            (states) =>
                buttonStyles.ghost.decoration.maybeResolve(states)?.color ??
                Colors.transparent,
          ),
          foregroundColor: WidgetStateColor.resolveWith(
            (states) =>
                buttonStyles.ghost.contentStyle.textStyle
                    .maybeResolve(states)
                    ?.color ??
                colors.secondaryForeground,
          ),
          shape: WidgetStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius:
                  buttonStyles.ghost.decoration
                      .maybeResolve(states)
                      ?.borderRadius ??
                  style.borderRadius,
            ),
          ),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          textStyle: buttonStyles.ghost.contentStyle.textStyle,
          backgroundColor: WidgetStateColor.resolveWith(
            (states) =>
                buttonStyles.ghost.decoration.maybeResolve(states)?.color ??
                Colors.transparent,
          ),
          foregroundColor: WidgetStateColor.resolveWith(
            (states) =>
                buttonStyles.ghost.contentStyle.textStyle
                    .maybeResolve(states)
                    ?.color ??
                colors.secondaryForeground,
          ),
          shape: WidgetStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius:
                  buttonStyles.ghost.decoration
                      .maybeResolve(states)
                      ?.borderRadius ??
                  style.borderRadius,
            ),
          ),
        ),
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(borderRadius: style.borderRadius),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(borderRadius: style.borderRadius),
      ),
      snackBarTheme: SnackBarThemeData(
        shape: RoundedRectangleBorder(borderRadius: style.borderRadius),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(borderRadius: style.borderRadius),
      ),
      dividerTheme: DividerThemeData(
        color: dividerStyles.horizontalStyle.color,
        thickness: dividerStyles.horizontalStyle.width,
      ),
      iconTheme: IconThemeData(color: colors.primary, size: 20),
    );
  }
}
