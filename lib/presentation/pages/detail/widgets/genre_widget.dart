import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/dto/genre.dart';

class GenreWidget extends StatelessWidget {
  GenreWidget({super.key, required this.list});
  final List<Genre> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 35,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 12);
        },
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
                color: Colors.transparent),
            child: Center(
              child: Text(
                list[index].name,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
