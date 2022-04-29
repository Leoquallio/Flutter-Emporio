import 'package:dio/dio.dart';
import 'package:flutter_emporio/src/utils/constants_utils.dart';

class ProductRepository {
  Dio dio;
  ProductRepository(this.dio);

  Future<Response> getAllProducts() async {
    try {
      Response _response = await dio.get("$baseUrl/produto/");
      return _response;
    } on DioError catch (ex) {
      ;
      if (ex.type == DioErrorType.connectTimeout) {
        throw Exception("Conexão demorou para responder!");
      }
      throw Exception("Conexão com o servidor falhou!");
    }
  }
}
