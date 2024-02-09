import 'package:aichat/config/routes/app_routes.dart';
import 'package:aichat/config/routes/routes.dart';
import 'package:aichat/config/themes/dark_theme.dart' as dark;
import 'package:aichat/config/themes/light_theme.dart' as light;
import 'package:aichat/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class AiApp extends StatefulWidget {
  const AiApp({Key? key}) : super(key: key);

  @override
  State<AiApp> createState() => _AiAppState();
}

class _AiAppState extends State<AiApp> {
  AdaptiveThemeMode? savedThemeMode;
  @override
  void initState() {
    getSavedTheme();
    super.initState();
  }

  void getSavedTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => AdaptiveTheme(
        light: light.lightTheme(),
        dark: dark.darkTheme(),
        initial: savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => EasyLocalization(
          supportedLocales: const [
            Locale(AppStrings.arabicCode),
            Locale(AppStrings.englishCode)
          ],
          path: 'assets/translations',
          fallbackLocale: const Locale(AppStrings.arabicCode),
          startLocale: const Locale(AppStrings.arabicCode),
          child: MaterialApp(
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            initialRoute: Routes.imageGenerationRoute,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          ),
        ),
      ),
    );
  }
}
