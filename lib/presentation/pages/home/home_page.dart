// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detail/detail_page.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_list_popularity.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_list_upcoming.dart';
import 'package:flutter_movie_app/presentation/viewModels/now_playing_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  final int NOW_PLAYING = 0;
  final int POPULAR = 1;
  final int TOP_RATED = 2;
  final int UPCOMING = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final result = ref.watch(nowPlayingViewModel);
          return ListView(
            children: [
              // 가장 인기있는 영화
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
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
                        image: DecorationImage(
                          image: NetworkImage(result.popular.first.posterPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailPage(result.popular[0].id);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // 영화 리스트
              MovieList(
                title: '현재 상영중',
                movieList: result.nowPlaying,
              ),
              MovieListPopularity(movieList: result.popular),
              MovieList(title: '평점 높은 순', movieList: result.topRated),
              MovieList(title: '개봉 예정', movieList: result.upcoming),
            ],
          );
        },
      ),
    );
  }
}
