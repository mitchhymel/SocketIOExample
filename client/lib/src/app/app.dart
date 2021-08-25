
import 'package:client/src/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends StatelessWidget {
  const App({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) => ProviderScope(
    child: AppWidget()
  );
}