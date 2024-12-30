import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_list_by_popularity.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_list.dart';
import 'package:flutter_movie_app/presentation/viewModels/movie_list_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          var movies = ref.watch(movieListViewModel);
          movies.nowPlaying.length;
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
              MovieList(
                title: '현재 상영중',
                movieList: movies.nowPlaying,
              ),
              const MovieListByPopularity(),
              MovieList(
                title: '평점 높은 순',
                movieList: movies.topRated,
              ),
              MovieList(
                title: '개봉 예정',
                movieList: movies.upComming,
              ),
            ],
          );
        },
      ),
    );
  }
}
