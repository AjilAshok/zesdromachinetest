import '../model/models.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<Home> fetchTrendList() {
    return _provider.fetchTrendingList();
  }
  Future<Home>fetechPopular(){
    return _provider.fetchPopularList();
  }
}

class NetworkError extends Error {}
