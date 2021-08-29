import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });

    // router.define(RootPage.routeName, handler: RouteHandler.rootHandler);
    // router.define(userAndOrder, handler: userAndOrderHandler);

    // router.define('admin', handler: AdminRouteHandler.dash); // TODO: Adicionar as rotas
  }
}
