class Model {
  final String email;
  final String password;
   final String userName;
    final String profileImage;
     final String phoneNumber;
      final String firstName;
       final String lastName;
       final String role;
        Model({
          required this.email,required this.password,required this.firstName,
          required this.lastName,required this.phoneNumber,required this.profileImage,
          required this.userName,required this.role,
        });

  factory Model.fromJson(jsonData){
    return Model(
      email: jsonData['email'],
     password: jsonData['password'], 
     firstName: jsonData['firstName'], 
     lastName:jsonData['lastName'], 
     phoneNumber: jsonData['phoneNumber'], 
     profileImage: jsonData['profileImage'], 
     userName:jsonData['userName'], 
     role: jsonData['role']
     );
  }
}