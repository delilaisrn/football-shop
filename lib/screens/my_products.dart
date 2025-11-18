import 'package:flutter/material.dart';
import 'package:football_shop/models/products_entry.dart';
import 'package:football_shop/widgets/products_entry_card.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/screens/products_detail.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyProductsListPage extends StatefulWidget {
  const MyProductsListPage({super.key});

  @override
  State<MyProductsListPage> createState() => _MyProductsListPageState();
}

class _MyProductsListPageState extends State<MyProductsListPage> {
  Future<List<ProductsEntry>> fetchMyProducts(CookieRequest request) async {
    final response = await request.get(
      'http://localhost:8000/json/my-products/'
    );

    List<ProductsEntry> products = [];
    for (var d in response) {
      products.add(ProductsEntry.fromJson(d));
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(title: const Text("My Products")),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchMyProducts(request),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Kamu belum punya produk."));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) => ProductsEntryCard(
              products: snapshot.data![index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsDetailPage(
                      products: snapshot.data![index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
