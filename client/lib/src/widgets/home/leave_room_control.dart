

import 'package:client/src/state/app_state_widgets.dart';
import 'package:flutter/material.dart';

class LeaveRoomControl extends StatelessWidget {

  @override
  Widget build(BuildContext context) => AppStateWidget((state) => ElevatedButton(
    child: const Text('Leave Room'),
    onPressed: () {
      state.leaveRoom();
    }
  ));
}