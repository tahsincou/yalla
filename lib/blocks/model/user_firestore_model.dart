import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  late  String id;
  late  String firstName;
  late  String lastName;
  late  String email;
  late  DateTime birthDate;
  late  int age;
  late  List<String> imageUrls;
  late  List<String> interests;
  late  String height;
  late  String nationality;
  late  String location;
  late  String religion;
  late  String bio;
  late  String password;
  late  String profession;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.imageUrls,
    required this.interests,
    required this.height,
    required this.nationality,
    required this.location,
    required this.religion,
    required this.bio,
    required this.profession,
    required this.email,
    required this.password,
    required this.birthDate
  });

  Map <String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'age': age,
    'imageUrls': imageUrls,
    'interests': interests,
    'height': height,
    'nationality': nationality,
    'location': location,
    'religion': religion,
    'bio': bio,
    'profession': profession,
    'email': email,
    'password': password,
    'birthDate': birthDate,
  };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
      imageUrls: List.from(json["imageUrls"]),
      interests: List.from(json["interests"]),
      height: json['height'],
      nationality: json['nationality'],
      location: json['location'],
      religion: json['religion'],
      bio: json['bio'],
      profession: json['profession'],
      email: json['email'],
      password: json['password'],
      birthDate: json['birthDate'].toDate());

  // factory UserModel.fromFireStore(
  //     DocumentSnapshot<Map<String,dynamic>> snapshot,
  //     SnapshotOptions? options
  //     ){
  //   final data = snapshot.data();
  //   return UserModel(id: data?['id'],
  //       firstName: data?['id'],
  //       lastName: data?['id'],
  //       age: data?['id'],
  //       imageUrls:  data?["imageUrls"] is Iterable ? List.from(data?["imageUrls"]) : null,
  //       interests: data?["interests"] is Iterable ? List.from(data?["interests"]) : null,
  //       height: data?['id'],
  //       nationality: data?['id'],
  //       location: data?['id'],
  //       religion: religion,
  //       bio: bio, profession: profession, email: email, password: password, birthDate: birthDate)
  // }
  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        age,
        imageUrls,
        interests,
        height,
        nationality,
        location,
        religion,
        bio,
        password,
        profession
      ];

  static List<UserModel> users=[
    UserModel(id: '1', firstName: 'Anna', lastName: 'Hatheway',
        age: 20,
        imageUrls: const [
          'assets/images/fifth_female.png',
          'assets/images/first_female.png',
          'assets/images/third_female.png',
        ],
        interests: const ['Music', 'Movie', 'Social Media'],
        height: '170 cm',
        nationality: 'Russian',
        location: 'Moscow',
        religion: 'Christian- Orthodox',
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        profession: 'Teacher',
    email: 'anna@gmail.com',
    password: '1234',
    birthDate: DateTime.parse('2020-07-17T03:18:31.177769-04:00')),
    UserModel(id: '2', firstName: 'John', lastName: 'Afran',
        age: 25,
        imageUrls: const [
          'assets/images/fifth_male.png',
          'assets/images/fourth_male.png',
          'assets/images/first_male.png',
        ],
        interests: const ['Dance', 'Movie', 'Social Media'],
        height: '178 cm',
        nationality: 'USA',
        location: 'NY',
        religion: 'Christian- Orthodox',
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        profession: 'Model',
        email: 'anna@gmail.com',
        password: '1234',
        birthDate: DateTime.parse('2020-07-17T03:18:31.177769-04:00')),
    UserModel(id: '3', firstName: 'Christina', lastName: 'Brown',
        age: 21,
        imageUrls: const [
          'assets/images/second_female.png',
          'assets/images/third_female.png',
          'assets/images/first_female.png',
        ],
        interests:const  ['Music', 'Theater', 'Social Media'],
        height: '165 cm',
        nationality: 'USA',
        location: 'NY',
        religion: 'Christian- Orthodox',
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        profession: 'Doctor',
        email: 'anna@gmail.com',
        password: '1234',
        birthDate: DateTime.parse('2020-07-17T03:18:31.177769-04:00')),
  ];
}
