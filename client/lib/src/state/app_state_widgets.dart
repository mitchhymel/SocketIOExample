import 'package:client/src/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef StoreWidgetBuilder<T> = Widget Function(T);
class StoreWidget<T extends ChangeNotifier> extends HookConsumerWidget {
  final ChangeNotifierProvider<T> provider;
  final StoreWidgetBuilder<T> builder;
  const StoreWidget({
    required this.builder,
    required this.provider
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(provider);
    return builder(value);
  }
}

class AppStateWidget extends StatelessWidget {
  final StoreWidgetBuilder<AppState> builder;
// ignore: use_key_in_widget_constructors
  const AppStateWidget(this.builder);

  @override
  Widget build(BuildContext context) => StoreWidget<AppState>(
    provider: appStateProvider,
    builder: builder,
  );
}