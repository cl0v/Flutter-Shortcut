import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';



/// Usase Example:
/// ```dart
/// final router = FluroRouter();
/// router.navigateTo(context, "/users/1234", transition: TransitionType.fadeIn);
/// ```

get usersHandler =>
    Handler(handlerFunc: ( context,  params) => Container());

// onGenerateRoute: router.generator,

void defineRoutes(FluroRouter router) {
  router.define("/users/:id", handler: usersHandler);

  // it is also possible to define the route transition to use
  // router.define("users/:id", handler: usersHandler, transitionType: TransitionType.inFromLeft);
}
