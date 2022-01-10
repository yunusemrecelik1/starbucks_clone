import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starbucks_clone/core/base/view/base_widget.dart';
import 'package:starbucks_clone/core/extension/context_extension.dart';
import 'package:starbucks_clone/view/home/bottom_navigation_bar/viewmodel/bottom_navigation_bar_view_model.dart';
import 'package:starbucks_clone/view/home/home/view/home_view.dart';
import 'package:starbucks_clone/view/home/location/location_page.dart';
import 'package:starbucks_clone/view/home/order/view/order_page_view.dart';
import 'package:starbucks_clone/view/home/payment/payment_page.dart';

class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<BottomNavigationBarViewModel>(
      viewModel: BottomNavigationBarViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, BottomNavigationBarViewModel value) => Container(
        color: Colors.white,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            bottomNavigationBar: buildBottomNavigationBar(context, value),
            body: Observer(builder: (_) {
              return [HomeView(), OrderPage(), PaymentPage(), LocationPage()][value.pageIndex];
            }),
          ),
        ),
      ),
    );
  }

  Padding buildBottomNavigationBar(BuildContext context, BottomNavigationBarViewModel value) {
    return Padding(
      padding: context.paddingLowBottom,
      child: FittedBox(
        child: Container(
          width: context.width,
          padding: context.paddingMediumHorizontal + context.paddingNormalHorizontal,
          decoration: buildBoxDecoration(context),
          child: buildElements(value, context),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(context.width * 0.3),
            topRight: Radius.circular(context.width * 0.3),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF919191).withOpacity(0.22),
              blurRadius: 15,
              offset: Offset(0, -3),
            ),
          ],
        );
  }

  Row buildElements(BottomNavigationBarViewModel value, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildIcon(value: value, icon: Icons.star_border, pageIndex: 0, context: context),
        buildIcon(value: value, icon: Icons.hourglass_empty_outlined, pageIndex: 1, context: context),
        buildIcon(value: value, icon: Icons.credit_card_outlined, pageIndex: 2, context: context),
        buildIcon(value: value, icon: Icons.location_on_outlined, pageIndex: 3, context: context),
      ],
    );
  }

  Widget buildIcon({required BottomNavigationBarViewModel value, required int pageIndex, required IconData icon, required BuildContext context}) {
    return Observer(builder: (_) {
      return InkWell(
          onTap: () {
            value.changeIndex(pageIndex);
          },
          child: Column(
            children: [
              SizedBox(height: 15),
              Icon(
                icon,
                color: value.pageIndex == pageIndex ? context.colors.secondary : context.colors.onSecondary,
                size: 30,
              ),
              SizedBox(height: 10),
            ],
          ));
    });
  }
}
