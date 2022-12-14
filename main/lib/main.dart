import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:alice/alice.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:thegoatjp/src/common/localization/app_translation_delegate.dart';
import 'package:thegoatjp/src/common/localization/application.dart';
import 'package:thegoatjp/src/h.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  try {
    await configureInjection();
    runApp(const Application());
  } catch (error) {
    Logger.debug('Locator setup has failed before starting app >> $error');
  }
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends State<Application> {
  final _alice = Injector.locator<Alice>();
  final _route = Injector.locator<AppRouteRegistry>();
  final _languageAdapter = Injector.locator<MultiLanguageAdapter>();

  AppTranslationsDelegate _localeDelegate =
      AppTranslationsDelegate(defaultLocale);

  @override
  void initState() {
    super.initState();
    _onLocaleChange(defaultLocale);
    _languageAdapter.onLocaleChanged = _onLocaleChange;
    _route.initRouter();
  }

  _onLocaleChange(Locale locale) {
    setState(() {
      _localeDelegate = AppTranslationsDelegate(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: MaterialColor(
          ColorManifest.LIGHT_PRIMARY_RED.toHex(),
          <int, Color>{
            50: ColorManifest.LIGHT_10_RED.toColor(),
            100: ColorManifest.LIGHT_20_RED.toColor(),
            200: ColorManifest.LIGHT_30_RED.toColor(),
            300: ColorManifest.LIGHT_40_RED.toColor(),
            400: ColorManifest.LIGHT_50_RED.toColor(),
            500: ColorManifest.LIGHT_60_RED.toColor(),
            600: ColorManifest.LIGHT_70_RED.toColor(),
            700: ColorManifest.LIGHT_80_RED.toColor(),
            800: ColorManifest.LIGHT_90_RED.toColor(),
            900: ColorManifest.LIGHT_100_RED.toColor(),
          },
        ),
        backgroundColor: ColorManifest.LIGHT_BACKGROUND.toColor(),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: MaterialColor(
          ColorManifest.DARK_PRIMARY_RED.toHex(),
          <int, Color>{
            50: ColorManifest.DARK_10_RED.toColor(),
            100: ColorManifest.DARK_20_RED.toColor(),
            200: ColorManifest.DARK_30_RED.toColor(),
            300: ColorManifest.DARK_40_RED.toColor(),
            400: ColorManifest.DARK_50_RED.toColor(),
            500: ColorManifest.DARK_60_RED.toColor(),
            600: ColorManifest.DARK_70_RED.toColor(),
            700: ColorManifest.DARK_80_RED.toColor(),
            800: ColorManifest.DARK_90_RED.toColor(),
            900: ColorManifest.DARK_100_RED.toColor(),
          },
        ),
        backgroundColor: ColorManifest.DARK_BACKGROUND.toColor(),
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) {
        return DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => MaterialApp(
            debugShowCheckedModeBanner: !kReleaseMode,
            supportedLocales: _languageAdapter.supportedLocales(),
            localizationsDelegates: [
              _localeDelegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            theme: theme,
            darkTheme: darkTheme,
            navigatorKey: _alice.getNavigatorKey(),
            home: IntermediaryPage(),
            onGenerateRoute: _route.router.generator,
          ),
        );
      },
    );
  }
}
