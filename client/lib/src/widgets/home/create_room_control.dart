

import 'package:client/src/state/app_state_widgets.dart';
import 'package:flutter/material.dart';

class CreateRoomControl extends StatelessWidget {

  @override
  Widget build(BuildContext context) => AppStateWidget((state) => ElevatedButton(
    child: const Text('Create Room'),
    onPressed: () {
      state.createRoom();
    }
  ));
}