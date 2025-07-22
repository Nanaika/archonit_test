import 'package:dio/dio.dart';

import '../domain/irepository.dart';
import '../domain/models/Crypto.dart';

class CoinRepository implements IRepository {
  CoinRepository._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://rest.coincap.io/v3',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
    ));
  }

  static final CoinRepository _instance = CoinRepository._internal();

  static CoinRepository get instance => _instance;

  late final Dio _dio;
  final String _apiKey = 'f2714423714c5cc388d19f882856f0820e8a1ae7f7ecef5397208703f1e2769f';


  @override
  Future<List<Crypto>> getAssets({int limit = 15, int skip = 0}) async {
    try {
      final response = await _dio.get(
        '/assets?apiKey=$_apiKey',
        queryParameters: {'limit': limit, 'offset': skip},
      );

      final List list = response.data['data'];
      return list.map((e) => Crypto.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.response?.statusCode} ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

}


