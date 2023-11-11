import 'package:flutter/material.dart';
import 'package:sayurbox_inventory/widgets/product_model.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products;

  ProductListPage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Jumlah produk di ProductListPage: ${products.length}");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
        backgroundColor: Colors.teal[300],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(
              'Kategori: ${product.category}, Harga: ${product.price}, Jumlah: ${product.amount}, Deskripsi: ${product.description}',
            ),
          );
        },
      ),
    );
  }
}
