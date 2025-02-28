import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';

abstract class BaseRepository {
  final Navigation navigator;
  final Notificator notificator;
  final Dio dio;
  BaseRepository({
    required this.dio,
    required this.navigator,
    required this.notificator,
  });
}
