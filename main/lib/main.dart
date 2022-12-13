import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:device_preview/device_preview.dart';
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
  }

  _onLocaleChange(Locale locale) {
    setState(() {
      _localeDelegate = AppTranslationsDelegate(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    _route.initRouter();
    FlutterNativeSplash.remove();
    return AdaptiveTheme(
      light: ThemeData(),
      dark: ThemeData(),
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
            // TODO: Update later
            home: Container(),
            onGenerateRoute: _route.router.generator,
          ),
        );
      },
    );
  }
}
