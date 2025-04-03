import 'package:bloc_clean_arch_414/features/home/presentation/bloc/product_bloc.dart';
import 'package:bloc_clean_arch_414/features/home/presentation/bloc/product_event.dart';
import 'package:bloc_clean_arch_414/features/home/presentation/bloc/product_state.dart';
import 'package:bloc_clean_arch_414/features/home/presentation/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController idController = TextEditingController();

  void onFetchProductPressed() {
    final id = int.parse(idController.text.trim());
    if (id >= 0) {
      context.read<ProductBloc>().add(FetchProduct(id: id));
    } else {
      print("Id can not be less than 0");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product page"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: "Enter an id of product"),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                onFetchProductPressed();
              },
              child: Text("Fetch Product"),
            ),
            SizedBox(height: 30),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ProductError) {
                    return Center(child: Text(state.message));
                  } else if (state is ProductLoaded) {
                    return ProductWidget(product: state.product);
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
