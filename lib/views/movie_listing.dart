import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({
    super.key,
    required this.movie,
  });

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketCount = 2;
  String _orderMessage = '';

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.movie.title,
          style: const TextStyle(
            color: cinemaFontWhite,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${widget.movie.screeningTime} • ${widget.movie.ageRating}',
          style: const TextStyle(
            color: cinemaFontMuted,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          widget.movie.synopsis,
          style: const TextStyle(
            color: cinemaFontWhite,
            fontSize: 18,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            const Text(
              'Tickets: ',
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            DropdownMenu<int>(
              initialSelection: _ticketCount,
              width: 170,
              textStyle: const TextStyle(color: Colors.black),
              menuStyle: const MenuStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.black),
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                ),
              ),
              onSelected: (value) {
                if (value != null) {
                  setState(() => _ticketCount = value);
                }
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: '1 ticket'),
                DropdownMenuEntry(value: 2, label: '2 tickets'),
                DropdownMenuEntry(value: 3, label: '3 tickets'),
                DropdownMenuEntry(value: 4, label: '4 tickets'),
                DropdownMenuEntry(value: 5, label: '5 tickets'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 28),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: cinemaBrand,
            foregroundColor: cinemaFontWhite,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          ),
          onPressed: () {
            setState(() {
              _orderMessage =
                  'Added $_ticketCount ticket${_ticketCount == 1 ? '' : 's'} to your order for ${widget.movie.title}.';
            });
          },
          child: const Text(
            'Add to order',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        if (_orderMessage.isNotEmpty) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black12),
            ),
            child: Text(
              _orderMessage,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    );

    final poster = ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        widget.movie.imagePath,
        width: isWide ? 220 : double.infinity,
        height: isWide ? 320 : 220,
        fit: BoxFit.cover,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Order ${widget.movie.title}', style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final wideLayout = constraints.maxWidth > 600;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 900),
                child: wideLayout
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: details),
                          const SizedBox(width: 28),
                          poster,
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          poster,
                          const SizedBox(height: 24),
                          details,
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
