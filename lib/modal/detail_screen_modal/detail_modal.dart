class Planet {
  final String position;
  final String name;
  final List<String> images;  // Changed from `image` to `images`
  final String velocity;
  final String distance;
  final String description;
  final String numberImage;  // Added for the `numberImage` field
  final String planetImage;  // Added for the `planetImage` field
  final String color;  // Added for the `color` field

  Planet({
    required this.position,
    required this.name,
    required this.images,
    required this.velocity,
    required this.distance,
    required this.description,
    required this.numberImage,
    required this.planetImage,
    required this.color,
  });

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      position: json['position'],
      name: json['planet'],  // The JSON field is `planet`, not `name`
      images: List<String>.from(json['images']),  // Changed from `image` to `images`
      velocity: json['velocity'],
      distance: json['distance'],
      description: json['description'],
      numberImage: json['numberImage'],  // Added to parse `numberImage`
      planetImage: json['planetImage'],  // Added to parse `planetImage`
      color: json['color'],  // Added to parse `color`
    );
  }
}
