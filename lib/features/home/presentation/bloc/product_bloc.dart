import 'package:bloc_clean_arch_414/features/home/domain/usecases/product_usecase.dart';
import 'package:bloc_clean_arch_414/features/home/presentation/bloc/product_event.dart';
import 'package:bloc_clean_arch_414/features/home/presentation/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUseCase productUseCase;

  ProductBloc({required this.productUseCase}) : super(ProductInitial()) {
    on<FetchProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        final product = await productUseCase.call(id: event.id);
        emit(ProductLoaded(product));
      } catch (e, s) {
        print(e);
        print(s);
        emit(ProductError(e.toString()));
      }
    });
  }
}
