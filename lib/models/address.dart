class AddressModel {
  bool isDefault;
  ReceiverModel receiver;
  String address;
  String landmark;
  LocationModel location;

  AddressModel({
    required this.isDefault,
    required this.receiver,
    required this.address,
    required this.landmark,
    required this.location,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      isDefault: json['isDefault'] ?? false,
      receiver: ReceiverModel.fromJson(json['receiver']),
      address: json['address'] ?? '',
      landmark: json['landmark'] ?? '',
      location: LocationModel.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isDefault'] = isDefault;
    data['receiver'] = receiver.toJson();
    data['address'] = address;
    data['landmark'] = landmark;
    data['location'] = location.toJson();
    return data;
  }
}

class ReceiverModel {
  String name;
  int phone;

  ReceiverModel({
    required this.name,
    required this.phone,
  });

  factory ReceiverModel.fromJson(Map<String, dynamic> json) {
    return ReceiverModel(
      name: json['name'] ?? '',
      phone: json['phone'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}

class LocationModel {
  String type;
  List<double> coordinates;

  LocationModel({
    required this.type,
    required this.coordinates,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      type: json['type'] ?? '',
      coordinates:
          List<double>.from(json['coordinates'].map((x) => x.toDouble())),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}
