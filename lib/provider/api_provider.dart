import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../model/data_model.dart';


class ApiProvider {
  Client client = Client();

  Future<DataModels> fetchDataList() async {
    final response = await client
      .get("https://private-a8e48-hcidtest.apiary-mock.com/home");
    if(response.statusCode == 200){
      return DataModels.fromJson(json.decode(response.body));
    }else{
      //Jika tidak sukses, throw error
      throw Exception('Failed to load data');
    }
  }
}