import 'package:flutter/material.dart';
import 'package:active_flutter_delivery_app/helpers/shared_value_helper.dart';
import 'package:active_flutter_delivery_app/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:active_flutter_delivery_app/screens/main.dart';
import 'package:active_flutter_delivery_app/screens/profile_edit.dart';
import 'package:active_flutter_delivery_app/screens/completed_delivery.dart';
import 'package:active_flutter_delivery_app/screens/pending.dart';
import 'package:active_flutter_delivery_app/screens/collection.dart';
import 'package:active_flutter_delivery_app/screens/cancelled_delivery.dart';
import 'package:active_flutter_delivery_app/screens/login.dart';

import 'package:active_flutter_delivery_app/helpers/shared_value_helper.dart';
import 'package:active_flutter_delivery_app/app_config.dart';
import 'package:active_flutter_delivery_app/helpers/auth_helper.dart';
import 'package:active_flutter_delivery_app/custom/toast_component.dart';
import 'package:toast/toast.dart';
import 'package:route_transitions/route_transitions.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  onTapLogout(context) async {
    AuthHelper().clearUserData();

    /*
    var logoutResponse = await AuthRepository()
            .getLogoutResponse();


    if(logoutResponse.result == true){
         ToastComponent.showDialog(logoutResponse.message, context,
                   gravity: Toast.center, duration: Toast.lengthLong);
         }
         */
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Login();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              is_logged_in.$ == true
                  ? ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          AppConfig.BASE_PATH + "${avatar_original.$}",
                        ),
                      ),
                      title: Text(
                        "${user_name.$}",
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      subtitle: user_email.$ != "" && user_email.$ != null
                          ? Text("${user_email.$}",
                              style:
                                  TextStyle(color: Color.fromRGBO(0, 0, 0, 1)))
                          : Text("${user_phone.$}",
                              style:
                                  TextStyle(color: Color.fromRGBO(0, 0, 0, 1))))
                  : Text('Not logged in',
                      style: TextStyle(color: Colors.black, fontSize: 14)),
              Divider(),
              ListTile(
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  leading: Image.asset("assets/dashboard.png",
                      height: 16, color: Color.fromRGBO(0, 0, 0, 1)),
                  title: Text('Dashboard',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Main();
                    }));

                    // pop(context);
                    // slideRightWidget(
                    //   newPage: Main(),
                    //   context: context,
                    // );
                  }),
              is_logged_in.$ == true
                  ? ListTile(
                      visualDensity:
                          VisualDensity(horizontal: -4, vertical: -4),
                      leading: Image.asset("assets/tick_circle.png",
                          height: 16, color: Color.fromRGBO(0, 0, 0, 1)),
                      title: Text('Completed Delivery',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14)),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CompletedDelivery(show_back_button: true);
                        }));
                        // pop(context);
                        // slideRightWidget(
                        //   newPage: CompletedDelivery(show_back_button: true),
                        //   context: context,
                        // );
                      })
                  : Container(),
              is_logged_in.$ == true
                  ? ListTile(
                      visualDensity:
                          VisualDensity(horizontal: -4, vertical: -4),
                      leading: Image.asset("assets/clock_circle.png",
                          height: 16, color: Color.fromRGBO(0, 0, 0, 1)),
                      title: Text('Pending Delivery',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14)),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Pending();
                        }));

                        // pop(context);
                        // slideRightWidget(
                        //   newPage: Pending(),
                        //   context: context,
                        // );
                      })
                  : Container(),
              is_logged_in.$ == true
                  ? ListTile(
                      visualDensity:
                          VisualDensity(horizontal: -4, vertical: -4),
                      leading: Image.asset("assets/cross_circle.png",
                          height: 16, color: Color.fromRGBO(0, 0, 0, 1)),
                      title: Text('Cancelled Delivery',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14)),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CancelledDelivery(show_back_button: true);
                        }));

                        // pop(context);
                        // slideRightWidget(
                        //   newPage: CancelledDelivery(show_back_button: true),
                        //   context: context,
                        // );
                      })
                  : Container(),
              is_logged_in.$ == true
                  ? ListTile(
                      visualDensity:
                          VisualDensity(horizontal: -4, vertical: -4),
                      leading: Image.asset("assets/dollar.png",
                          height: 16, color: Color.fromRGBO(0, 0, 0, 1)),
                      title: Text('My Collection',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14)),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Collection(show_back_button: true);
                        }));
                        // pop(context);
                        // slideRightWidget(
                        //   newPage: Collection(show_back_button: true),
                        //   context: context,
                        // );
                      })
                  : Container(),
              // is_logged_in.$ == true
              //     ? ListTile(
              //     visualDensity:
              //     VisualDensity(horizontal: -4, vertical: -4),
              //     leading: Image.asset("assets/profile.png",
              //         height: 16, color: Color.fromRGBO(0, 0, 0, 1)),
              //     title: Text('Profile',
              //         style: TextStyle(
              //             color: Color.fromRGBO(0, 0, 0, 1),
              //             fontSize: 14)),
              //     onTap: () {
              //       /*Navigator.push(context,
              //           MaterialPageRoute(builder: (context) {
              //             return Profile(show_back_button: true);
              //           }));*/
              //     })
              //     : Container(),
              Divider(),
              is_logged_in.$ == false
                  ? ListTile(
                      visualDensity:
                          VisualDensity(horizontal: -4, vertical: -4),
                      leading: Image.asset("assets/login.png",
                          height: 16, color: Color.fromRGBO(0, 0, 0, 1)),
                      title: Text('Login',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14)),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                        // pop(context);
                        // slideRightWidget(
                        //   newPage: Login(),
                        //   context: context,
                        // );
                      })
                  : Container(),
              is_logged_in.$ == true
                  ? ListTile(
                      visualDensity:
                          VisualDensity(horizontal: -4, vertical: -4),
                      leading: Image.asset("assets/logout.png",
                          height: 16, color: Color.fromRGBO(0, 0, 0, 1)),
                      title: Text('Logout',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14)),
                      onTap: () {
                        onTapLogout(context);
                      })
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
