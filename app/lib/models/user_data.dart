import 'package:app/constants/values.dart';

/// [UserData] is a model class that contains the user data.
class UserData {
  /// [UserData] constructor.
  UserData({required this.id, required this.email, this.avatarUrl, this.firstname, this.lastname, this.age, this.country, this.city});

  /// Creates [UserData] instance from JSON.
  factory UserData.fromJson(Map<String, dynamic> json, String uid) {
    return UserData(
      id: uid,
      email: json['email'],
      avatarUrl: json['avatarUrl'] ?? Constants.profilePlaceholderUrl,
      firstname: json['firstname'],
      lastname: json['lastname'],
      age: json['age'],
      country: json['country'],
      city: json['city'],
    );
  }

  /// [id] is the user id.
  final String id;

  /// [email] is the user email.
  final String email;

  /// [avatarUrl] is the user avatar url.
  String? avatarUrl;

  /// [firstname] is the user name.
  String? firstname;

  /// [lastname] is the user last name.
  String? lastname;

  ///[age] is the user age.
  DateTime? age;

  /// [country] is the user country.
  String? country;

  /// [city] is the user city.
  String? city;

  /// Converts [UserData] instance to JSON.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'email': email,
        'avatarUrl': avatarUrl,
        'firstname': firstname,
        'lastname': lastname,
        'age': age,
        'country': country,
        'city': city,
      };
}
