import 'package:flutter/material.dart';
import 'package:flutter_movie_app/ui/pages/home/widgets/list_by_popularity.dart';
import 'package:flutter_movie_app/ui/pages/home/widgets/movie_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // https://picsum.photos/200/300
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
          const MovieList(title: '현재 상영중'),
          const ListByPopularity(),
          const MovieList(title: '평점 높은 순'),
          const MovieList(title: '개봉 예정'),
        ],
      ),
    );
  }
}
