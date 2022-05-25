import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class NavigationService {
  static const String home = '/home';
  static const String artDetails = '/artDetails/:id';

  static void back(BuildContext context, String routeAux, {bool isReplacement = true}) {
    if (context.vRouter.historyCanBack()) {
      context.vRouter.historyBack();
    } else {
      context.vRouter.to(routeAux, isReplacement: isReplacement);
    }
  }
}
