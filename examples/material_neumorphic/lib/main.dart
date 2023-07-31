import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_neumorphic_example/utils/state_logger.dart';
import 'package:material_neumorphic_example/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(observers: [StateLogger()], child: App()),
  );
}
