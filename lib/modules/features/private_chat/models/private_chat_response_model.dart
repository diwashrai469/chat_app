class PrivateChatResponseModel {
  List<Users>? users;

  PrivateChatResponseModel({this.users});

  PrivateChatResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String? email;
  String? id;
  String? name;
  String? profilePicture;

  Users({this.email, this.id, this.name, this.profilePicture});

  Users.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    name = json['name'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['id'] = id;
    data['name'] = name;
    data['profile_picture'] = profilePicture;
    return data;
  }
}
