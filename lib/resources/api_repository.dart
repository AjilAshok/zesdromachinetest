import '../model/models.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<Home> fetchCovidList() {
    return _provider.fetchCovidList();
  }
}

class NetworkError extends Error {}
