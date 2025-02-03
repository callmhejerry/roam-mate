import 'dart:io';

import 'package:roam_mate_client/roam_mate_client.dart';

abstract class IRoomRepository {
  Future<Room> createRoomAds({
    required String title,
    required String description,
    required double rent,
    required double lat,
    required double long,
    required int numberOfRoomMate,
    required RoomType roomType,
    required String address,
    required List<File> photos,
    required Gender preferredGender,
    required List<String> roomRules,
    required List<RoomAmenitites> amenities,
  });
}
