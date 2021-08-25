

import 'package:client/src/state/app_state_widgets.dart';
import 'package:flutter/material.dart';

class ConnectControl extends StatelessWidget {

  @override
  Widget build(BuildContext context) => AppStateWidget((state) => ElevatedButton(
    child: const Text('Connect'),
    onPressed: () {
      state.connect();
    }
  ));
}