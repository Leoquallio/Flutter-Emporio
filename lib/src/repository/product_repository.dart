import 'package:dio/dio.dart';
import 'package:flutter_emporio/src/model/produto_form.dart';
import 'package:flutter_emporio/src/utils/constants_utils.dart';
import 'package:flutter_emporio/src/utils/custom_dio.dart';

class ProductRepository {
  final CustomDio _customDio;
  ProductRepository(this._customDio);

  Future<Response> getAllProducts() async {
    try {
      Response _response = await _customDio.dio.get("$baseUrl/produto/");
      return _response;
    } on DioError catch (error) {
      throw DioError(
          error: error,
          requestOptions: error.requestOptions,
          response: error.response);
    } catch (ex) {
      throw Exception("Conexão com o servidor falhou!");
    }
  }

  Future<Response> create(ProdutoForm produtoForm, MultipartFile? image) async {
    FormData formDataProduto = FormData.fromMap(produtoForm.toJson());
    if (image != null) {
      MapEntry<String, MultipartFile> mapImage =
          MapEntry("imageProduto", image);
      formDataProduto.files.add(mapImage);
    }
    try {
      Response _response =
          await _customDio.dio.post("$baseUrl/produto/", data: formDataProduto);
      return _response;
    } on DioError catch (error) {
      image?.finalize();
      throw DioError(
          error: error,
          requestOptions: error.requestOptions,
          response: error.response);
    } catch (e) {
      image?.finalize();
      throw Exception("Conexão com o servidor falhou!");
    }
  }

  Future<Response> update(
      int codigoProduto, ProdutoForm produtoForm, MultipartFile? image) async {
    FormData formDataProduto = FormData.fromMap(produtoForm.toJson());
    if (image != null) {
      MapEntry<String, MultipartFile> mapImage =
          MapEntry("imageProduto", image);
      formDataProduto.files.add(mapImage);
    }

    try {
      Response _response = await _customDio.dio
          .put("$baseUrl/produto/$codigoProduto", data: formDataProduto);
      return _response;
    } on DioError catch (error) {
      image?.finalize();
      throw DioError(
          error: error,
          requestOptions: error.requestOptions,
          response: error.response);
    } catch (e) {
      image?.finalize();
      throw Exception("Conexão com o servidor falhou!");
    }
  }

  Future<Response> delete(int codigoProduto) async {
    try {
      Response _response =
          await _customDio.dio.delete("$baseUrl/produto/$codigoProduto");
      return _response;
    } on DioError catch (error) {
      throw DioError(
          error: error,
          requestOptions: error.requestOptions,
          response: error.response);
    } catch (e) {
      throw Exception("Conexão com o servidor falhou!");
    }
  }

  Future<Response> deletePhotoProduct(int codigoProduto) async {
    try {
      Response _response =
          await _customDio.dio.delete("$baseUrl/produto/$codigoProduto/file");
      return _response;
    } on DioError catch (error) {
      throw DioError(
          error: error,
          requestOptions: error.requestOptions,
          response: error.response);
    } catch (e) {
      throw Exception("Conexão com o servidor falhou!");
    }
  }
}
