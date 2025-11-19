import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/product_form.dart';
import 'package:football_shop/screens/products_entry_list.dart';
import 'package:football_shop/screens/my_products.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 114, 33, 243)),
            child: Column(
              children: [
                Text(
                  'Saturn Sports Station',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Tempat terbaik untuk belanja perlengkapan bola!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_box_outlined),
            title: const Text('Tambah Produk'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProductFormPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('All Products'),
            onTap: () {
                // Route to news list page
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductsEntryListPage()),
                );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('My Products'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyProductsListPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
