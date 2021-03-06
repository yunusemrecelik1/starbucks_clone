import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:starbucks_clone/core/base/model/base_view_model.dart';
import 'package:starbucks_clone/core/constants/enums/locale_keys_enum.dart';
import 'package:starbucks_clone/core/init/network/vexana_manager.dart';
import 'package:starbucks_clone/view/auth/login/model/login_model.dart';
import 'package:starbucks_clone/view/auth/login/service/ILoginService.dart';
import 'package:starbucks_clone/view/auth/login/service/login_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late ILoginService loginService;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  void setContext(BuildContext context) => this.context = context;

  void init() {
    loginService = LoginService(VexanaManager.instance!.networkManager);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = true;

  @action
  Future<void> fetchLoginService() async {
    isLoadingChange();
      final response = await loginService.fetchUserControl(
          LoginModel(email:emailController!.text.toString(), password:passwordController!.text.toString()));
      if (response != null) {
        if (scaffoldState.currentState != null && context != null) {
          ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text(response.token!)));
        }
        await localeManager.setStringValue(PreferencesKeys.TOKEN, response.token!);
      }
    isLoadingChange();
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @action
  void isLockChange() {
    isLockOpen = !isLockOpen;
  }
}
