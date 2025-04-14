import 'package:flutter/material.dart';
import 'package:movieku/components/movie_card.dart';
import 'package:movieku/controllers/movie_controller.dart';
import 'package:movieku/model/movie_model.dart';
import 'package:movieku/services/movie_services.dart';
import 'package:movieku/utils/themes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MovieController controller = MovieController();

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  List<Movie> movies = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    loadMovies();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !isLoading &&
          hasMore) {
        loadMovies();
      }
    });

    _searchController.addListener(() {
      setState(() {
        searchQuery = _searchController.text.trim();
        movies.clear();
        currentPage = 1;
        hasMore = true;
      });
      loadMovies();
    });
  }

  void loadMovies() async {
    setState(() => isLoading = true);

    try {
      final result = await MovieService.getPopularMovies(
        page: currentPage,
        query: searchQuery
      ); // Ambil list paginated dari API
      setState(() {
        movies.addAll(result);
        currentPage++;
        if (result.isEmpty) hasMore = false;
      });
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(title: Text('Movieku')),
      body:
          controller.error != null
              ? Center(
                child: Text(controller.error!, style: Themes.baseTextStyle),
              )
              : Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Themes.softColor,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Themes.whiteColor),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  decoration: InputDecoration(
                                    hintText: 'Search movies...',
                                    hintStyle: TextStyle(
                                      color: Themes.grayColor,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  style: Themes.bodyStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: Icon(
                            Icons.filter_list,
                            color: Themes.whiteColor,
                          ),
                          onPressed: () {
                            // Filter action
                            debugPrint('Filter button pressed');
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: movies.length + (hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < movies.length) {
                          final movie = movies[index];
                          return MovieCard(movie: movie);
                        } else {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
    );
  }
}
