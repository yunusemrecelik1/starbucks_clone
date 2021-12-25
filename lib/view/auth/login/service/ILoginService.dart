import 'package:starbucks_clone/view/auth/login/model/login_model.dart';
import 'package:starbucks_clone/view/auth/login/model/login_response_model.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {
  final INetworkManager manager;

  ILoginService(this.manager);
  Future<LoginResponseModel> fetchUserControl(LoginModel model);
}