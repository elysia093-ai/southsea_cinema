import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

void main() {
  group('App smoke tests', () {
    testWidgets('App displays the home screen and movie cards',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.text('Southsea Cinema & Arts Centre'), findsOneWidget);
      expect(find.text('Iron Man 1'), findsOneWidget);
      expect(find.text('Iron Man 2'), findsOneWidget);
      expect(find.text('Book now'), findsNWidgets(2));
    });

    testWidgets('Tapping Book now opens the movie listing page',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      await tester.tap(find.text('Book now').first);
      await tester.pumpAndSettle();

      expect(find.byType(MovieListing), findsOneWidget);
      expect(find.text('Order Iron Man 1'), findsOneWidget);
      expect(find.text('Add to order'), findsOneWidget);
    });

    testWidgets('Adding tickets updates the order confirmation message',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      await tester.tap(find.text('Book now').first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add to order'));
      await tester.pump();

      expect(
          find.textContaining(
              'Added 2 tickets to your order for Iron Man 1'),
          findsOneWidget);
    });
  });
}
