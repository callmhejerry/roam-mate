import 'package:serverpod/serverpod.dart';

import '../generated/dto/room.dart';

class RoomEndpoint extends Endpoint {
  Future<Room> addRoom(
    Session session,
    Room room,
  ) async {
    return await Room.db.insertRow(session, room);
  }
}
