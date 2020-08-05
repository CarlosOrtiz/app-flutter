import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.email,
    this.password,
    this.code,
    this.state,
    this.person,
  });

  String id;
  String email;
  String password;
  String code;
  String state;
  Person person;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        code: json["code"] == null ? null : json["code"],
        state: json["state"],
        person: Person.fromJson(json["person"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "code": code == null ? null : code,
        "state": state,
        "person": person.toJson(),
      };
}

class Person {
  Person({
    this.id,
    this.name,
    this.lastname,
    this.dateBirth,
    this.gender,
    this.typeDocument,
    this.document,
    this.direction,
    this.neighborhood,
    this.phone,
    this.occupation,
    this.photo,
    this.share,
    this.tabletNumber,
  });

  String id;
  String name;
  String lastname;
  DateTime dateBirth;
  String gender;
  String typeDocument;
  String document;
  String direction;
  String neighborhood;
  String phone;
  String occupation;
  String photo;
  dynamic share;
  String tabletNumber;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        dateBirth: DateTime.parse(json["dateBirth"]),
        gender: json["gender"],
        typeDocument: json["typeDocument"],
        document: json["document"],
        direction: json["direction"],
        neighborhood: json["neighborhood"],
        phone: json["phone"],
        occupation: json["occupation"],
        photo: json["photo"],
        share: json["share"],
        tabletNumber: json["tabletNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "dateBirth":
            "${dateBirth.year.toString().padLeft(4, '0')}-${dateBirth.month.toString().padLeft(2, '0')}-${dateBirth.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "typeDocument": typeDocument,
        "document": document,
        "direction": direction,
        "neighborhood": neighborhood,
        "phone": phone,
        "occupation": occupation,
        "photo": photo,
        "share": share,
        "tabletNumber": tabletNumber,
      };
}
