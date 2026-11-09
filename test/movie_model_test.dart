import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      const movie = Movie(
        id: 'the-last-ember',
        title: 'Iron Man 1',
        synopsis:
            'A forgotten historian returns to a storm-lashed seaside town.',
        ageRating: '12A',
        screeningTime: '124 min',
        price: 12.50,
        imagePath: 'assets/images/the_last_ember.png',
      );

      expect(movie.id, 'the-last-ember');
      expect(movie.title, 'Iron Man 1');
      expect(movie.synopsis,
          'A forgotten historian returns to a storm-lashed seaside town.');
      expect(movie.ageRating, '12A');
      expect(movie.screeningTime, '124 min');
      expect(movie.price, 12.50);
      expect(movie.imagePath, 'assets/images/the_last_ember.png');
    });

    test('formattedPrice adds currency symbol with two decimal places', () {
      const movie = Movie(
        id: 'neon-harbor',
        title: 'Neon Harbor',
        synopsis:
            'A city lantern maker finds a mysterious signal beneath the harbour.',
        ageRating: '15',
        screeningTime: '118 min',
        price: 11.00,
        imagePath: 'assets/images/neon_harbor.png',
      );

      expect(movie.formattedPrice, '£11.00');
    });
  });
}
