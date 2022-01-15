
class HomeModel {
  double? money;
  int? starBalance;
  int? giftCoffee;
  List<Content>? contentList;
  HomeModel({this.money,this.giftCoffee,this.starBalance,this.contentList});
}

class Content{
  String? title;
  String? imageUrl;
  Content({this.title,this.imageUrl});
}