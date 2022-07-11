import 'package:flutter/material.dart';
import 'package:wulkam/ui/home/ui/home_screen.dart';
import 'package:wulkam/ui/onboarding/ui/onboarding_screen.dart';

abstract class MainNavigationRoutes {
  static const String main = '/';
  static const String onboarding = '/onboarding';
}

final routes = {
  MainNavigationRoutes.main: (BuildContext context) => const HomeScreen(),
  MainNavigationRoutes.onboarding: (BuildContext context) =>
  const OnBoardingScreen(),
};