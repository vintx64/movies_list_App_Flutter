part of 'movie_cubit.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSucess extends MovieState {}

class MovieFailure extends MovieState {
  final String errMessage;

  MovieFailure(this.errMessage);
}
