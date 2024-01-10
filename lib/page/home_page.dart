import 'dart:convert';

import 'package:epsi_shop/bo/artcile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final listArticle = <Article>[
    Article(
        nom: 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
        image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
        description: 'Description 1',
        prix: 10995,
        categorie: 'Sac'),
    Article(
        nom: 'Mens Casual Premium Slim Fit T-Shirts',
        image:
            'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
        description: 'Description 2',
        prix: 2230,
        categorie: 'TShirt')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: [
            Text(
              'E-Commerce',
            ),
            Spacer(),
            Badge(
              offset: Offset(-5, 5),
              label: Text(
                  "${context.watch<Cart>().listArticles.length > 99 ? '+99' : context.watch<Cart>().listArticles.length}"),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () => context.goNamed('cart'),
              ),
            ),
          ]),
          backgroundColor: Colors.lightBlue,
        ),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: FutureBuilder<List<Article>>(
                future: fetchListProducts(),
                builder: (context, snapshot) => switch (snapshot.connectionState) {
                  ConnectionState.done when snapshot.data != null =>
                    ListArticles(listArticle: snapshot.data!),
                  ConnectionState.waiting =>
                    const Center(child: CircularProgressIndicator()),
                  _ => const Icon(Icons.error),
                })));
  }

  Future<List<Article>> fetchListProducts() async {
    Response resListArt =
        await get(Uri.parse('https://fakestoreapi.com/products'));
    if (resListArt.statusCode == 200 && resListArt.body.isNotEmpty) {
      final resListMap = jsonDecode(resListArt.body) as List<dynamic>;
      return resListMap
          .map<Article>((map) => Article.fromMap(map as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load list articles');
    }
  }
}

class ListArticles extends StatelessWidget {
  const ListArticles({
    super.key,
    required this.listArticle,
  });

  final List<Article> listArticle;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listArticle.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
              onTap: () {
                context.goNamed('detail', extra: listArticle[index]);
              },
              leading: Image.network(listArticle[index].image, width: 60),
              title: Text(listArticle[index].nom),
              subtitle: Text(
                listArticle[index].getPrixEnEuros(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: TextButton(
                onPressed: () {
                  context.read<Cart>().add(listArticle[index]);
                },
                child: Text('Ajouter'),
              )),
        );
      },
    );
  }
}
