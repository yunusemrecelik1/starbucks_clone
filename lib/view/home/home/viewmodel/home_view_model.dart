import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:starbucks_clone/core/base/model/base_view_model.dart';
import 'package:starbucks_clone/core/constants/image/image_constants.dart';
import 'package:starbucks_clone/view/home/home/model/home_model.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store,BaseViewModel {

  HomeModel homeItem = HomeModel(
      money: 55.13,
      giftCoffee: 2,
      starBalance: 1,
      contentList: [
        Content(title: 'Yeni Ürünler', imageUrl: ImageConstants.instance!.coffee_1),
        Content(title: 'Kampanyalar', imageUrl: ImageConstants.instance!.coffee_2),
      ]
  );

  void setContext(BuildContext context) => this.context = context;
  void init() {}
}