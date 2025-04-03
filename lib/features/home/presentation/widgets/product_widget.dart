import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';


class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(product.description),
            const SizedBox(height: 10),
            Text("Category: ${product.category}"),
            Text("Brand: ${product.brand}"),
            Text("Price: \$${product.price}"),
            Text("Rating: ${product.rating} ⭐"),
            const SizedBox(height: 10),
            if (product.images.isNotEmpty)
              Image.network(
                product.images.first,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 10),
            Text("Stock: ${product.stock}"),
            Text("Warranty: ${product.warrantyInformation}"),
          ],
        ),
      ),
    );
  }
}
