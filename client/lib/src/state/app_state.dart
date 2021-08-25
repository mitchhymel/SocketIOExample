
import 'package:client/src/utils/logging.dart';
import 'package:client/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';
import 'package:socket_io_client/socket_io_client.dart';

final appStateProvider = ChangeNotifierProvider<AppState>((_) => AppState());



class AppState extends ChangeNotifier {
  

  String _roomId = '';
  String get roomId => _roomId;
  _updateRoomid(String id) {
    _roomId = id;
    notifyListeners();
  }
  bool get isInRoom => _roomId != '';

  late Socket socket;

  AppState() {
    socket = io(Utils.getServerUrl(), <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    // set up listeners;
    socket.on(Messages.CONNECT.toString(), _onConnect);
    socket.on(Messages.EVENT.toString(), _onEvent);
    socket.on(Messages.CREATED_ROOM.toString(), _onCreatedRoom);
    socket.on(Messages.JOINED_ROOM.toString(), _onJoinedRoom);
  }


  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }


  void connect() {
    socket.connect();
  }

  void createRoom() {
    socket.emit(Messages.CREATE_ROOM.toString());
  }

  void joinRoom(String id) {
    var message = JoinRoomMessage(id);
    log('joinRoom: ${message.toJson()}');
    socket.emit(Messages.JOIN_ROOM.toString(), message.toJson());
  }

  void leaveRoom() {
    log('leaveRoom');
    socket.close();
    _updateRoomid('');
  }

  void _onConnect(msg) {
    log('Connected');
  }

 void  _onEvent(msg) {
    log('Event: $msg');
  }

  void _onCreatedRoom(msg) {
    var createdRoomMessage = CreatedRoomMessage.fromJson(msg);
    log('CreatedRoom: ${createdRoomMessage.toJson()}');
    _updateRoomid(createdRoomMessage.id);
  }

  void _onJoinedRoom(msg) {
    var createdRoomMessage = CreatedRoomMessage.fromJson(msg);
    log('JoinedRoom: ${createdRoomMessage.toJson()}');
    _updateRoomid(createdRoomMessage.id);
  }

}