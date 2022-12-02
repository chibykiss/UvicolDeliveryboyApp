import 'package:active_flutter_delivery_app/helpers/shared_value_helper.dart';
import 'package:flutter/material.dart';
import 'package:active_flutter_delivery_app/screens/main.dart';
import 'package:active_flutter_delivery_app/screens/login.dart';
class AuthHelper {
  setUserData(loginResponse) {
    if (loginResponse.result == true) {
      is_logged_in.$ = true;
      access_token.$ = loginResponse.access_token;
      user_id.$ = loginResponse.user.id;
      user_name.$ = loginResponse.user.name;
      user_email.$ = loginResponse.user.email;
      user_phone.$ = loginResponse.user.phone;
      avatar_original.$ = loginResponse.user.avatar_original;

    }
  }

  clearUserData() {
      is_logged_in.$ = false;
      access_token.$ = "";
      user_id.$ = 0;
      user_name.$ = "";
      user_email.$ = "";
      user_phone.$ = "";
      avatar_original.$ = "";
  }

  ifNotLoggedIn(context) async {
    if (is_logged_in.$ == false) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Login();
      }));
    }
  }

  ifLoggedIn(context) async {
    if (is_logged_in.$ == true) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Main();
      }));
    }
  }
}
