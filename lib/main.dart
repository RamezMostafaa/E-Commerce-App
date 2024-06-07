import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_sun3/provider/app_config_provider.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/auth/login/login_screen.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/auth/register/register_screen.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/cart/cart_screen.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/home_screen/home_screen_view.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/product_details/product_details_view.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/home/tabs/settings/settings_screen.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/splash/splash_screen.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/utils/app_theme.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/utils/my_bloc_observer.dart';
import 'package:flutter_e_commerce_c10_sun3/ui/utils/shared_preference.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.init();
  String route;
  var user = SharedPreference.getData(key: 'Token');
  if (user == null) {
    route = LoginScreen.routeName;
  } else {
    route = HomeScreenView.routeName;
  }
  Bloc.observer = MyBlocObserver();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isEnglish = prefs.getBool("isEnglish") ?? false;
  runApp(ChangeNotifierProvider(
      create: (_) => AppConfigProvider(isEnglish),
      child: MyApp(
        route: route,
      )));
}

class MyApp extends StatelessWidget {
  String route;

  MyApp({required this.route});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            locale: Locale(provider.appLanguage),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            initialRoute: route,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              HomeScreenView.routeName: (context) => HomeScreenView(),
              ProductDetailsView.routeName: (context) => ProductDetailsView(),
              CartScreen.routeName: (context) => CartScreen(),
              SettingsScreen.routeName: (context) => SettingsScreen(),
            },
            theme: AppTheme.mainTheme,
          );
        });
  }
}
