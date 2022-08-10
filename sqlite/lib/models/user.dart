class User {
  final int? id;
  final String name;
  final int? age;
  final String? country;
  final String? email;

  User({this.id, required this.name, this.age, this.country, this.email});

  //use mapping so that we can use it  in JSON or Databse later

  User.fromMap(Map<String, dynamic> response)
      : id = response['id'],
        name = response['name'],
        age = response['age'],
        country = response['country'],
        email = response['email'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'country': country,
      'email': email
    };
  }
}
