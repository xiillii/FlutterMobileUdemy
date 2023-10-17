import 'package:teslo_app/features/products/domain/datasources/products_datasources.dart';
import 'package:teslo_app/features/products/domain/entities/product.dart';

class ProductsDatasourceImpl implements ProductsDatasource {
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
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0}) {
    // TODO: implement getProductsByPage
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> searchProductsBuTerm(String term) {
    // TODO: implement searchProductsBuTerm
    throw UnimplementedError();
  }
}
