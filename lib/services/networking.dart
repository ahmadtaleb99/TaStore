import 'dart:convert';

import 'package:http/http.dart' as http;


class NetworkingHelper{



  Future<dynamic>  getData (String url) async {

    try{
        http.Response response  = await http.get(Uri.parse(url));
        var data = jsonDecode(response.body);

        if(response.statusCode == 200){
          return data;
        }


      }
    catch(e){
    print('networking class error :::::::::::; $e');
    }
  }
}