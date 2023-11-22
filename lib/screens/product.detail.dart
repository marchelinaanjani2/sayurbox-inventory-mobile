import 'package:flutter/material.dart';
import 'package:sayurbox_inventory/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${product.fields.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Category: ${product.fields.category}'),
            SizedBox(height: 10),
            Text('Price: ${product.fields.price}'),
            SizedBox(height: 10),
            Text('Amount: ${product.fields.amount}'),
            SizedBox(height: 10),
            Text('Description: ${product.fields.description}'),
            // Add more attributes as needed
          ],
        ),
      ),
    );
  }
}
