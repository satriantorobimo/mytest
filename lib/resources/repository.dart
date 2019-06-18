import 'dart:async';
import '../provider/api_provider.dart';
import '../model/data_model.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<DataModels> fetchAllData() => apiProvider.fetchDataList();
}
