import 'package:archonit_test/domain/models/Crypto.dart';

abstract class IRepository {
  Future<List<Crypto>> getAssets({int limit, int skip});
}