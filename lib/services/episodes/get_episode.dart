import 'package:rick_and_morty_test/models/episodes.dart';
import 'package:rick_and_morty_test/services/entities/get_entities.dart';
import 'package:rick_and_morty_test/utils/constants.dart';

class GetEpisodes extends GetEntitiesService {
  Future getAllEpisodes() async {
    List<Map<String, dynamic>> objects = await super
        .getAllEntities('${Constants.baseURL}${Constants.episode}');

    return List<Episodes>.from(objects.map((x) => Episodes.fromJson(x)));
  }

  Future getEpisode(String url) async {
    List<Map<String, dynamic>> objects = await super
        .getEntity(url);

    return List<Episodes>.from(objects.map((x) => Episodes.fromJson(x)));
  }

}