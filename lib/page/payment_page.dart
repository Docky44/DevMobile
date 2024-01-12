import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Finalisation de la commande'),
      ),
      body: Column(
        children: [
          Consumer<Cart>(
            builder: (BuildContext context, Cart cart, Widget? child) {
              double sousTotal = cart.getTotal() / 100;
              double tva = sousTotal * 0.2;
              double total = sousTotal + tva;
              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side:
                      BorderSide(color: Theme.of(context).colorScheme.outline),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Récapitulatif de votre commande',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Row(children: [
                        Text('Sous Total :'),
                        Spacer(),
                        Text('${sousTotal.toStringAsFixed(2)}€'),
                      ]),
                      SizedBox(height: 8),
                      Row(children: [
                        Text('Vous économisez :',
                            style: TextStyle(color: Colors.green)),
                        Spacer(),
                        Text('-20 €', style: TextStyle(color: Colors.green)),
                      ]),
                      SizedBox(height: 8),
                      Row(children: [
                        Text('TVA :'),
                        Spacer(),
                        Text('${tva.toStringAsFixed(2)}€'),
                      ]),
                      SizedBox(height: 8),
                      Row(children: [
                        Text('TOTAL :',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Spacer(),
                        Text('${total.toStringAsFixed(2)}€',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Adresse de livraison',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
          ]),
          SizedBox(height: 8),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Theme.of(context).colorScheme.outline),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(children: [
                    Text('Michel Le Poney',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                  ]),
                  SizedBox(height: 8),
                  Row(children: [
                    Text('1 rue du poney'),
                    Spacer(),
                    Icon(Icons.chevron_right),
                  ]),
                  Row(children: [
                    Text('75000 Paris'),
                    Spacer(),
                  ]),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Méthode de paiement',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
          ]),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.applePay),
                          iconSize: 30,
                          onPressed: () {
                            print("Pressed");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.ccVisa),
                          iconSize: 30,
                          onPressed: () {
                            print("Pressed");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.ccMastercard),
                          iconSize: 30,
                          onPressed: () {
                            print("Pressed");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.ccPaypal),
                          iconSize: 30,
                          onPressed: () {
                            print("Pressed");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "En cliquant sur Confirmer vous acceptez les Conditions de vente de EPSI Shop International. Besoin d'aide ? Désolé, on ne peut rien faire.\nEn poursuivant, acceptez les Conditions d'utilisation du fournisseur de paiement CotfeeDis.",
                  style: TextStyle(fontSize: 11.0),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Votre commande est validée"),
                      ),
                    );
                  },
                  child: Text("Confirmer l'achat"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
