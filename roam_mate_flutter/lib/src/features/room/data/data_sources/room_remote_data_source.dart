import 'package:roam_mate_client/roam_mate_client.dart';
import 'package:roam_mate_flutter/src/api/api_client.dart';

class RoomRemoteDataSource {
  final ApiClient client;
  RoomRemoteDataSource({required this.client});

  Future<Room> addRoomAds({required Room room}) async {
    return await client.client.room.addRoom(room);
  }
}
