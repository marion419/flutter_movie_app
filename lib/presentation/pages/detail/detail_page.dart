import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          // 포스터
          Container(
            width: double.infinity,
            height: 550,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sample_poster.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 제목, 날짜
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'date',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                // 태그라인
                Text(
                  'tagline tagline tagline tagline',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '100분',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12),
                // 장르 박스
                Divider(
                  height: 2,
                  color: Color.fromARGB(255, 91, 91, 91),
                ),
                SizedBox(height: 60),
                Divider(
                  height: 2,
                  color: Color.fromARGB(255, 91, 91, 91),
                ),
                SizedBox(height: 12),
                // 영화 설명
                Text(
                  '설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12),
                Divider(
                  height: 2,
                  color: Color.fromARGB(255, 91, 91, 91),
                ),
                SizedBox(height: 16),
                // 흥행정보
                Text(
                  '흥행정보',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          )
        ],
      ),
    );
  }
}
