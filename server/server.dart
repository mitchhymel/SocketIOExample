import 'package:socket_io/socket_io.dart';

List<dynamic> clients = [];

main() {
    var io = new Server();
    // var nsp = io.of('/some');
    // nsp.on('connection', (client) {
    //   print('connection /some');
    //   client.on('msg', (data) {
    //     print('data from /some => $data');
    //     client.emit('fromServer', "ok 2");
    //   });
    // });
    
    io.on('connect', (client) {
      
      print('client connected: ${client.id}');
      clients.add(client);
      
      client.emit('event', 'connected');

      client.on('custom', (data) {
        print('data from default => $data');
        client.emit('event', "ok");
      });

      client.on('global', (data) {
        for (var cl in clients) {
          cl.emit('global', data);
        }
      });

      print('client listeners set up');
    });

    print('Listening on port 3000');
    io.listen(3000);
}