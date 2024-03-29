import 'package:epsi_shop/page/about_us_page.dart';
import 'package:epsi_shop/page/cart_page.dart';
import 'package:epsi_shop/page/home_page.dart';
import 'package:epsi_shop/page/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'bo/artcile.dart';
import 'page/detail_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'cart',
          name: 'cart',
          builder: (BuildContext context, GoRouterState state) {
            return CartPage();
          },
        ),
        GoRoute(
          path: 'aboutus',
          name: 'aboutus',
          builder: (BuildContext context, GoRouterState state) {
            return AboutUsPage();
          },
        ),
        GoRoute(
            path: 'payment',
            name: 'payment',
            builder: (BuildContext context, GoRouterState state) {
              return PaymentPage();
            }),
        GoRoute(
          path: 'detail',
          name: 'detail',
          builder: (BuildContext context, GoRouterState state) {
            return DetailPage(
              state.extra as Article,
            );
          },
        ),
      ],
    ),
  ],
);
