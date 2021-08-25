import 'package:shared/shared.dart';
import 'package:socket_io/socket_io.dart';

List<Socket> clients = [];
const int port = 3000;

main() {
    var io = new Server();
    
    io.on(Messages.CONNECT.toString(), (client) {
      
      Socket socket = client as Socket;
      print('New Client Connected: ${socket.id}');
      
      socket.on(Messages.CREATE_ROOM.toString(), (data) {
        print('${socket.id}: createRoom => $data');
        // generate random string for roomid
        String newId = 'ABCDE';

        var message = CreatedRoomMessage(newId);
        socket.emit(Messages.CREATED_ROOM.toString(), message);
      });

      socket.on(Messages.JOIN_ROOM.toString(), (data) {
        print('${socket.id}: joinRoom => $data');
        var joinRoomMessage = JoinRoomMessage.fromJson(data);

        socket.join(joinRoomMessage.id);
        socket.emit(Messages.JOINED_ROOM.toString(), joinRoomMessage.toJson());
      });

      
      clients.add(socket);
    });

    print('Listening on port $port');
    io.listen(port);
}