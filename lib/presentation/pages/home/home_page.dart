import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_list_now_playing.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_list_popularity.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_list.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_list_top_rated.dart';
import 'package:flutter_movie_app/presentation/viewModels/now_playing_viewmodel.dart';
import 'package:flutter_movie_app/presentation/viewModels/top_rated_viewmodel.dart';
import 'package:flutter_movie_app/presentation/viewModels/up_coming_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  late List<Movie> upcoming;

  @override
  Widget build(BuildContext context) {
    ref.read(upComingViewmodel.notifier).findMoviesUpComing();
    upcoming = ref.watch(upComingViewmodel);
    return Scaffold(
      body: ListView(
        children: [
          // 가장 인기있는 영화
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '가장 인기있는',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/sample_poster.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 영화 리스트
          const MovieListNowPlaying(
            title: '현재 상영중',
          ),
          const MovieListPopularity(),
          const MovieListTopRated(
            title: '평점 높은 순',
          ),
          MovieList(
            title: '개봉 예정',
            movieList: upcoming,
          ),
        ],
      ),
    );
  }
}
