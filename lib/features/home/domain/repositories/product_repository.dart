
import '../entities/all_products.dart';
import '../entities/categories.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Product> getSingleProduct({required int id});

  Future<AllProducts> getAllProducts();

  Future<AllProducts> searchAllProducts({required String word});

  Future<AllProducts> sortAllProducts(
      {required String sortName, required String ascDesc});

  Future<List<Category>> getCategories();

  Future<AllProducts> getProductsByCategory({required String url});

}
