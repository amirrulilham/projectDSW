class ProfileInfoModel {
  final int? id;
  final String icNum;
  final String type;
  final String name;
  final String address;
  final String username;
  final String password;
  final String phoneNum;
  final String emailAddress;

  ProfileInfoModel({
    this.id,
    required this.icNum,
    required this.type,
    required this.name,
    required this.address,
    required this.username,
    required this.password,
    required this.phoneNum,
    required this.emailAddress,
  });

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) {
    return ProfileInfoModel(
      id: json["id"],
      icNum: json["icNum"],
      type: json["type"],
      name: json["name"],
      address: json["address"],
      username: json["username"],
      password: json["password"],
      phoneNum: json["phoneNum"],
      emailAddress: json["emailAddress"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "icNum": icNum,
        "type": type,
        "name": name,
        "address": address,
        "username": username,
        "password": password,
        "phoneNum": phoneNum,
        "emailAddress": emailAddress,
      };
}
