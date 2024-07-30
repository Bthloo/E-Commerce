import 'package:b_commerce/features/login_screen/data/models/login_response_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/endpoints.dart';

class AuthDatasource{
Dio dio = Dio();
   Future<LoginResponseModel>login({required String email, required String password})async{
    var response = await dio.post(
        '${EndPoints.baseUrl}/user/login',
        options: Options(
            headers: {
              'Content-Type': 'application/json'
            }
        ),
        data: {
          "username" : email,
          "password" : password
        }
    );
    LoginResponseModel responseModel = LoginResponseModel.fromJson(response.data);
    return responseModel;
  }

}