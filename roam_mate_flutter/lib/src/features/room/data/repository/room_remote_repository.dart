import 'dart:io';

import 'package:roam_mate_client/roam_mate_client.dart';
import 'package:roam_mate_client/src/protocol/dto/room.dart';
import 'package:roam_mate_client/src/protocol/enums/room_type_enum.dart';
import 'package:roam_mate_flutter/src/features/room/data/data_sources/room_remote_data_source.dart';
import 'package:roam_mate_flutter/src/features/room/data/repository/i_room_repository.dart';
import 'package:roam_mate_flutter/src/services/file_uploader.dart';
import 'package:roam_mate_flutter/src/services/image_service.dart';

class RoomRemoteRepository implements IRoomRepository {
  final ImageService imageService;
  final RoomRemoteDataSource roomRemoteDataSource;
  final FileUploadService fileUploadService;

  const RoomRemoteRepository({
    required this.imageService,
    required this.fileUploadService,
    required this.roomRemoteDataSource,
  });

  @override
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
  }) async {
    try {
      final photos = await imageService.getManyImages();
      final List<String> uploadedImages = [];
      if (photos.length < 4) {
        throw "Please pick atleast 4 images";
      }
      for (var image in photos) {
        final uploadDescription =
            await fileUploadService.getFileDescription(filePath: image.path);
        if (uploadDescription != null) {
          await fileUploadService.uploadFile(
            uploadDescription: uploadDescription,
            file: image,
          );
          uploadedImages.add(uploadDescription);
        }
      }
      final room = Room(
        address: address,
        description: description,
        lat: lat,
        long: long,
        numberOfRoomMate: numberOfRoomMate,
        photos: uploadedImages,
        preferredGender: preferredGender,
        rent: rent,
        roomRules: roomRules,
        roomType: roomType,
        title: title,
        amenities: amenities,
      );
      return await roomRemoteDataSource.addRoomAds(room: room);
    } catch (e) {
      rethrow;
    }
  }
}
