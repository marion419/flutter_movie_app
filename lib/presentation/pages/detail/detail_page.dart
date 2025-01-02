import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entities/movie_detail.dart';
import 'package:flutter_movie_app/domain/usecases/find_detail_usecase.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/genre_widget.dart';
import 'package:flutter_movie_app/presentation/providers.dart';
import 'package:flutter_movie_app/presentation/viewModels/find_detail_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage(this.movieId, {super.key});

  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(findDetailViewmodel.notifier).findDetail(movieId);
    final detail = ref.watch(findDetailViewmodel);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          // 포스터
          Container(
            width: double.infinity,
            height: 550,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(detail.posterPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 제목, 날짜
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      detail.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      detail.releaseDate,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                // 태그라인
                Text(
                  detail.tagline,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                // 상영 시간
                Text(
                  '${detail.runtime}분',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                // 장르 박스
                const Divider(
                  height: 2,
                  color: Color.fromARGB(255, 91, 91, 91),
                ),
                const SizedBox(height: 12),
                GenreWidget(
                  list: detail.genres,
                ),
                const SizedBox(height: 12),
                const Divider(
                  height: 2,
                  color: Color.fromARGB(255, 91, 91, 91),
                ),
                const SizedBox(height: 12),
                // 영화 설명
                Text(
                  detail.overview,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                const Divider(
                  height: 2,
                  color: Color.fromARGB(255, 91, 91, 91),
                ),
                const SizedBox(height: 16),
                // 흥행정보
                const Text(
                  '흥행정보',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          )
        ],
      ),
    );
  }
}
