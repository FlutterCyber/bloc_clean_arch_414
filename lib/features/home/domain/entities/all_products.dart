
import 'package:bloc_clean_arch_414/features/home/domain/entities/product.dart';

class AllProducts {
  List<Product> products;
  int total;
  int skip;
  int limit;

  AllProducts({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });
}
