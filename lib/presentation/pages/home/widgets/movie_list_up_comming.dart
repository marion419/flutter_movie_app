import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/viewModels/up_coming_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 가로 스크롤뷰 영화 리스트
class MovieListUpComming extends ConsumerWidget {
  const MovieListUpComming({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(upComingViewmodel.notifier).findMoviesUpComing();
    final movieList = ref.watch(upComingViewmodel);

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 180,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: movieList.length,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent,
                    image: DecorationImage(
                      image: NetworkImage(movieList[index].posterPath),
                      fit: BoxFit.cover,
                    ),
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
