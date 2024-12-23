import 'package:flutter/material.dart';
import 'package:flutter_movie_app/ui/pages/home/widgets/movie_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // https://picsum.photos/200/300
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          // 가장 인기있는 영화
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/images/sample_poster.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // 현재 상영중인 영화 행
          const MovieList(title: '현재 상영중'),
          const MovieList(title: '평점 높은 순'),
          const MovieList(title: '개봉 예정'),
        ],
      ),
    );
  }
}
