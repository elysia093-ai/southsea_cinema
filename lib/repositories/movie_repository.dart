import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'the-last-ember',
        title: 'Iron Man 1',
        synopsis:
            'Tony Stark builds a powerful suit of armor and becomes a superhero.',
        ageRating: '12A',
        screeningTime: '124 min',
        price: 12.50,
        imagePath: 'assets/images/iron_man_1.png',
      ),
      Movie(
        id: 'neon-harbor',
        title: 'Iron Man 2',
        synopsis:
            'Tony Stark faces new enemies while protecting his technology and identity.',
        ageRating: '15',
        screeningTime: '118 min',
        price: 11.00,
        imagePath: 'assets/images/iron_man_2.png',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }
}
