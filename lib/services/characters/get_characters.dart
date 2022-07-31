import 'package:rick_and_morty_test/models/characters.dart';
import 'package:rick_and_morty_test/services/entities/get_entities.dart';
import 'package:rick_and_morty_test/utils/constants.dart';

class GetCharacters extends GetEntitiesService {

  Future getAllCharacters() async {
    List<Map<String, dynamic>> objects = await super
        .getAllEntities('${Constants.baseURL}${Constants.character}');

    return List<Characters>.from(objects.map((x) => Characters.fromJson(x)));
  }

  Future getCharacter(String id) async {
    List<Map<String, dynamic>> objects = await super
        .getEntity('${Constants.baseURL}${Constants.character}/$id');

    return List<Characters>.from(objects.map((x) => Characters.fromJson(x)));
  }

}
