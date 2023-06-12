import 'package:dio/dio.dart';
import 'package:zesdromachinetes/constant/apis.dart';
import 'package:zesdromachinetes/model/models.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = trending;

  Future<Home> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      return Home.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      throw Exception("Data not found / Connection issue");
    }
  }
}
