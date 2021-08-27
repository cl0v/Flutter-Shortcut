import 'package:flutter/material.dart';

// Easy way to navigate between the app.

push(BuildContext context, Widget page, {bool replace = false}) => replace
    ? Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page))
    : Navigator.push(context, MaterialPageRoute(builder: (context) => page));

pushNamed(BuildContext context, String route, {bool replace = false}) => replace
      ? Navigator.pushReplacementNamed(context, route)
      : Navigator.pushNamed(context, route);

popUntil(BuildContext context, String route) =>
    Navigator.popUntil(context, ModalRoute.withName(route));

pop(BuildContext context, [result]) => Navigator.pop(context, result);
