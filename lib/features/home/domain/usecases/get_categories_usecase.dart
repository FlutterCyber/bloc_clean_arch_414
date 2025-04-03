import '../entities/categories.dart';
import '../repositories/product_repository.dart';

class GetCategoriesUsecase {
  final ProductRepository repository;

  GetCategoriesUsecase(this.repository);

  Future<List<Category>> call() {
    return repository.getCategories();
  }
}
