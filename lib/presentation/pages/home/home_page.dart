import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_list_by_popularity.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_list_now_playing.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_list_top_rated.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_list_up_comming.dart';
import 'package:flutter_movie_app/presentation/viewModels/movie_list_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
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
          // 현재 상영중인 영화 행
          const MovieListNowPlaying(title: '현재 상영중'),
          //const MovieListByPopularity(),
          //const MovieListTopRated(title: '평점 높은 순'),
          //const MovieListUpComming(title: '개봉 예정'),
        ],
      ),
    );
  }
}
