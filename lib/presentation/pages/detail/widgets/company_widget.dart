import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/dto/company.dart';

class CompanyWidget extends StatelessWidget {
  const CompanyWidget({super.key, required this.list});
  final List<Company> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 12);
        },
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(16),
            width: 130,
            color: Colors.white.withOpacity(0.9),
            child: Center(
              child: list[index].logoPath == null
                  ? Text(
                      textAlign: TextAlign.center,
                      list[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    )
                  : Image(image: NetworkImage(list[index].logoPath!)),
            ),
          );
        },
      ),
    );
  }
}
