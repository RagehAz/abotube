import 'package:abotube/a_models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:ldb/ldb.dart';

class VideoLDBOps {
  // --------------------------------------------------------------------------

  const VideoLDBOps();

  // --------------------------------------------------------------------------

  /// INSERT

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<void> insert({
    @required VideoModel videoModel,
  }) async {

          if (videoModel != null){

            await LDBOps.insertMap(
              docName: 'VideoLDBOps',
              primaryKey: 'id',
              input: videoModel.toMap(),
          );

          }

        }
  // --------------------------------------------------------------------------

  /// READ

  // --------------------
  /// TASK : TEST ME
  static Future<VideoModel> read({
    @required String id,
  }) async {

    final Map<String, dynamic> _map = await LDBOps.readMap(
        docName: 'VideoLDBOps',
        id: id,
        primaryKey: 'id',
    );

    return VideoModel.decipher(_map);
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<List<VideoModel>> readAll() async {

    final List<Map<String, dynamic>> _maps = await LDBOps.readAllMaps(
        docName: 'VideoLDBOps',
    );

    return VideoModel.decipherMaps(_maps);
  }
  // --------------------------------------------------------------------------

  /// DELETE

  // --------------------
  /// TASK : TEST ME
  static Future<void> delete({
    @required String id,
  }) async {

    await LDBOps.deleteMap(
        objectID: id,
        docName: 'VideoLDBOps',
        primaryKey: 'id',
    );

  }
  // --------------------------------------------------------------------------
}
