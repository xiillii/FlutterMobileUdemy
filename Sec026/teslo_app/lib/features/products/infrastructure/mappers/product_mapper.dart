import 'package:teslo_app/config/config.dart';
import 'package:teslo_app/features/auth/infrastructure/infrastructure.dart';
import 'package:teslo_app/features/products/domain/entities/product.dart';

class ProductMapper {
  static jsonToEntity(Map<String, dynamic> json) => Product(
      id: json['id'],
      title: json['title'],
      price: double.parse(json['price'].toString()),
      description: json['description'],
      slug: json['slug'],
      stock: json['stock'],
      sizes: List<String>.from(json['sizes'].map((x) => x)),
      gender: json['gender'],
      tags: List<String>.from(json['tags'].map((x) => x)),
      images: List<String>.from(json['images'].map((String x) =>
          x.startsWith('http') ? x : '${Environment.apiUrl}/files/product/$x')),
      user: UserMapper.fromJson(json['user']));
}
