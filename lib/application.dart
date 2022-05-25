import 'package:art_place_app/core/theme.dart';
import 'package:art_place_app/presentation/pages/art_details.dart';
import 'package:art_place_app/presentation/pages/home.dart';
import 'package:art_place_app/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrouter/vrouter.dart';

class ArtPlaceApp extends StatelessWidget {
  const ArtPlaceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const MaterialApp(
      title: 'Art place app',
      debugShowCheckedModeBanner: false,
      home: ArtPlaceAppVRouter(),
    );
  }
}

class ArtPlaceAppVRouter extends ConsumerWidget {
  const ArtPlaceAppVRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VRouter(
      theme: myTheme,
      buildTransition: (animation, _, child) => FadeTransition(opacity: animation, child: child),
      routes: [
        VWidget(path: NavigationService.home, widget: const HomePage(), stackedRoutes: [
          VWidget(
            path: NavigationService.artDetails,
            widget: const ArtDetailsPage(),
          )
        ])
      ],
      initialUrl: NavigationService.home,
      transitionDuration: Duration.zero,
      mode: VRouterMode.history,
      debugShowCheckedModeBanner: false,
      title: "Art place app",
    );
  }
}
