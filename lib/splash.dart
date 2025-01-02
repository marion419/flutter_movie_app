import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/home/home_page.dart';
import 'package:flutter_movie_app/presentation/viewModels/movies_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 로딩 화면
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final viewmodel = ref.watch(moviesViewModel.notifier);
          viewmodel.findMovies();
          return Scaffold(
            body: Center(
              child: GestureDetector(
                onTap: () {
                  Movies result = ref.read(moviesViewModel);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(result),
                    ),
                  );
                },
                child: Container(
                  color: Colors.transparent,
                  width: 200,
                  height: 200,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.movie,
                        size: 68,
                        color: Colors.white,
                      ),
                      Text(
                        '시작하기',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
