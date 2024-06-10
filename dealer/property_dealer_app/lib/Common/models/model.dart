class UserModel {
  final String? name;
  final String? email;
  final String? uid;
  final String? phoneNumber;
  final int? age;
  final String? gender;
  UserModel(
      {this.name,
      this.email,
      this.uid,
      this.gender,
      this.phoneNumber,
      this.age});

  Future<Map<String, dynamic>> getUserData() async {
    // Simulate fetching user data asynchronously
    await Future.delayed(Duration(seconds: 3)); // Example delay

    // Return user data as a Map
    return {
      'name': name,
      'email': email,
      'uid': uid,
    };
  }
}

UserModel userData = UserModel();
