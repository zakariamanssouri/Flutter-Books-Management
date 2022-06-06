part of 'livre_bloc.dart';

enum RequestLiverState{Loaded,Loading,Error,NONE,Searching,Done,Deleting}

@immutable
class LivreState{
  List<Livre> livres;
  RequestLiverState requestState;
  String errorMessage;

  LivreState({required this.livres, required this.requestState, required this.errorMessage});

}
