import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bo/artcile.dart';
import '../bo/cart.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.article, {super.key});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Detail ${article.nom}',
          ),
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                Image.network(article.image, width: 150),
                Text(article.nom,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(article.description),
                Text(article.getPrixEnEuros()),
                Spacer(),
                ElevatedButton(
                    onPressed: () => context.read<Cart>().add(article),
                    child: const Text('Ajouter au panier'))
              ])),
        ));
  }
}
