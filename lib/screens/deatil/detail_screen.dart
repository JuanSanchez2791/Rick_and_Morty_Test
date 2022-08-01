import 'package:flutter/material.dart';
import 'package:rick_and_morty_test/services/characters/get_characters.dart';
import 'package:rick_and_morty_test/services/episodes/get_episode.dart';
import 'package:rick_and_morty_test/utils/responsive.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
    this._charId, {
    Key? key,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();

  final int _charId;
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GetCharacters getCharacters = GetCharacters();
    final GetEpisodes getEpisodes = GetEpisodes();
    Responsive responsive = Responsive(context);
    final String charId = widget._charId.toString();

    return FutureBuilder(
      future: getCharacters.getCharacter(charId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return const Center(child: Text('Error Loading Data.'));
        } else {
          var characters = snapshot.data! as List<dynamic>;
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/rick_and_morty_scenery.jpeg"),
                      fit: BoxFit.cover)
              ),
              child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: responsive.hp(2),
                      ),
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                          Uri.parse(characters[index].image).toString(),
                        ),
                      ),
                      SizedBox(
                        height: responsive.hp(1),
                      ),
                      Text(
                        characters[index].status,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: responsive.hp(1),
                      ),
                      Text(
                        characters[index].name,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: responsive.hp(1),
                      ),
                      Text(
                        characters[index].species,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: responsive.hp(1),
                      ),
                      Container(
                        width: double.infinity,
                        height: responsive.hp(76.23),
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                'Information',
                              style: TextStyle(
                                color: Colors.grey
                              ),
                            ),
                            SizedBox(
                              height: responsive.hp(1),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: responsive.wp(40),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Gender: ',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      ),
                                      Text(
                                        characters[index].gender,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: responsive.wp(10),
                                ),
                                Container(
                                  width: responsive.wp(40),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Origin: ',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      ),
                                      Text(
                                        characters[index].origin.name,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: responsive.hp(1),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: responsive.wp(40),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Last known location: ',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      ),
                                      Text(
                                        characters[index].location.name,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: responsive.hp(3),
                            ),
                            const Text(
                              'Episodes',
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            ),
                            SizedBox(
                              height: responsive.hp(1),
                            ),
                            SizedBox(
                              height: responsive.hp(31),
                              child: ListView.builder(
                                itemCount: characters[index].episode.length,
                                itemBuilder: (context, i) {
                                  return FutureBuilder(
                                    future: getEpisodes.getEpisode(characters[index].episode[i]),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(child: CircularProgressIndicator());
                                      }
                                      else if (snapshot.hasError || snapshot.data == null) {
                                        return const Center(child: Text('Error Loading Data.'));
                                      }else {
                                        var episodes = snapshot.data! as List<dynamic>;
                                        return Container(
                                          width: responsive.wp(40),
                                          margin: const EdgeInsets.only(bottom: 5),
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey),
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(15)),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                episodes[index].name,
                                              ),
                                              Text(
                                                episodes[index].episode,
                                              ),
                                              Text(
                                                episodes[index].airDate,
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    }
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
