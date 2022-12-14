import 'package:thegoatjp/src/h.dart';

extension ButtonStyleExt on BuildContext {
  ButtonStyle? stadium({String? color}) => ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
      ).copyWith(
        backgroundColor: MaterialStateProperty.all(color?.toColor() ??
            Theme.of(this).buttonTheme.colorScheme?.background),
      );

  ButtonStyle? stadiumEnableDisable(bool isEnabled) => stadium(
        color: isEnabled
            ? primaryColor()?.toHex()
            : ColorManifest.LIGHT_BACKGROUND,
      )?.copyWith(
        textStyle: MaterialStateProperty.all(
          primaryCta()?.copyWith(
            color: isEnabled
                ? primaryColor()
                : ColorManifest.DARK_GREY_COLOR.toColor(),
          ),
        ),
      );

  ButtonStyle? roundedCornerEnableDisable(
    BuildContext context,
    bool isEnabled,
  ) =>
      ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: smallBorderRadius(),
            side: BorderSide(
              color: isEnabled
                  ? context.primaryColor() ??
                      ColorManifest.LIGHT_PRIMARY_RED.toColor()
                  : ColorManifest.EXTRA_DARK_GREY_COLOR.toColor(),
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          isEnabled ? context.primaryColor() : context.colorBackground(),
        ),
        textStyle: MaterialStateProperty.all(
          primaryCta()?.copyWith(
            color: isEnabled
                ? ColorManifest.LIGHT_TEXT_COLOR.toColor()
                : ColorManifest.EXTRA_DARK_GREY_COLOR.toColor(),
          ),
        ),
      );
}

extension RadiusExt on void {
  BorderRadiusGeometry smallBorderRadius() => BorderRadius.all(smallRadius());

  BorderRadiusGeometry extraSmallBorderRadius() =>
      BorderRadius.all(extraSmallRadius());

  BorderRadiusGeometry standardBorderRadius() =>
      BorderRadius.all(standardRadius());

  BorderRadiusGeometry standardTopBorderRadius() => BorderRadius.only(
        topLeft: standardRadius(),
        topRight: standardRadius(),
      );

  BorderRadiusGeometry extraBorderRadius() => BorderRadius.all(extraRadius());

  Radius extraSmallRadius() =>
      Radius.circular(DimensionsManifest.PERCENT_0_5.h);

  Radius smallRadius() => Radius.circular(DimensionsManifest.PERCENT_1.h);

  Radius standardRadius() => Radius.circular(DimensionsManifest.PERCENT_2_5.h);

  Radius extraRadius() => Radius.circular(DimensionsManifest.PERCENT_4.h);
}

extension ThemeExt on BuildContext {
  Color? primaryColor() => Theme.of(this).primaryColor;

  Color colorBackground() => Theme.of(this).backgroundColor;
}

extension ColorExt on void {
  Color subTextColor() => ColorManifest.SUB_TEXT_COLOR.toColor();

  Color lightTextColor() => ColorManifest.LIGHT_TEXT_COLOR.toColor();

  Color lightTitleColor() => ColorManifest.LIGHT_TITLE_COLOR.toColor();

  Color extraLightTextColor() => ColorManifest.EXTRA_LIGHT_TEXT_COLOR.toColor();

  Color darkTextColor() => ColorManifest.DARK_TEXT_COLOR.toColor();

  Color white() => ColorManifest.WHITE_COLOR.toColor();

  Color darkGrey() => ColorManifest.DARK_GREY_COLOR.toColor();

  Color extraDarkGrey() => ColorManifest.EXTRA_DARK_GREY_COLOR.toColor();

  Color lightDarkGrey() => ColorManifest.LIGHT_GREY_COLOR.toColor();

  Color black() => ColorManifest.BLACK_COLOR.toColor();

  Color lightRed() => ColorManifest.LIGHT_PRIMARY_RED.toColor();

  Color dividerColor() => ColorManifest.DIVIDER_COLOR.toColor();

  Color darkBackgroundColor() => ColorManifest.DARK_BACKGROUND.toColor();
}

extension TextStyleExt on BuildContext {
  TextStyle? headline({String? color}) =>
      Theme.of(this).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: DimensionsManifest.FONT_H0,
            color:
                color?.toColor() ?? Theme.of(this).textTheme.titleLarge?.color,
          );

  TextStyle? subHeadline({String? color}) =>
      Theme.of(this).textTheme.subtitle2?.copyWith(
            fontSize: DimensionsManifest.FONT_H4,
            color:
                color?.toColor() ?? Theme.of(this).textTheme.subtitle2?.color,
          );

  TextStyle? primaryCta() => Theme.of(this).textTheme.button?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: DimensionsManifest.FONT_B1,
      );

  TextStyle? secondaryCta() =>
      primaryCta()?.copyWith(color: ColorManifest.LIGHT_TEXT_COLOR.toColor());

  TextStyle? primaryCta2() => Theme.of(this).textTheme.button?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: DimensionsManifest.FONT_B2,
      );

  TextStyle? primaryCta3() => Theme.of(this).textTheme.button?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: DimensionsManifest.FONT_B3,
      );

  TextStyle? primaryCta4() => Theme.of(this).textTheme.button?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: DimensionsManifest.FONT_B4,
      );

  TextStyle? primaryCta5() => Theme.of(this).textTheme.button?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: DimensionsManifest.FONT_B5,
      );

  TextStyle? primaryCta6() => Theme.of(this).textTheme.button?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: DimensionsManifest.FONT_B6,
      );

  TextStyle? primaryCtaEnableDisable(bool isEnabled) =>
      Theme.of(this).textTheme.button?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: DimensionsManifest.FONT_B1,
            color: isEnabled ? darkTextColor() : lightTextColor(),
          );

  TextStyle? bodyTitle1({String? color}) =>
      Theme.of(this).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: DimensionsManifest.FONT_H3,
            color:
                color?.toColor() ?? Theme.of(this).textTheme.titleLarge?.color,
          );

  TextStyle? bodyTitle2({String? color}) =>
      Theme.of(this).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: DimensionsManifest.FONT_H4,
            color:
                color?.toColor() ?? Theme.of(this).textTheme.titleLarge?.color,
          );

  TextStyle? bodyTitle5({String? color}) =>
      Theme.of(this).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: DimensionsManifest.FONT_H5,
            color:
                color?.toColor() ?? Theme.of(this).textTheme.titleLarge?.color,
          );

  TextStyle? bodyTitle7({String? color}) =>
      Theme.of(this).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: DimensionsManifest.FONT_H7,
            color:
                color?.toColor() ?? Theme.of(this).textTheme.titleLarge?.color,
          );

  TextStyle? body1({String? color}) =>
      Theme.of(this).textTheme.bodyText2?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: DimensionsManifest.FONT_B1,
            color:
                color?.toColor() ?? Theme.of(this).textTheme.bodyText2?.color,
          );

  TextStyle? body2({String? color}) =>
      Theme.of(this).textTheme.bodyText2?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: DimensionsManifest.FONT_B2,
            color:
                color?.toColor() ?? Theme.of(this).textTheme.bodyText2?.color,
          );

  TextStyle? body3({String? color}) =>
      Theme.of(this).textTheme.bodyText2?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: DimensionsManifest.FONT_B3,
            color:
                color?.toColor() ?? Theme.of(this).textTheme.bodyText2?.color,
          );

  TextStyle? body4({String? color}) =>
      Theme.of(this).textTheme.bodyText2?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: DimensionsManifest.FONT_B4,
            color:
                color?.toColor() ?? Theme.of(this).textTheme.bodyText2?.color,
          );

  TextStyle? body5({String? color}) =>
      Theme.of(this).textTheme.bodyText2?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: DimensionsManifest.FONT_B5,
            color:
                color?.toColor() ?? Theme.of(this).textTheme.bodyText2?.color,
          );

  TextStyle? caption({String? color}) =>
      Theme.of(this).textTheme.bodySmall?.copyWith(
            fontSize: DimensionsManifest.FONT_B3,
            color:
                color?.toColor() ?? Theme.of(this).textTheme.bodySmall?.color,
          );
}
