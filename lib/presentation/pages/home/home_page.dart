import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_list_popularity.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_list_upcoming.dart';
import 'package:flutter_movie_app/presentation/viewModels/now_playing_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    ref.read(nowPlayingViewModel.notifier).findMoviesNowPlaying();
    final result = ref.watch(nowPlayingViewModel);

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
          MovieList(
            title: '현재 상영중',
            movieList: result.list[0],
          ),
          MovieListPopularity(movieList: result.list[1]),
          MovieList(title: '평점 높은 순', movieList: result.list[2]),
          MovieList(title: '개봉 예정', movieList: result.list[3]),
        ],
      ),
    );
  }
}
