import 'package:flutter/material.dart';

import 'rrect_path_provider.dart';

@immutable
class StadiumPathProvider extends RRectPathProvider {
  const StadiumPathProvider({Listenable? reclip})
      : super(
            const BorderRadius.all(
              Radius.circular(1000),
            ),
            reclip: reclip);
}
