import 'package:dio/dio.dart';
import 'package:flutter_emporio/src/utils/constants_utils.dart';
import 'package:flutter_emporio/src/utils/custom_dio.dart';

class ProductRepository {
  CustomDio _customDio;
  ProductRepository(this._customDio);

  Future<Response> getAllProducts() async {
    try {
      Response _response = await _customDio.dio.get("$baseUrl/produto/");
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
