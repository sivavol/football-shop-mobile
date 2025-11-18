import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/models/product_entry.dart';
import 'package:football_shop/widgets/product_entry_card.dart';
import 'package:football_shop/screens/product_detail.dart';

class MyProductListPage extends StatefulWidget {
  const MyProductListPage({super.key});

  @override
  State<MyProductListPage> createState() => _MyProductListPageState();
}

class _MyProductListPageState extends State<MyProductListPage> {
  Future<List<ProductEntry>> fetchMyProduct(CookieRequest request) async {
    final response =
    await request.get('http://127.0.0.1:8000/my-products/');

    List<ProductEntry> myProductList = [];
    for (var d in response) {
      if (d != null) {
        myProductList.add(ProductEntry.fromJson(d));
      }
    }
    return myProductList;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(title: const Text("My Products")),
      body: FutureBuilder(
        future: fetchMyProduct(request),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) => ProductEntryCard(
              product: snapshot.data![index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailPage(
                      product: snapshot.data![index],
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
