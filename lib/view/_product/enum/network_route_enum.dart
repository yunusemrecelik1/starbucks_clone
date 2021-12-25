
enum NetworkRoutes {
  LOGIN
}

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch(this) {
      case NetworkRoutes.LOGIN:
        return "api/user/login";
      default:
        throw Exception("Route bulunamadı");
    }
  }

}