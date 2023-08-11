import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_neumorphic/material_neumorphic.dart';
import 'package:material_neumorphic_example/components/app_bar.dart';
import 'package:material_neumorphic_example/components/app_drawer.dart';
import 'package:material_neumorphic_example/state/form.dart';

class FormScreen extends ConsumerWidget {
  const FormScreen({super.key});
  static const path = '/form';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final neumorphicTheme = theme.extension<NeumorphicTheme>()!;

    final formData = ref.watch(exampleAppFormDataProvider);

    return Scaffold(
      drawer: const LocalDrawer(),
      appBar: const LocalAppBar(),
      body: NeumorphicBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Neumorphic(
                  margin: const EdgeInsets.all(24),
                  padding: const EdgeInsets.all(24),
                  style: neumorphicTheme.styleWith(
                      boxShape: NeumorphicBoxShape.roundRect(
                          const BorderRadius.all(Radius.circular(24)))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NeumorphicTextFormField(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        depth: -4,
                        initialValue: formData.name,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        onChanged: (value) {
                          ref
                              .read(exampleAppFormDataProvider.notifier)
                              .updateWith(name: value);
                        },
                      ),
                      NeumorphicTextFormField(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        depth: -4,
                        initialValue: formData.email,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        onChanged: (value) {
                          ref
                              .read(exampleAppFormDataProvider.notifier)
                              .updateWith(email: value);
                        },
                      ),
                      NeumorphicDropdownButtonFormField<int?>(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          depth: -4,
                          decoration: const InputDecoration(
                            labelText: 'Equipment',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('Item 1'),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Text('Item 2'),
                            ),
                            DropdownMenuItem(
                              value: 3,
                              child: Text('Item 3'),
                            ),
                          ],
                          value: null,
                          onChanged: (value) {}),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            NeumorphicSwitch(
                              height: 32,
                              value: formData.accepctPolicy,
                              onChanged: (value) {
                                ref
                                    .read(exampleAppFormDataProvider.notifier)
                                    .updateWith(accepctPolicy: value);
                              },
                            ),
                            const SizedBox(width: 20),
                            const Text('I agree to the policy',
                                style: TextStyle(
                                    decoration: TextDecoration.underline)),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 240,
                              child: NeumorphicToggle(
                                height: 48,
                                selectedIndex: formData.experince,
                                displayForegroundOnlyIfSelected: true,
                                children: [
                                  ToggleElement(
                                    background: const Center(
                                        child: Text(
                                      'Junior',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                    foreground: const Center(
                                        child: Text(
                                      'Junior',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    )),
                                  ),
                                  ToggleElement(
                                    background: const Center(
                                        child: Text(
                                      'Senior',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )),
                                    foreground: const Center(
                                        child: Text(
                                      'Senior',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    )),
                                  ),
                                ],
                                thumb: Neumorphic(
                                    style: NeumorphicStyle(
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      const BorderRadius.all(
                                          Radius.circular(12))),
                                )),
                                onChanged: (value) {
                                  ref
                                      .read(exampleAppFormDataProvider.notifier)
                                      .updateWith(experince: value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Role'),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: NeumorphicRadio(
                                      value: AppUserRole.developer,
                                      groupValue: formData.role,
                                      onChanged: (value) {
                                        ref
                                            .read(exampleAppFormDataProvider
                                                .notifier)
                                            .updateWith(role: value);
                                      },
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Center(
                                        child: Text('Devloper'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: NeumorphicRadio(
                                      value: AppUserRole.designer,
                                      groupValue: formData.role,
                                      onChanged: (value) {
                                        ref
                                            .read(exampleAppFormDataProvider
                                                .notifier)
                                            .updateWith(role: value);
                                      },
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Center(
                                        child: Text('Designer'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: NeumorphicRadio(
                                      value: AppUserRole.productManager,
                                      groupValue: formData.role,
                                      onChanged: (value) {
                                        ref
                                            .read(exampleAppFormDataProvider
                                                .notifier)
                                            .updateWith(role: value);
                                      },
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Center(
                                        child: Text('Product Manager'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Container(
                          margin: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Work in UTC time:'),
                              SizedBox(
                                height: 32,
                                child: NeumorphicRangeSlider(
                                  valueLow: formData.workStart,
                                  valueHigh: formData.workEnd,
                                  min: 0,
                                  max: 23,
                                  onChangedLow: (value) {
                                    ref
                                        .read(
                                            exampleAppFormDataProvider.notifier)
                                        .updateWith(workStart: value);
                                  },
                                  onChangeHigh: (value) {
                                    ref
                                        .read(
                                            exampleAppFormDataProvider.notifier)
                                        .updateWith(workEnd: value);
                                  },
                                ),
                              ),
                              Text(
                                  'Start at ${formData.workStart.toStringAsFixed(0)} UTC'),
                              Text(
                                  'End at ${formData.workEnd.toStringAsFixed(0)} UTC'),
                            ],
                          )),
                      Container(
                        margin: const EdgeInsets.all(12),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Zone'),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  SizedBox(
                                    width: 240,
                                    child: Neumorphic(
                                        margin: const EdgeInsets.all(12),
                                        padding: const EdgeInsets.all(12),
                                        child: Row(children: [
                                          NeumorphicCheckbox(
                                              value: formData.zones[0],
                                              onChanged: (value) {
                                                ref
                                                    .read(
                                                        exampleAppFormDataProvider
                                                            .notifier)
                                                    .updateWith(
                                                        zones: List.from(
                                                            formData.zones)
                                                          ..[0] = value);
                                              }),
                                          const SizedBox(
                                              width: 100,
                                              child: Center(
                                                  child: Text('Zone 1'))),
                                        ])),
                                  ),
                                  SizedBox(
                                    width: 240,
                                    child: Neumorphic(
                                        margin: const EdgeInsets.all(12),
                                        padding: const EdgeInsets.all(12),
                                        child: Row(children: [
                                          NeumorphicCheckbox(
                                              value: formData.zones[1],
                                              onChanged: (value) {
                                                ref
                                                    .read(
                                                        exampleAppFormDataProvider
                                                            .notifier)
                                                    .updateWith(
                                                        zones: List.from(
                                                            formData.zones)
                                                          ..[1] = value);
                                              }),
                                          const SizedBox(
                                              width: 100,
                                              child: Center(
                                                  child: Text('Zone 2'))),
                                        ])),
                                  ),
                                  SizedBox(
                                    width: 240,
                                    child: Neumorphic(
                                        margin: const EdgeInsets.all(12),
                                        padding: const EdgeInsets.all(12),
                                        child: Row(children: [
                                          NeumorphicCheckbox(
                                              isEnabled: false,
                                              value: formData.zones[2],
                                              onChanged: (value) {
                                                ref
                                                    .read(
                                                        exampleAppFormDataProvider
                                                            .notifier)
                                                    .updateWith(
                                                        zones: List.from(
                                                            formData.zones)
                                                          ..[2] = value);
                                              }),
                                          const SizedBox(
                                              width: 100,
                                              child: Center(
                                                  child: Text('Zone 3'))),
                                        ])),
                                  ),
                                ],
                              )
                            ]),
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
