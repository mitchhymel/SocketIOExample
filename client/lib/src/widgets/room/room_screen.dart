
import 'package:client/src/state/app_state_widgets.dart';
import 'package:client/src/widgets/home/leave_room_control.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: AppStateWidget((state) => Text(state.roomId)),
    ),
    body: Center(
      child: Column(
        children: [
          LeaveRoomControl()
        ],
      )
    ),
  );
}