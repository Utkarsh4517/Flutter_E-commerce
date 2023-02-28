import 'package:ecommerce_clone/constants/error_handling.dart';
import 'package:ecommerce_clone/constants/global_var.dart';
import 'package:ecommerce_clone/constants/utils.dart';
import 'package:ecommerce_clone/models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user =
          User('', '', '', '', '', '',''); //id,name,email,password,address,type,token
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String,String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
     // ignore: use_build_context_synchronously
     httpErrorHandle(response:  res, context: context, onSuccess: (){
      showSnackBar(context, 'Account created! Login with the same credentials');
     },);
    // ignore: empty_catches
    } catch (e) {
      showSnackBar(context, e.toString());
    }

  }
}
