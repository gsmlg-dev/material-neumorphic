import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_neumorphic_example/screens/form/form_screen.dart';
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

    return null;
  }

  List<GoRoute> get routes => [
        GoRoute(
          path: SplashScreen.path,
          name: SplashScreen.path,
          pageBuilder: (context, state) {
            return MaterialPage<void>(
              key: state.pageKey,
              child: const SplashScreen(),
            );
          },
        ),
        GoRoute(
            path: HomeScreen.path,
            name: HomeScreen.path,
            pageBuilder: (context, state) {
              return NoTransitionPage<void>(
                key: state.pageKey,
                child: const HomeScreen(),
              );
            },
            routes: const []),
        GoRoute(
            path: FormScreen.path,
            name: FormScreen.path,
            pageBuilder: (context, state) {
              return NoTransitionPage<void>(
                key: state.pageKey,
                child: const FormScreen(),
              );
            },
            routes: const []),
      ];

  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}
