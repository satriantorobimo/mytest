import 'package:rxdart/rxdart.dart';
import '../model/data_model.dart';
import '../resources/repository.dart';

class DataBloc {
  final _repository = Repository();
  final _dataFetcher = PublishSubject<DataModels>();

  Observable<DataModels> get allDatas => _dataFetcher.stream;

  fetchAllData() async {
    DataModels dataModels = await _repository.fetchAllData();
    _dataFetcher.sink.add(dataModels);
  } 

  dispose(){
    _dataFetcher.close();
  }

}

final bloc = DataBloc();