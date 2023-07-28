import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_neumorphic_example/utils/state_logger.dart';
import 'package:material_neumorphic_example/app.dart';
import 'package:material_neumorphic_example/database/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Database.initialize();
  await Database.performMigrationIfNeeded();

  runApp(
    const ProviderScope(observers: [StateLogger()], child: App()),
  );
}
