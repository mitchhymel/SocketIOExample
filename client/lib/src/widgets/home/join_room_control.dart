

import 'package:client/src/state/app_state_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class JoinRoomControl extends HookWidget {

  @override
  Widget build(BuildContext context) {

    var controller = useTextEditingController();

    return AppStateWidget((state) => Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
          ),
        ),
        ElevatedButton(
          child: const Text('Join Room'),
          onPressed: () {
            state.joinRoom(controller.text);
          }
        )
      ],
    ));
  }
}