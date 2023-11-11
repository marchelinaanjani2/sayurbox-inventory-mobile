import 'package:flutter/material.dart';
import 'package:sayurbox_inventory/screens/menu.dart';
import 'package:sayurbox_inventory/screens/shoplist_form.dart';
import 'package:sayurbox_inventory/screens/product_list_page.dart';
import 'package:sayurbox_inventory/widgets/product_model.dart';

class LeftDrawer extends StatelessWidget {
  final List<Product> products; // Tambahkan properti products

  const LeftDrawer({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 76, 153, 86)),
            child: Column(
              children: [
                Text(
                  'SayurBox Inventory',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  "Catat seluruh keperluan belanjamu di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(products: products),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Produk'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopFormPage(products: products),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.view_list),
            title: const Text('Lihat Produk'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductListPage(products: products),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
