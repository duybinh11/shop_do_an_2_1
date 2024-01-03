import 'dart:convert';

import 'package:shop_do_an_2_1/Model/ItemOrderModel.dart';
import 'package:http/http.dart' as http;
import 'package:shop_do_an_2_1/Model/StatusTransport.dart';

class ApiItem {
  Future<List<ItemOrderModel>> getOrder(int idShop) async {
    Uri uri = Uri.parse('http://10.0.2.2:8000/api/shop/get_order/$idShop');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> listData = jsonDecode(response.body);
      return listData.map((e) => ItemOrderModel.fromMap(e)).toList();
    }
    return [];
  }

  Future<Map<String, dynamic>> getDataOrder(int idOrder) async {
    Uri uri = Uri.parse('http://10.0.2.2:8000/api/shop/get_orde_data/$idOrder');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return <String, dynamic>{'status': false};
  }

  Future<bool> confirmOrder(int idOrder) async {
    Uri uri = Uri.parse('http://10.0.2.2:8000/api/shop/cofirm_order');
    http.Response response =
        await http.put(uri, body: {'id_order': idOrder.toString()});

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['status'];
    }
    return false;
  }

  Future<StatusTransport?> updateAddress(int idOrder, String address) async {
    Uri uri = Uri.parse('http://10.0.2.2:8000/api/shop/update_address');
    http.Response response = await http
        .post(uri, body: {'id_order': idOrder.toString(), 'place': address});

    if (response.statusCode == 200) {
      return StatusTransport.fromMap(jsonDecode(response.body)['address']);
    }
    return null;
  }
}
