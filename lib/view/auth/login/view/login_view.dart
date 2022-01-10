import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starbucks_clone/core/base/view/base_widget.dart';
import 'package:starbucks_clone/core/constants/image/image_constants.dart';
import 'package:starbucks_clone/core/extension/context_extension.dart';
import 'package:starbucks_clone/core/init/lang/locale_keys.g.dart';
import 'package:starbucks_clone/view/_product/_constants/image_path_svg.dart';
import 'package:starbucks_clone/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, LoginViewModel value) => Scaffold(
        key: value.scaffoldState,
        body: Stack(
          children: [
            SvgPicture.asset(SVGImagePaths.instance.loginBgSVG),
            Padding(
              padding: context.paddingMediumHorizontal,
              child: buildBodyColumn(context, value),
            )
          ],
        ),
      ),
    );
  }

  Column buildBodyColumn(BuildContext context, LoginViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(flex: 3),
        buildStarbucksLogo(),
        Spacer(),
        buildWelcomeTitle(context),
        buildSubtitleText(context),
        Spacer(),
        buildEmailTextForm(context, model),
        buildPasswordTextForm(context, model),
        Spacer(),
        buildForgotButton(context),
        Spacer(),
        buildLoginButton(context, model),
        Spacer(flex: 4),
      ],
    );
  }

  Expanded buildStarbucksLogo() {
    return Expanded(
        child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(ImageConstants.instance!.starbucks)));
  }

  Expanded buildWelcomeTitle(BuildContext context) {
    return Expanded(
      child: Text(
        LocaleKeys.login_page_welcome.tr(),
        style: context.textTheme.headline4!
            .copyWith(color: context.colors.onSecondary)
            .copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  Expanded buildSubtitleText(BuildContext context) {
    return Expanded(
        child: Text(
      LocaleKeys.login_page_subTitle.tr(),
      style: context.textTheme.subtitle2,
    ));
  }

  Container buildEmailTextForm(BuildContext context, LoginViewModel model) {
    return Container(
      color: context.colors.onBackground,
      padding: context.paddingLowVertical,
      child: TextField(
        controller: model.emailController,
        decoration: InputDecoration(
          labelText: 'Email',
        ),
      ),
    );
  }

  Container buildPasswordTextForm(BuildContext context, LoginViewModel model) {
    return Container(
      color: context.colors.onBackground,
      padding: context.paddingLowVertical,
      child: Observer(
        builder: (_){
          return TextFormField(
            obscureText: model.isLockOpen,
            controller: model.passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: TextButton(
                onPressed: (){
                  model.isLockChange();
                },
                child: Observer(
                  builder: (_){
                    return Icon(
                      model.isLockOpen ? Icons.visibility_off_outlined : Icons.visibility,
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
      );
  }

  Align buildForgotButton(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Text(
          LocaleKeys.login_page_forgot.tr(),
          style: context.textTheme.headline6!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ));
  }

  SizedBox buildLoginButton(BuildContext context, LoginViewModel model) {
    return SizedBox(
      width: context.width,
        child: Observer(builder: (_) {
          return ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(context.paddingNormal),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),),
              backgroundColor: MaterialStateProperty.all(context.colors.secondary),
            ),
            onPressed: model.isLoading
                ? null
                : () {
                    model.fetchLoginService();
                  },
            child: Text(
              LocaleKeys.login_page_button_text.tr(),
              style: context.textTheme.headline6!
                  .copyWith(color: context.colors.onBackground),
            ),
          );
        }));
  }
}
