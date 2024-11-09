class UserDataResponseModel {
  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  int? iV;

  UserDataResponseModel(
      {this.address,
      this.id,
      this.email,
      this.username,
      this.password,
      this.name,
      this.phone,
      this.iV});

  UserDataResponseModel.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ?  Address.fromJson(json['address']) : null;
    id = json['id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    phone = json['phone'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = address!.toJson();
    }
    data['id'] = id;
    data['email'] =email;
    data['username'] = username;
    data['password'] = password;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['phone'] = phone;
    data['__v'] = iV;
    return data;
  }
}

class Address {
  Geolocation? geolocation;
  String? city;
  String? street;
  int? number;
  String? zipcode;

  Address(
      {this.geolocation, this.city, this.street, this.number, this.zipcode});

  Address.fromJson(Map<String, dynamic> json) {
    geolocation = json['geolocation'] != null
        ? new Geolocation.fromJson(json['geolocation'])
        : null;
    city = json['city'];
    street = json['street'];
    number = json['number'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geolocation != null) {
      data['geolocation'] = this.geolocation!.toJson();
    }
    data['city'] = this.city;
    data['street'] = this.street;
    data['number'] = this.number;
    data['zipcode'] = this.zipcode;
    return data;
  }
}

class Geolocation {
  String? lat;
  String? long;

  Geolocation({this.lat, this.long});

  Geolocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}

class Name {
  String? firstname;
  String? lastname;

  Name({this.firstname, this.lastname});

  Name.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    return data;
  }
}
