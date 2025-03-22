// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
class UserModel {
  final int? id;
  final String? nome;
  final String? telefone;
  final String? email;
  final String? foto;

  UserModel(this.id, this.nome, this.telefone, this.email, this.foto);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'foto': foto,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['id'] != null ? map['id'] as int : null,
      map['nome'] != null ? map['nome'] as String : null,
      map['telefone'] != null ? map['telefone'] as String : null,
      map['email'] != null ? map['email'] as String : null,
      map['foto'] != null ? map['foto'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
