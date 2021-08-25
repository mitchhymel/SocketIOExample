
import 'package:beamer/beamer.dart';
import 'package:client/src/state/app_state_widgets.dart';
import 'package:client/src/widgets/home/home_screen.dart';
import 'package:client/src/widgets/room/room_screen.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {

  final routerDelegate = BeamerDelegate(
    locationBuilder: SimpleLocationBuilder(
      routes: {
        '/': (context, state) => HomeScreen(),
      },
    ),
  );

  @override
  Widget build(BuildContext context) => MaterialApp(
    themeMode: ThemeMode.dark,
    home: AppStateWidget((state) => state.isInRoom ? RoomScreen() : HomeScreen()),
  );
}