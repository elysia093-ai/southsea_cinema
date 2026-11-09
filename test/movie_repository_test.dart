import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns two movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 2);
    });

    test('getMovies contains valid movie data', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie firstMovie = movies[0];
      expect(firstMovie.id, 'the-last-ember');
      expect(firstMovie.title, 'Iron Man 1');
      expect(firstMovie.price, 12.50);
      expect(firstMovie.imagePath, isNotEmpty);

      final Movie secondMovie = movies[1];
      expect(secondMovie.id, 'neon-harbor');
      expect(secondMovie.title, 'Iron Man 2');
      expect(secondMovie.price, 11.00);
      expect(secondMovie.imagePath, isNotEmpty);
    });

    test('getMovieById returns matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('the-last-ember');

      expect(movie, isNotNull);
      expect(movie?.title, 'Iron Man 1');
      expect(movie?.price, 12.50);
    });

    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });
  });
}
