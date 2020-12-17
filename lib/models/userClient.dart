class UserClient {
  final String id;
  final String fullName;
  final String email;

  UserClient({this.id, this.fullName, this.email});

  UserClient.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'];
  // userRole = data['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      // 'userRole': userRole,
    };
  }
}
