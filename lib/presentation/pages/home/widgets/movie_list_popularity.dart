import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/viewModels/popular_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 가로 스크롤뷰 영화 리스트
class MovieListPopularity extends ConsumerWidget {
  const MovieListPopularity({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(popularViewModel.notifier).findMoviesPopular();
    final movieList = ref.watch(popularViewModel);

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '인기순',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 180,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: movieList.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 160,
                  height: 180,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueAccent,
                          image: DecorationImage(
                            image: NetworkImage(movieList[index].posterPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            height: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 96,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
