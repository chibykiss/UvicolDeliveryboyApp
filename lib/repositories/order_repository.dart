import 'package:active_flutter_delivery_app/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:active_flutter_delivery_app/data_model/order_detail_response.dart';
import 'package:active_flutter_delivery_app/data_model/order_item_response.dart';
import 'package:active_flutter_delivery_app/helpers/shared_value_helper.dart';


class OrderRepository {

  Future<OrderDetailResponse> getOrderDetails(
      {@required int id = 0}) async {
    var url = "${AppConfig.BASE_URL}/${AppConfig.DELIVERY_PREFIX}/purchase-history-details/" +
        id.toString();


    final response = await http.get(Uri.parse(url),headers: {
      "Authorization": "Bearer ${access_token.$}"
    } );
    print("url:" +url.toString());
    print("getOrderDetails response :" +response.body.toString());
    return orderDetailResponseFromJson(response.body);
  }

  Future<OrderItemResponse> getOrderItems(
      {@required int id = 0}) async {
    var url = "${AppConfig.BASE_URL}/${AppConfig.DELIVERY_PREFIX}/purchase-history-items/" +
        id.toString();



    final response = await http.get(Uri.parse(url),headers: {
      "Authorization": "Bearer ${access_token.$}"
    });
    print("order details url:" +url.toString());
    print("token :" +access_token.$);
    print("order details url:" +url.toString());
    print("order details "+response.body.toString());
    print("Cuomo estas");
    return orderItemlResponseFromJson(response.body);
  }
}
