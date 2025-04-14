import 'package:flutter/material.dart';
import 'package:movieku/model/movie_model.dart';
import 'package:movieku/utils/themes.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Themes.primaryColor, // Background gelap
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Poster Film + Rating
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w200/${movie.posterPath}', // Gambar Spider-Man
                  width: 120,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Themes.whiteColor, size: 14),
                      SizedBox(width: 4),
                      Text(
                        movie.voteAverage.toString(),
                        style: TextStyle(
                          color: Themes.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),

          // Detail Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Premium Label
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Premium',
                    style: TextStyle(
                      color: Themes.whiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Title
                Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Themes.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Release Year
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.grey, size: 16),
                    SizedBox(width: 6),
                    Text(
                      DateTime.tryParse(movie.releaseDate)?.year.toString() ??
                          '-',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // Duration
                Row(
                  children: const [
                    Icon(Icons.access_time, color: Colors.grey, size: 16),
                    SizedBox(width: 6),
                    Text('148 Minutes', style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 8),
                    Chip(
                      label: Text('PG-13'),
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: Colors.cyan),
                      labelStyle: TextStyle(color: Colors.cyan),
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // Genre & Type
                Row(
                  children: const [
                    Icon(Icons.movie_filter, color: Colors.grey, size: 16),
                    SizedBox(width: 6),
                    Text('Action', style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 8),
                    Text('|', style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 8),
                    Text('Movie', style: TextStyle(color: Themes.whiteColor)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
