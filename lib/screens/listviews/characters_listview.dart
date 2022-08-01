import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/screens/deatil/detail_screen.dart';
import 'package:rick_and_morty_test/services/characters/get_characters.dart';
import 'package:rick_and_morty_test/services/episodes/get_episode.dart';

class CharacterListView extends StatefulWidget {
  const CharacterListView({
    Key? key,
  }) : super(key: key);

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  final GetEpisodes getEpisodes = GetEpisodes();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GetCharacters getCharacters = GetCharacters();

    return FutureBuilder(
      future: getCharacters.getAllCharacters(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return const Center(child: Text('Error Loading Data.'));
        } else {
          var characters = snapshot.data! as List<dynamic>;
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      var charId = characters[index].id;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(charId),
                          ),
                      );
                    },
                    child: Container(
                      //padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(
                        right: 10,
                        left: 10,
                        bottom: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 130,
                            child: Image.network(
                                Uri.parse(characters[index].image).toString()),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                characters[index].status +
                                    ' - ' +
                                    characters[index].species,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                characters[index].name,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Last know location: ',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                characters[index].location.name,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'First seen in: ',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                              FutureBuilder(
                                future: getEpisodes.getEpisode(characters[index].episode[0]),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return const Center(child: CircularProgressIndicator());
                                  }else {
                                    var episodes = snapshot.data! as List<
                                        dynamic>;
                                    return Text(
                                      episodes[0].name,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    );
                                  }
                                }
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
              );
            },
          );
        }
      },
    );
  }
}
