import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:material_neumorphic_example/screens/splash/splash_screen.dart';
import 'package:material_neumorphic_example/screens/home/home_screen.dart';

part 'router_notifier.g.dart';

@riverpod
class RouterNotifier extends _$RouterNotifier implements Listenable {
// ignore: avoid_public_notifier_properties
  VoidCallback? routerListener;
// ignore: avoid_public_notifier_properties
  bool isAuth = false; // Useful for our global redirect function

  @override
  Future<void> build() async {
    ref.listenSelf((_, __) {
      // One could write more conditional logic for when to call redirection
      if (state.isLoading) return;
      routerListener?.call();
    });
  }

  /// Redirects the user when our authentication changes
  String? redirect(BuildContext context, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) return null;

    final isSplash = state.path == SplashScreen.path;
    debugPrint('isSplash: $isSplash');
    if (isSplash) {
      return HomeScreen.path;
    }
    return null;
  }

  List<GoRoute> get routes => [
        GoRoute(
          path: SplashScreen.path,
          pageBuilder: (context, state) {
            return MaterialPage<void>(
              key: state.pageKey,
              child: const SplashScreen(),
            );
          },
          redirect: (context, state) async {
            await Future.delayed(const Duration(seconds: 2));

            return HomeScreen.path;
          },
        ),
        GoRoute(
            path: HomeScreen.path,
            pageBuilder: (context, state) {
              return NoTransitionPage<void>(
                key: state.pageKey,
                child: const HomeScreen(),
              );
            },
            routes: const []),
      ];

  /// Adds [GoRouter]'s listener as specified by its [Listenable].
  /// [GoRouteInformationProvider] uses this method on creation to handle its
  /// internal [ChangeNotifier].
  /// Check out the internal implementation of [GoRouter] and
  /// [GoRouteInformationProvider] to see this in action.
  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  /// Removes [GoRouter]'s listener as specified by its [Listenable].
  /// [GoRouteInformationProvider] uses this method when disposing,
  /// so that it removes its callback when destroyed.
  /// Check out the internal implementation of [GoRouter] and
  /// [GoRouteInformationProvider] to see this in action.
  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}
