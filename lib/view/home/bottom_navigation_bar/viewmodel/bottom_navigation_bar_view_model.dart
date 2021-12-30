import 'package:mobx/mobx.dart';
import 'package:starbucks_clone/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
part 'bottom_navigation_bar_view_model.g.dart';

class BottomNavigationBarViewModel = _BottomNavigationBarViewModelBase with _$BottomNavigationBarViewModel;

abstract class _BottomNavigationBarViewModelBase with Store,BaseViewModel {

  void setContext(BuildContext context) => this.context = context;
  void init() {}

  @observable
  int pageIndex = 0;

  @action
  void changeIndex(int index){
    pageIndex = index;
  }

}