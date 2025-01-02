import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/company_widget.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/data_box.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/genre_widget.dart';
import 'package:flutter_movie_app/presentation/viewModels/find_detail_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 영화 상세 페이지
class DetailPage extends StatelessWidget {
  const DetailPage(this.movieId, this.sortMethod, {super.key});

  final int movieId;
  final String sortMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          ref.watch(findDetailViewmodel.notifier).findDetail(movieId);
          final detail = ref.watch(findDetailViewmodel);
          return ListView(
            children: [
              // 포스터
              Hero(
                tag: '$movieId$sortMethod',
                child: Container(
                  width: double.infinity,
                  height: 550,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    image: DecorationImage(
                      image: detail.posterPath != null
                          ? NetworkImage(detail.posterPath!)
                          : const AssetImage('assets/images/sample_poster.jpg'),
                      fit: BoxFit.cover,
                    ),
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
                        Expanded(
                          child: Text(
                            detail.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white,
                            ),
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
                    const SizedBox(height: 12),
                    // 흥행정보 박스
                    SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          DataBox(
                            value: detail.voteAverage,
                            title: '평점',
                          ),
                          DataBox(
                            value: detail.voteCount,
                            title: '평점 투표 수',
                          ),
                          DataBox(
                            value: detail.popularity,
                            title: '인기 점수',
                          ),
                          DataBox(value: detail.budget, title: '예산'),
                          DataBox(value: detail.revenue, title: '수익'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 배급사 박스
                    CompanyWidget(list: detail.productionCompanies),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
