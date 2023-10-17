import 'package:teslo_app/features/products/domain/entities/product.dart';

abstract class ProductsDatasource {
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0});
  Future<Product> getProductById(String id);
  Future<List<Product>> searchProductsBuTerm(String term);
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike);
}
