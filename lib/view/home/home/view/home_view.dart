import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starbucks_clone/core/base/view/base_widget.dart';
import 'package:starbucks_clone/core/extension/context_extension.dart';
import 'package:starbucks_clone/view/_product/_constants/image_path_svg.dart';
import 'package:starbucks_clone/view/home/home/viewmodel/home_view_model.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
        body: buildBody(context),
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
      actions: [
        buildActions(context)
      ],
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

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        buildBalanceCard(context),
        buildCharts(context),
        buildDraggableScroll(),
      ],
    );
  }

  Stack buildBalanceCard(BuildContext context) {
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
                              "Toplam Param",
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
                              "55,35 TL",
                              style: context.textTheme.headline5?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Yükleme yap",
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
  Expanded buildCharts(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: context.paddingNormalHorizontal+context.paddingMediumBottom,
        child: Row(
          children: [
            Expanded(
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
                      color: Color.fromARGB(30, 0, 169, 181),
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    pointers: [
                      RangePointer(
                        value: 50,
                        cornerStyle: CornerStyle.bothFlat,
                        width: 0.12,
                        sizeUnit: GaugeSizeUnit.factor,
                        color: Colors.red,
                      )
                    ],
                    annotations: [
                      GaugeAnnotation(
                        widget: Padding(
                          padding: context.paddingLowLeft,
                          child: SvgPicture.asset(
                              SVGImagePaths.instance.coffeeCup),
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ),
            Expanded(flex: 1, child: Center(child: Text("sa"))),
            Expanded(flex: 1, child: Center(child: Text("sa"))),
          ],
        ),
      ),
    );
  }
  Expanded buildDraggableScroll() {
    return Expanded(
        child: DraggableScrollableSheet(
          initialChildSize: 1,
          minChildSize: 1,
          maxChildSize: 1,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
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
            );
          },
        ),
      );
  }


}
