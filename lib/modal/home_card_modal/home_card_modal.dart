class Planetcardmodal {
  final String planet;
  final String planetImage;
  final String numberImage;
  final String description;
  final String color;
  final String position;

  Planetcardmodal({
    required this.planet,
    required this.planetImage,
    required this.numberImage,
    required this.description,
    required this.color,
    required this.position
  });

  factory Planetcardmodal.fromJson(Map<String, dynamic> json) {
    return Planetcardmodal(
      position: json['position'],
      planet: json['planet'],
      planetImage: json['planetImage'],
      numberImage: json['numberImage'],
      description: json['description'],
      color: json['color'],
    );
  }

  }

