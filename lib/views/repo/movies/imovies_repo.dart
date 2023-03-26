abstract class ImoviesRepo {
  getMoviesFromApi(List<dynamic> movieList);
  getSavedMovies();
  saveMovies(List<dynamic> movies);
}
