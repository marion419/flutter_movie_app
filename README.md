# 🎬 Movie App

`TMDB` 데이터를 기반으로 다양한 영화를 둘러볼 수 있는 애플리케이션입니다.

## 💡 프로젝트 소개

### ⏱️ 프로젝트 기간

`2024. 12. 26 - 2025. 01. 02`

### 🛠️ 개발 환경

| Technologies | Tools                                                                                                                                                                                                                                                                            |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 언어         | <img src="https://img.shields.io/badge/dart-0175C2?style=for-the-badge&logo=dart&logoColor=white">                                                                                                                                                                               |
| 프레임워크   | <img src="https://img.shields.io/badge/flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white">                                                                                                                                                                         |
| 에디터       | <img src="https://img.shields.io/badge/VSCode-199ED9?style=for-the-badge">                                                                                                                                                                                                       |
| 협업         | <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white"> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"> <img src="https://img.shields.io/badge/Fork-00A1E0?style=for-the-badge"> |
| 라이브러리   | <img src="https://img.shields.io/badge/Riverpod-00CCBC?style=for-the-badge"> <img src="https://img.shields.io/badge/TMDB-FFCD00?style=for-the-badge">                                                                                                                            |

### 🗂️ 디렉토리 구조

<details>
  <summary> (Click!)디렉토리 구조 </summary>
📦lib

📦lib

┣ 📂data  
 ┃ ┣ 📂data_resources  
 ┃ ┃ ┣ 📜.gitkeep  
 ┃ ┃ ┣ 📜movie_data_source.dart  
 ┃ ┃ ┣ 📜movie_data_source_impl.dart  
 ┃ ┃ ┣ 📜movie_detail_data_source.dart  
 ┃ ┃ ┗ 📜movie_detail_data_source_impl.dart  
 ┃ ┣ 📂dto  
 ┃ ┃ ┣ 📜company.dart  
 ┃ ┃ ┣ 📜genre.dart  
 ┃ ┃ ┣ 📜movie_detail_dto.dart  
 ┃ ┃ ┗ 📜movie_dto.dart  
 ┃ ┗ 📂repositories  
 ┃ ┃ ┗ 📜.gitkeep  
 ┣ 📂domain  
 ┃ ┣ 📂entities  
 ┃ ┃ ┣ 📜movie.dart  
 ┃ ┃ ┗ 📜movie_detail.dart  
 ┃ ┣ 📂repositories  
 ┃ ┃ ┣ 📜.gitkeep  
 ┃ ┃ ┣ 📜movie_detail_repository.dart  
 ┃ ┃ ┣ 📜movie_detail_repository_impl.dart  
 ┃ ┃ ┣ 📜movie_repository.dart  
 ┃ ┃ ┗ 📜movie_repository_impl.dart  
 ┃ ┗ 📂usecases  
 ┃ ┃ ┣ 📜.gitkeep  
 ┃ ┃ ┣ 📜find_detail_usecase.dart  
 ┃ ┃ ┗ 📜find_movies_usecase.dart  
 ┣ 📂presentation  
 ┃ ┣ 📂pages  
 ┃ ┃ ┣ 📂detail  
 ┃ ┃ ┃ ┣ 📂widgets  
 ┃ ┃ ┃ ┃ ┣ 📜company_widget.dart  
 ┃ ┃ ┃ ┃ ┗ 📜genre_widget.dart  
 ┃ ┃ ┃ ┣ 📜.gitkeep  
 ┃ ┃ ┃ ┗ 📜detail_page.dart  
 ┃ ┃ ┗ 📂home  
 ┃ ┃ ┃ ┣ 📂widgets  
 ┃ ┃ ┃ ┃ ┣ 📜movie_list.dart  
 ┃ ┃ ┃ ┃ ┣ 📜movie_list_now_playing.dart  
 ┃ ┃ ┃ ┃ ┣ 📜movie_list_popularity.dart  
 ┃ ┃ ┃ ┃ ┗ 📜movie_list_top_rated.dart  
 ┃ ┃ ┃ ┗ 📜home_page.dart  
 ┃ ┣ 📂viewModels  
 ┃ ┃ ┣ 📜find_detail_viewmodel.dart  
 ┃ ┃ ┣ 📜now_playing_viewmodel.dart  
 ┃ ┃ ┣ 📜popular_viewmodel.dart  
 ┃ ┃ ┣ 📜top_rated_viewmodel.dart  
 ┃ ┃ ┗ 📜up_coming_viewmodel.dart  
 ┃ ┗ 📜providers.dart  
 ┗ 📜main.dart

</details>

## 💡 어떻게 사용하나요?

### 실행 화면

> 홈 페이지

- 지금 가장 인기 있는 영화를 확인할 수 있습니다.
- **현재 상영 중, 인기순, 평점 높은 순, 개봉 예정** 그룹으로 나누어 영화를 살펴볼 수 있습니다.

> 상세 페이지

- 영화를 선택하면 세부 정보를 보여줍니다.
- 좋아하는 영화의 소개말, 줄거리부터 흥행 요소, 배급사까지 폭 넓은 정보를 살펴보세요.
