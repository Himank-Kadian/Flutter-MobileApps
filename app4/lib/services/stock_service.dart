//Do NOT touch this file as it is complete.
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const apiToken = 'Tpk_27e2aa9354b742e4aac4092f8d2b7f59';

class StockService {
  Future getQuote(String symbol) async {
    String url =
        "https://sandbox.iexapis.com/stable/stock/${symbol}/quote/?token=$apiToken";
    http.Response response = await http.get(url);
    //print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Response Status is ${response.statusCode}');
    }
  }
}
