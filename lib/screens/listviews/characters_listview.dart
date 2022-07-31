import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/screens/deatil/detail_screen.dart';
import 'package:rick_and_morty_test/services/characters/get_characters.dart';

class CharacterListView extends StatelessWidget {
  const CharacterListView({
    Key? key,
  }) : super(key: key);

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
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(
                        right: 10,
                        left: 10,
                        top: 5,
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
                                'Origin: ',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                characters[index].origin.name,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
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
