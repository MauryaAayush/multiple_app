
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ProductApi{

  static final ProductApi productApi = ProductApi();

  Future<Map> apiCalling()
  async {
    String link = 'https://dummyjson.com/products';
    Uri url = Uri.parse(link);
    Response response = await http.get(url);

    print('--------------------------process done-----------------------');

    if(response.statusCode == 200){

      Map result = jsonDecode(response.body);
      print('------------------------done------------------------');
      return result;
    }
    else{
      throw "Error in the API";
    }

  }
}