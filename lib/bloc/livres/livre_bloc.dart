import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tp1flutter/Repository/LivreRepository.dart';
import 'package:tp1flutter/models/Livre.dart';

part 'livre_event.dart';
part 'livre_state.dart';


class LivreBloc extends Bloc<LivreEvent, LivreState> {
  LivreRepository livreRepository;
  String lastEvent = "";

  LivreBloc(LivreState livreState, this.livreRepository)
      : super(livreState) {
    on<LivreEvent>((event, emit) async {
      if (event is LoadAllLivresEvent) {
        lastEvent = "All";
        emit(LivreState(livres: [],
            requestState: RequestLiverState.Loading,
            errorMessage: ""));
        try {
          List<Livre> livresList = await livreRepository
              .allLivres();
          print(livresList);
          emit(LivreState(livres: livresList,
              requestState: RequestLiverState.Loaded,
              errorMessage: ""));
        } catch (e) {
          emit(LivreState(livres: [],
              requestState: RequestLiverState.Error,
              errorMessage: e.toString()));
        }
      }

      if (event is DeleteLivre)  {
        lastEvent = "Delete";
        emit(LivreState(livres: [],
            requestState: RequestLiverState.Searching,
            errorMessage: ""));
        try {
          await livreRepository.deleteLivre(event.id??0);
          List<Livre> livreslist = livreRepository.livres;
          emit(LivreState(livres: livreslist,
              requestState: RequestLiverState.Done,
              errorMessage: ""));
        } catch (e) {
          emit(LivreState(livres: [],
              requestState: RequestLiverState.Error,
              errorMessage: e.toString()));
        }
      }

      if (event is SearchLivreEvent) {
        lastEvent = "Search";
        emit(LivreState(livres: [],
            requestState: RequestLiverState.Searching,
            errorMessage: ""));
        try {
          await livreRepository.livreByKeyword(event.keyword??"");
          emit(LivreState(livres: livreRepository.livres,
              requestState: RequestLiverState.Done,
              errorMessage: ""));
        } catch (e) {
          emit(LivreState(livres: [],
              requestState: RequestLiverState.Error,
              errorMessage: e.toString()));
        }
      }
    });

  }
}

