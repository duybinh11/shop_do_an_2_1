import 'dart:convert';

import 'package:shop_do_an_2_1/Model/ShopModel.dart';
import 'package:http/http.dart' as http;

class ApiAuth {
  Future<ShopModel?> login(String email, String password) async {
    Uri uri = Uri.parse('http://10.0.2.2:8000/api/shop/login');
    http.Response response =
        await http.post(uri, body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> mapData = jsonDecode(response.body);
      if (mapData['status'] as bool) {
        return ShopModel.fromMap(mapData['shop']);
      }
      return null;
    }
    return null;
  }
}
