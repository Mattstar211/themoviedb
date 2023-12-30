import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';


class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}


class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
        id: 1,
        imageName: AppImages.moviePlaceholder,
        title: 'Телохранитель на фрилансе',
        time: '5 октября 2023',
        description: 'Бывший оперативник спецназа променял полную экшна жизнь на серые будни в офисе.'
    ),
    Movie(
        id: 2,
        imageName: AppImages.moviePlaceholder,
        title: 'Назад в будущее 1',
        time: '5 октября 2023',
        description: 'Бывший оперативник спецназа променял полную экшна жизнь на серые будни в офисе.'
    ),
    Movie(
        id: 3,
        imageName: AppImages.moviePlaceholder,
        title: 'Оппенгеймер',
        time: '5 октября 2023',
        description: 'Бывший оперативник спецназа променял полную экшна жизнь на серые будни в офисе.'
    ),
    Movie(
        id: 4,
        imageName: AppImages.moviePlaceholder,
        title: 'Железный человек 1',
        time: '5 октября 2023',
        description: 'Бывший оперативник спецназа променял полную экшна жизнь на серые будни в офисе.'
    ),
    Movie(
        id: 5,
        imageName: AppImages.moviePlaceholder,
        title: 'Мстители',
        time: '5 октября 2023',
        description: 'Бывший оперативник спецназа променял полную экшна жизнь на серые будни в офисе.'
    ),
    Movie(
        id: 6,
        imageName: AppImages.moviePlaceholder,
        title: 'Невероятный халк',
        time: '5 октября 2023',
        description: 'Бывший оперативник спецназа променял полную экшна жизнь на серые будни в офисе.'
    ),
    Movie(
        id: 7,
        imageName: AppImages.moviePlaceholder,
        title: 'Железный человек 2',
        time: '5 октября 2023',
        description: 'Бывший оперативник спецназа променял полную экшна жизнь на серые будни в офисе.'
    ),
  ];

  final _searchController = TextEditingController();
  var _filteredMovies = <Movie>[];

  void _searchMovies(){
    final query = _searchController.text;
    if(query.isNotEmpty){
      _filteredMovies = _movies.where((Movie movie){
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }else{
      _filteredMovies = _movies;
    }
    setState(() {

    });
  }
  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  
  void _onMovieTap(int index){
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
        '/main_screen/movie_details',
        arguments: id
    );
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                        border: Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2)
                          )
                        ]
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(image: AssetImage(movie.imageName)),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20,),
                              Text(
                                movie.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                  movie.time,
                                style: TextStyle(
                                  color: Colors.grey
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 20,),
                              Text(
                                movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),

                            ],
                          ),
                        ),
                        const SizedBox(width: 10,),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      onTap: () => _onMovieTap(index),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
              labelText: "Поиск",
            ),
          ),
        ),
      ],
    );
  }
}
