import 'package:flutter/material.dart';
import 'package:starbucks_clone/core/init/cache/locale_manager.dart';
import 'package:starbucks_clone/core/init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  BuildContext context;

  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
}

