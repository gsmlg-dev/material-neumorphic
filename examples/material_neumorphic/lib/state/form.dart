import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form.g.dart';

enum AppUserRole {
  developer,
  designer,
  productManager,
}

@immutable
class AppFormData {
  final String name;
  final String email;
  final bool accepctPolicy;
  final int experince;
  final AppUserRole role;
  final double workStart;
  final double workEnd;
  final List<bool> zones;

  const AppFormData({
    required this.name,
    required this.email,
    required this.accepctPolicy,
    required this.experince,
    required this.role,
    required this.workStart,
    required this.workEnd,
    required this.zones,
  });

  const AppFormData.init()
      : this(
          name: '',
          email: '',
          accepctPolicy: false,
          experince: 0,
          role: AppUserRole.developer,
          workStart: 9,
          workEnd: 17,
          zones: const [false, false, false],
        );

  AppFormData updateWith({
    String? name,
    String? email,
    bool? accepctPolicy,
    int? experince,
    AppUserRole? role,
    double? workStart,
    double? workEnd,
    List<bool>? zones,
  }) {
    return AppFormData(
      name: name ?? this.name,
      email: email ?? this.email,
      accepctPolicy: accepctPolicy ?? this.accepctPolicy,
      experince: experince ?? this.experince,
      role: role ?? this.role,
      workStart: workStart ?? this.workStart,
      workEnd: workEnd ?? this.workEnd,
      zones: zones ?? this.zones,
    );
  }
}

@riverpod
class ExampleAppFormData extends _$ExampleAppFormData {
  @override
  AppFormData build() {
    return const AppFormData.init();
  }

  updateWith({
    String? name,
    String? email,
    bool? accepctPolicy,
    int? experince,
    AppUserRole? role,
    double? workStart,
    double? workEnd,
    List<bool>? zones,
  }) {
    state = state.updateWith(
      name: name,
      email: email,
      accepctPolicy: accepctPolicy,
      experince: experince,
      role: role,
      workStart: workStart,
      workEnd: workEnd,
      zones: zones,
    );
  }
}
