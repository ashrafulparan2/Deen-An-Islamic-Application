import 'package:deen/src/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../src/core/error/exceptions.dart';
import '../src/features/allah_name/screen/allah_name_screen.dart';
import '../src/features/bottom_tab/screen/tab_screen.dart';
import '../src/features/download/screen/download_screen.dart';
import '../src/features/dua/screen/dua_screen.dart';
import '../src/features/error/screen/database_error_screen.dart';
import '../src/features/permission/screen/location_permission_screen.dart';
import '../src/features/permission/screen/notification_permission_screen.dart';
import '../src/features/prayer_timing/screen/prayer_timing_screen.dart';
import '../src/features/qibla/screen/qibla_screen.dart';
import '../src/features/quran/screen/quran_screen.dart';
import '../src/features/setting/screen/thankyou_screen.dart';
import '../src/features/splash/screen/splash_screen.dart';
import '../src/features/tasbih/screen/tasbih_screen.dart';
import '../src/features/tracking/screen/sign_in.dart';
import '../src/features/tracking/screen/sign_up.dart';
import '../src/features/tracking/screen/search_screen.dart';
import '../src/features/zakat/zakatscreen.dart';

class RouteGenerator {
  static const String splash = '/';
  static const String tabScreen = '/tab';
  static const String prayerTimingPage = '/prayer_timing';
  static const String qibla = '/qibla';
  static const String thankyou = '/thank_you';
  static const String download = '/download';
  static const String databaseError = '/database_error';
  static const String allahName = '/allah_name';
  static const String tasbih = '/tasbih';
  static const String dua = '/dua';
  static const String quran = '/quran';
  static const String locationPermission = '/location_permission';
  static const String notificationPermission = '/notification_permission';
  static const String SignIn = '/sign_in';
  static const String SignUp = '/sign_up';
  static const String tracking = '/search_screen';
  static const String Home_Screen = '/home_screen';
  static const String zakatscreen = '/zakat_screen';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case tabScreen:
        return MaterialPageRoute(builder: (_) => const TabScreen());
      case prayerTimingPage:
        return MaterialPageRoute(builder: (_) => const PrayerTimingScreen());
      case qibla:
        return MaterialPageRoute(builder: (_) => const QiblaScreen());
      case thankyou:
        return MaterialPageRoute(builder: (_) => const ThankyouScreen());
      case download:
        return MaterialPageRoute(builder: (_) => const DownloadScreen());
      case databaseError:
        return MaterialPageRoute(builder: (_) => const DatabaseErrorScreen());
      case allahName:
        return MaterialPageRoute(builder: (_) => const AllahNameScreen());
      case tasbih:
        return MaterialPageRoute(builder: (_) => const TasbihScreen());
      case dua:
        return MaterialPageRoute(builder: (_) => const DuaScreen());
      case quran:
        return MaterialPageRoute(builder: (_) => const QuranScreen());
      case locationPermission:
        return MaterialPageRoute(
            builder: (_) => const LocationPermissionScreen());
      case notificationPermission:
        return MaterialPageRoute(
            builder: (_) => const NotificationPermissionScreen());
      case SignIn:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case SignUp:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case tracking:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case Home_Screen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case zakatscreen:
        return MaterialPageRoute(builder: (_) => ZakatPage());
      default:
        throw RouteException('Route not found');
    }
  }
}
