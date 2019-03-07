library pokeapi;

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pokeapi/models/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';

class PokemonWidget extends StatelessWidget {
  final int id;
  PokemonWidget({this.id});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pokemon>(
        future: PokeApi.getPokemonById(this.id),
        builder: (BuildContext context, AsyncSnapshot<Pokemon> pokemon){
          if(pokemon.hasData){
            return  ListTile(
              title: Text(pokemon.data.name),
              subtitle: Text(pokemon.data.id.toString()),
            );
          }
          return Center(child: CircularProgressIndicator());
        }
    );
  }
}

class PokeApi {
  static Future<Pokemon>  getPokemonByName(String name) {
    return _getPokemon(name);
  }
  static Future<Pokemon> getPokemonById(int id){
    return _getPokemon(id);
  }

  static Future<Pokemon> _getPokemon(dynamic value) async{
    Response response = await http.get("https://pokeapi.co/api/v2/pokemon/$value/");
    if(response.statusCode ==200){
      return Pokemon.fromJson(json.decode(response.body));
    }else{
      throw Exception("Pokemon no encontrado");
    }
  }
}
