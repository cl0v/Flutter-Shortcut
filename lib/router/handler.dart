
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

Handler _handler(Widget page) =>
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return page;
    });

class RouteHandler {
  static get home => _handler(Container()); // TODO: Adicionar as rotas aqui
}

class AdminRouteHandler {
  static get dash => _handler(Container()); // TODO: Adicionar as rotas aqui 
}