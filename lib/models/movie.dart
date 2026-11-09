class Movie {
  final String id;
  final String title;
  final String synopsis;
  final String ageRating;
  final String screeningTime;
  final double price;
  final String imagePath;

  const Movie({
    required this.id,
    required this.title,
    required this.synopsis,
    required this.ageRating,
    required this.screeningTime,
    required this.price,
    required this.imagePath,
  });

  String get formattedPrice => '£${price.toStringAsFixed(2)}';
}
