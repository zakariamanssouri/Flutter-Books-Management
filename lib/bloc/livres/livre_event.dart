part of 'livre_bloc.dart';

@immutable
abstract class LivreEvent {}


class LoadAllLivresEvent extends LivreEvent{}
class SearchLivreEvent extends LivreEvent{
  String? keyword="";

  SearchLivreEvent(this.keyword);
}
class DeleteLivre extends LivreEvent{
  int? id;

  DeleteLivre({required this.id});
}
