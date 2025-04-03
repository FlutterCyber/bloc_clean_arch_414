import '../entities/all_products.dart';
import '../repositories/product_repository.dart';

class SortAllProductsUsecase {
  final ProductRepository repository;

  SortAllProductsUsecase(this.repository);

  Future<AllProducts> call(
      {required String sortName, required String ascDesc}) {
    return repository.sortAllProducts(sortName: sortName, ascDesc: ascDesc);
  }
}
