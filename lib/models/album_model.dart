// To parse this JSON data, do
//
//     final albumModel = albumModelFromJson(jsonString);

import 'dart:convert';

AlbumModel albumModelFromJson(String str) => AlbumModel.fromJson(json.decode(str));

String albumModelToJson(AlbumModel data) => json.encode(data.toJson());

class AlbumModel {
  AlbumModel({
    this.data,
    this.state,
    this.message,
  });

  Data? data;
  int? state;
  String? message;

  AlbumModel copyWith({
    Data? data,
    int? state,
    String? message,
  }) =>
      AlbumModel(
        data: data ?? this.data,
        state: state ?? this.state,
        message: message ?? this.message,
      );

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
        data: Data.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "state": state,
        "message": message,
      };
}

class Data {
  Data({
    this.countries,
  });

  List<Country>? countries;

  Data copyWith({
    List<Country>? countries,
  }) =>
      Data(
        countries: countries ?? this.countries,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "countries": List<dynamic>.from(countries!.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    this.idCountry,
    this.nameCountry,
    this.logoCountry,
    this.players,
    this.status,
  });

  int? idCountry;
  String? nameCountry;
  String? logoCountry;
  List<Player>? players;
  bool? status;

  Country copyWith({
    int? idCountry,
    String? nameCountry,
    String? logoCountry,
    List<Player>? players,
    bool? status,
  }) =>
      Country(
        idCountry: idCountry ?? this.idCountry,
        nameCountry: nameCountry ?? this.nameCountry,
        logoCountry: logoCountry ?? this.logoCountry,
        players: players ?? this.players,
        status: status ?? this.status,
      );

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        idCountry: json["idCountry"],
        nameCountry: json["nameCountry"],
        logoCountry: json["logoCountry"],
        players: List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "idCountry": idCountry,
        "nameCountry": nameCountry,
        "logoCountry": logoCountry,
        "players": List<dynamic>.from(players!.map((x) => x.toJson())),
        "status": status,
      };
}

class Player {
  Player({
    this.idFigurine,
    this.idPlayer,
    this.namePlayer,
    this.duplicates,
    this.status,
  });

  int? idFigurine;
  int? idPlayer;
  String? namePlayer;
  int? duplicates;
  bool? status;

  Player copyWith({
    int? idFigurine,
    int? idPlayer,
    String? namePlayer,
    int? duplicates,
    bool? status,
  }) =>
      Player(
        idFigurine: idFigurine ?? this.idFigurine,
        idPlayer: idPlayer ?? this.idPlayer,
        namePlayer: namePlayer ?? this.namePlayer,
        duplicates: duplicates ?? this.duplicates,
        status: status ?? this.status,
      );

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        idFigurine: json["idFigurine"],
        idPlayer: json["idPlayer"],
        namePlayer: json["namePlayer"],
        duplicates: json["duplicates"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "idFigurine": idFigurine,
        "idPlayer": idPlayer,
        "namePlayer": namePlayer,
        "duplicates": duplicates,
        "status": status,
      };
}
