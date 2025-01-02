import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/home/home_page.dart';
import 'package:flutter_movie_app/presentation/viewModels/movies_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // @override
  // void initState() {
  //   super.initState();

  // }

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
          );
        },
      ),
    );
  }
}
