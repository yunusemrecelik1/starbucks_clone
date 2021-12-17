import 'package:flutter/material.dart';
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
    return BaseView(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, LoginViewModel value) => Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset(SVGImagePaths.instance.loginBgSVG),
            Padding(
              padding: context.paddingMediumHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 3),
                  Expanded(child: Align(alignment: Alignment.centerLeft, child: Image.asset(ImageConstants.instance.starbucks))),
                  Spacer(),
                  Expanded(
                    child: Text(
                      LocaleKeys.login_page_welcome.tr(),
                      style: context.textTheme.headline4.copyWith(color: context.colors.onSecondary).copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    LocaleKeys.login_page_subTitle.tr(),
                    style: context.textTheme.subtitle2,
                  )),
                  Spacer(),
                  Container(
                    color: context.colors.onBackground,
                    padding: context.paddingLowVertical,
                    child: TextField(
                      //controller: controller,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    color: context.colors.onBackground,
                    padding: context.paddingLowVertical,
                    child: TextField(
                      //controller: controller,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(Icons.visibility)
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(alignment: Alignment.centerRight,child: Text(LocaleKeys.login_page_forgot.tr(),style: context.textTheme.headline6.copyWith(
                    fontWeight: FontWeight.w600,
                  ),)),
                  Spacer(),
                  SizedBox(
                      width: 1000,
                      child: RaisedButton(
                        padding: context.paddingNormal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        color: context.colors.secondary,
                        onPressed: () {},
                        child: Text(LocaleKeys.login_page_button_text.tr(),style: context.textTheme.headline6.copyWith(color: context.colors.onBackground),),
                      )),
                  Spacer(flex: 4),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
