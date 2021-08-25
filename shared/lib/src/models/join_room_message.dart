
import 'package:json_annotation/json_annotation.dart';

part 'join_room_message.g.dart';

@JsonSerializable()
class JoinRoomMessage {
  JoinRoomMessage(this.id);
  String id;

  factory JoinRoomMessage.fromJson(Map<String, dynamic> json) => _$JoinRoomMessageFromJson(json);
  Map<String, dynamic> toJson() => _$JoinRoomMessageToJson(this);
}