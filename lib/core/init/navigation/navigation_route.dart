import 'package:flutter/material.dart';
import 'package:starbucks_clone/core/components/card/not_found_navigation_widget.dart';
import 'package:starbucks_clone/core/constants/navigation/navigation_constants.dart';
import 'package:starbucks_clone/view/auth/login/view/login_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(LoginView(),'LoginPage');
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget,String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: pageName)
    );
  }
}