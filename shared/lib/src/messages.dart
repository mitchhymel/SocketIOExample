

class Messages {

  final String name;
  const Messages._private(this.name);

  static const CONNECT = Messages._private('connect');
  static const EVENT = Messages._private('event');
  static const CREATE_ROOM = Messages._private('createRoom');
  static const JOIN_ROOM = Messages._private('joinRoom');
  static const LEAVE_ROOM = Messages._private('leaveRoom');

  @override
  String toString() => this.name;
}