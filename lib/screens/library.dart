import 'package:flutter/material.dart';
import 'package:music_app/helper/constants.dart';
import 'package:music_app/screens/nowplaying.dart';

class Library extends StatelessWidget {
  //sekarang kita ngebuat templet buat cardnya
  Widget genreCard(String img, String title, String foll) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(gcard))),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(img),
            radius: 50,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "$foll Folower",
            style: TextStyle(
                fontWeight: FontWeight.w300, color: cblue, fontSize: 13),
          ),
        ],
      ),
    );
  }

  //Sekarang kita buat untuk daftar lagu nya oke ges kwkwkww
  Widget songCard(
      int sr, String img, String title, String artist, String time) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("$sr"),
            SizedBox(
              width: 20,
            ),
            CircleAvatar(
              backgroundImage: AssetImage(img),
              radius: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  artist,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                )
              ],
            ),
            Spacer(),
            Text(time)
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cwhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              "Popular",
              style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: cblue),
            ),
          ),
          //sekarang kita buat list untuk lagu yang berbeda ya
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                //sekarang kita panggil dari fungsi yang tadi kita buat
                genreCard(pop, "POP", "12,312"),
                genreCard(hiphop, "HIP HOP", "19,312"),
                genreCard(country, "POP", "20,312"),
                genreCard(heavymetal, "HEAVY METAL", "2,312"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, top: 20),
            child: Text(
              "TRENDING ALBUM",
              style: TextStyle(
                  letterSpacing: 3, fontSize: 20, fontWeight: FontWeight.w300),
            ),
          ),
          // Disini Kita Ngebuat LIst Album yang sedang trending
          Container(
            width: MediaQuery.of(context).size.width,
            height: 330,
            padding: EdgeInsets.fromLTRB(45, 30, 45, 25),
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(scard))),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // sekarang masukan fungsi untuk list album popular ke sini
                  songCard(1, art1, "Blinding Light", "The Wekeend", "3:11"),
                  songCard(2, art2, "The Box", "Rody Rich", "2:15"),
                  songCard(3, art3, "Dont Start Now", "Dua lipa", "5:21"),
                  songCard(4, art4, "Circles", "Post Malone", "6:1"),
                  songCard(5, art5, "Intensions", "Justin Beiber", "5:9"),
                ],
              ),
            )
          ),
          SizedBox(height: 70,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
            Image.asset(home, scale: 1.1 ,),
            Image.asset(podcast, scale: 1.1 ,),
            Image.asset(search, scale: 1.1 ,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => NowPlaying())
                );
              },
                  child: Image.asset(list, scale: 1.1 ,))
          ],
          )
        ],
      ),
    );
  }
}
