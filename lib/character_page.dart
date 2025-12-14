import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:marvel/constants.dart';

class CharacterPage extends StatelessWidget {

  final index;

  CharacterPage(this.index);

  @override
  Widget build(BuildContext context) {
    final theme = AudioPlayer();

    return Scaffold(
      backgroundColor: Color(0xff0D0C11),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: Hero(
                    tag: characterList[index]['imgUrl']!,
                    child: InteractiveViewer(
                      child: Image.asset(
                        characterList[index]['imgUrl']!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, 
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.white,
                    )
                  )
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: Image.asset('assets/images/nametag.png'),
                ),
                Positioned(
                  bottom: 25,
                  left: 20,
                  child: Text(
                    characterList[index]['real_name']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    characterList[index]['hero_name']!.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    characterList[index]['description']!,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            theme.play(AssetSource(characterList[index]['theme']!));
                          }, 
                          child: Icon(Icons.play_arrow_outlined)
                        ),
                        ElevatedButton(
                          onPressed: () {
                            theme.pause();
                          }, 
                          child: Icon(Icons.pause)
                        ),
                        ElevatedButton(
                          onPressed: () {
                            theme.stop();
                          }, 
                          child: Icon(Icons.stop_circle)
                        ),
                      ],
                    ),
                  ),
                  NewsCard(0),
                  NewsCard(1),
                  NewsCard(2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class NewsCard extends StatelessWidget {
  final index;

  NewsCard(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2 - 25,
              child: Image.asset(latestNews[index]['imgUrl']!),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2 - 25,
              child: Column(
                children: [
                  Text(
                    latestNews[index]['tag']!, 
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    latestNews[index]['title']!, 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}