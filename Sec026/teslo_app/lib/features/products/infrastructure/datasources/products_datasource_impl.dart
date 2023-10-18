import 'package:dio/dio.dart';
import 'package:teslo_app/config/constants/environment.dart';
import 'package:teslo_app/features/products/domain/datasources/products_datasources.dart';
import 'package:teslo_app/features/products/domain/entities/product.dart';
import 'package:teslo_app/features/products/infrastructure/mappers/product_mapper.dart';

class ProductsDatasourceImpl implements ProductsDatasource {
  late final Dio dio;
  final String accessToken;

  ProductsDatasourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
            baseUrl: Environment.apiUrl,
            headers: {'Authorization': 'Bearer $accessToken'}));

  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike) {
    // TODO: implement createUpdateProduct
    throw UnimplementedError();
  }

  @override
  Future<Product> getProductById(String id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsByPage(
      {int limit = 10, int offset = 0}) async {
    final response = await dio
        .get('/products', queryParameters: {'limit': limit, 'offset': offset});
    final List<Product> products = [];

    for (final product in response.data ?? []) {
      products.add(ProductMapper.jsonToEntity(product));
    }

    return products;
  }

  @override
  Future<List<Product>> searchProductsBuTerm(String term) {
    // TODO: implement searchProductsBuTerm
    throw UnimplementedError();
  }
}
