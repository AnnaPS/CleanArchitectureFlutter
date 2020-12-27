// To parse this JSON data, do
//
//     final character = characterFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Character characterFromJson(String str) => Character.fromJson(json.decode(str));

String characterToJson(Character data) => json.encode(data.toJson());

class Character {
  Character({
    @required this.id,
    @required this.name,
    @required this.status,
    @required this.species,
    @required this.type,
    @required this.gender,
    @required this.origin,
    @required this.location,
    @required this.image,
    @required this.episode,
    @required this.url,
    @required this.created,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        origin: Location.fromJson(json['origin']),
        location: Location.fromJson(json['location']),
        image: json['image'],
        episode: List<String>.from(json['episode'].map((x) => x)),
        url: json['url'],
        created: DateTime.parse(json['created']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status,
        'species': species,
        'type': type,
        'gender': gender,
        'origin': origin.toJson(),
        'location': location.toJson(),
        'image': image,
        'episode': List<dynamic>.from(episode.map((x) => x)),
        'url': url,
        'created': created.toIso8601String(),
      };
}

class Location {
  Location({
    @required this.name,
    @required this.url,
  });

  final String name;
  final String url;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json['name'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}
