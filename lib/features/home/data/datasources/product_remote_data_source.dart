import 'package:dio/dio.dart';
import '../../domain/entities/all_products.dart';
import '../../domain/entities/categories.dart';
import '../models/all_products_model.dart';
import '../models/categories_model.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getSingleProduct({required int id});

  Future<AllProducts> getAllProducts();

  Future<AllProducts> searchAllProducts({required String word});

  Future<AllProducts> sortAllProducts({
    required String sortName,
    required String ascDesc,
  });

  Future<List<Category>> getCategories();

  Future<AllProducts> getProductsByCategory({required String url});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<ProductModel> getSingleProduct({required int id}) async {
    final response = await dio.get(
      'https://dummyjson.com/products/$id',
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ProductModel.fromJson(response.data);
    } else {
      throw Exception('Failed to get single product');
    }
  }

  @override
  Future<AllProducts> getAllProducts() async {
    final response = await dio.get('https://dummyjson.com/products');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return AllProductsModel.fromJson(response.data);
    } else {
      throw Exception('Failed to get all products');
    }
  }

  @override
  Future<AllProducts> searchAllProducts({required String word}) async {
    final response = await dio.get(
      'https://dummyjson.com/products/search?q=$word',
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return AllProductsModel.fromJson(response.data);
    } else {
      throw Exception('Failed to get all products');
    }
  }

  @override
  Future<AllProducts> sortAllProducts({
    required String sortName,
    required String ascDesc,
  }) async {
    final response = await dio.get(
      'https://dummyjson.com/products?sortBy=$sortName&order=$ascDesc',
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return AllProductsModel.fromJson(response.data);
    } else {
      throw Exception('Failed to sort products');
    }
  }

  @override
  Future<List<Category>> getCategories() async {
    final response = await dio.get('https://dummyjson.com/products/categories');

    if (response.statusCode == 200 || response.statusCode == 201) {
      //return CategoriesModel.fromJson(response.data);
      return categoriesFromJson(response.data);
    } else {
      throw Exception('Failed to get categories');
    }
  }

  @override
  Future<AllProducts> getProductsByCategory({required String url}) async {
    final response = await dio.get(url);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return AllProductsModel.fromJson(response.data);
    } else {
      throw Exception('Failed to get getProductsByCategory');
    }
  }
}
