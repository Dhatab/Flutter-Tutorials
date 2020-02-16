import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokemon_index/pokemon_model.dart';
import 'package:pokemon_index/pokemon_details.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pokemon Index",
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokeHub pokeHub;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(decodedJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pokemon Index",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      body: pokeHub == null
          ? Center(
        child: CircularProgressIndicator(),
      )
      : GridView.count(
        crossAxisCount: 2,
        children: pokeHub.pokemon
            .map((poke) => Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 2.0, right: 2.0, left: 2.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PokeDetail(
                        pokemon: poke,
                      )));
                    },
                    child: Card(
                      elevation: 5.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(poke.img))),
                          ),
                          Text(
                            poke.name,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
