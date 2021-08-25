
import 'package:client/src/widgets/home/connect_control.dart';
import 'package:client/src/widgets/home/create_room_control.dart';
import 'package:client/src/widgets/home/join_room_control.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        children: [
          ConnectControl(),
          CreateRoomControl(),
          JoinRoomControl()
        ],
      )
    ),
  );
}