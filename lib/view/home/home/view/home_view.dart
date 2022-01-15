import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starbucks_clone/core/base/view/base_widget.dart';
import 'package:starbucks_clone/core/extension/context_extension.dart';
import 'package:starbucks_clone/core/init/theme/light/color_scheme_light.dart';
import 'package:starbucks_clone/view/_product/_constants/image_path_svg.dart';
import 'package:starbucks_clone/view/home/home/viewmodel/home_view_model.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:starbucks_clone/core/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (context, HomeViewModel value) => Scaffold(
        floatingActionButton: buildFloatingActionButton(),
        appBar: buildAppBar(context),
        body: buildBody(context,value),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Starbucks'),
      centerTitle: false,
      actions: [buildActions(context)],
    );
  }

  Padding buildActions(BuildContext context) {
    return Padding(
      padding: context.paddingNormalRight,
      child: Row(
        children: [
          Icon(
            Icons.notifications_none_sharp,
            color: context.colors.primary,
          ),
          SizedBox(width: context.normalValue),
          Icon(Icons.more_vert, color: context.colors.primary),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context,HomeViewModel model) {
    return Column(
      children: [
        buildBalanceCard(context,model),
        buildCharts(context,model),
        buildDraggableScroll(model),
      ],
    );
  }

  Stack buildBalanceCard(BuildContext context,HomeViewModel model) {
    return Stack(
      children: [
        Padding(
          padding: context.paddingNormal + context.paddingLowTop,
          child: Container(
            width: context.width,
            decoration: BoxDecoration(
              color: context.colors.secondary,
              borderRadius: BorderRadius.all(
                Radius.circular(context.width * 0.08),
              ),
            ),
            child: Stack(
              alignment: Alignment.centerLeft + Alignment.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(context.width * 0.08),
                    bottomLeft: Radius.circular(context.width * 0.08),
                  ),
                  child: SvgPicture.asset(
                      SVGImagePaths.instance.starBucksCardLogo),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 0,
                  margin: context.paddingMediumVertical +
                      context.paddingNormalHorizontal,
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                        LocaleKeys.home_page_all_money.tr(),
                              style: context.textTheme.headline6?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              model.homeItem.money.toString() +" TL",
                              style: context.textTheme.headline5?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Text(
                                  LocaleKeys.home_page_add_money.tr(),
                                  style: context.textTheme.subtitle2?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  CupertinoIcons.arrow_right,
                                  size: 17,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Expanded buildCharts(BuildContext context,HomeViewModel model) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: context.paddingNormalHorizontal + context.paddingMediumBottom,
        child: Row(
          children: [
            buildCoffeeChart(context),
            buildMenu(
                context: context,
                countText: model.homeItem.starBalance.toString(),
                icon: Icons.star_border,
                title: LocaleKeys.home_page_star_balance.tr()),
            buildMenu(
                context: context,
                countText: model.homeItem.giftCoffee.toString(),
                icon: Icons.coffee,
                title: LocaleKeys.home_page_free_drink.tr(),),
          ],
        ),
      ),
    );
  }

  Expanded buildCoffeeChart(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 100,
            showLabels: false,
            showTicks: false,
            axisLineStyle: AxisLineStyle(
              thickness: 0.12,
              cornerStyle: CornerStyle.bothFlat,
              color: context.colors.primary.withOpacity(0.5),
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: [
              RangePointer(
                value: 50,
                cornerStyle: CornerStyle.bothFlat,
                width: 0.12,
                sizeUnit: GaugeSizeUnit.factor,
                color: context.colors.primary,
              )
            ],
            annotations: [
              GaugeAnnotation(
                widget: Padding(
                  padding: context.paddingLowLeft + context.paddingNormalTop,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(SVGImagePaths.instance.coffeeCup),
                      Text("6/15"),
                    ],
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  Widget buildMenu(
      {required BuildContext context,
      required IconData icon,
      required countText,
      required title}) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon,
                    color: icon == Icons.coffee
                        ? ColorSchemeLight.instance?.primaryGreen
                        : ColorSchemeLight.instance?.gold),
                SizedBox(width: 5),
                Text(
                  countText,
                  style: context.textTheme.headline5
                      ?.copyWith(fontWeight: FontWeight.w600),
                )
              ],
            ),
            Text(title,
                style: context.textTheme.subtitle2
                    ?.copyWith(fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }

  Widget buildDraggableScroll(HomeViewModel model) {
    return Expanded(
      flex: 3,
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 1,
        maxChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    width: 60,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromRGBO(202, 202, 202, 1),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: ListView.builder(
                      itemCount: model.homeItem.contentList?.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: context.paddingNormal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.homeItem.contentList![index].title ?? "",
                                style: context.textTheme.headline6
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 15),
                              Image(
                                image: AssetImage(model.homeItem.contentList![index].imageUrl ?? ""),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
