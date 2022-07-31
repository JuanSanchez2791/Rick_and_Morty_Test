import 'package:dio/dio.dart';
import 'package:rick_and_morty_test/models/paginator.dart';

abstract class GetEntitiesService {
  static final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> getAllEntities(String url) async {
    try {
      List<Map<String, dynamic>> allEntities = [];
      String? nextUrl = url;
      while (nextUrl != null) {
        var response = await _dio.get(nextUrl);
        try {
          Paginator info = Paginator.fromJson(response.data["info"]);
          nextUrl = info.next;
          allEntities.addAll(
              List<Map<String, dynamic>>.from(response.data["results"]));
        } catch (e) {
          allEntities.addAll(List<Map<String, dynamic>>.from(response.data));
          nextUrl = null;
        }
      }

      return allEntities;
    } on DioError {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getEntity(String url) async {
    try {
      List<Map<String, dynamic>> entity = [];
        var response = await _dio.get(url);
      entity.add(Map<String, dynamic>.from(response.data));

      return entity;
    } on DioError {
      rethrow;
    }
  }
}