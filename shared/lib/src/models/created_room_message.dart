
import 'package:json_annotation/json_annotation.dart';

part 'created_room_message.g.dart';

@JsonSerializable()
class CreatedRoomMessage {
  CreatedRoomMessage(this.id);
  String id;

  factory CreatedRoomMessage.fromJson(Map<String, dynamic> json) => _$CreatedRoomMessageFromJson(json);
  Map<String, dynamic> toJson() => _$CreatedRoomMessageToJson(this);
}