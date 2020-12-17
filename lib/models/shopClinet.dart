import 'package:geolocator/geolocator.dart';

class ShopClient {
  final String id;
  final String shopName;
  final Position position;
  final String email;
  // Position get position =>

  ShopClient({this.id, this.shopName, this.position, this.email});

  ShopClient.fromData(Map<String, dynamic> data)
      : id = data['id'],
        shopName = data['shopName'],
        email = data['email'],
        position =
            Position(latitude: data["latitude"], longitude: data["longitude"]);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'latitude': position.latitude,
      "longitude": position.longitude,
      'shopName': shopName,
      'email': email,
    };
  }
}
