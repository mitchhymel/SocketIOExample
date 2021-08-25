import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    socket = IO.io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();

    socket.on('connect', (obj) {
      print('client connect: $obj');
    });
    socket.on('event', (data) {
      print('event: $data');
    });
    socket.on('global', (data) {
      print('global: $data');
    });
  }

  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It ta
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Connect'),
              onPressed: () {
                socket.connect();
              },
            ),
            ElevatedButton(
              child: const Text('Send message'),
              onPressed: () {
                print('sending message');
                print(socket.id);
                socket.emit('custom', 'from client');
                print('sent message');
              },
            ),
            ElevatedButton(
              child: const Text('Send global'),
              onPressed: () {
                print('sending global');
                socket.emit('global', 'from ${kIsWeb ? "web" : "windows"}');
                print('sent global');
              },
            ),
          ],
        ),
      ),
    );
  }
}
