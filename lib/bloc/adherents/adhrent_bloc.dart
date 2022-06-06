import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tp1flutter/Repository/AdherentRepository.dart';
import 'package:tp1flutter/models/Adherent.dart';

import 'adhrent_event.dart';
import 'adhrent_state.dart';


class AdhrentBloc extends Bloc<AdhrentEvent, AdhrentState> {
  AdherentRepository adherentRepository;
  String lastEvent = "";

  AdhrentBloc(AdhrentState adhrentState, this.adherentRepository)
      : super(adhrentState) {
    on<AdhrentEvent>((event, emit) async {
      if (event is LoadAllAdhrentEvent) {
        lastEvent = "All";
        emit(AdhrentState(adherents: [],
            requestState: RequestState.Loading,
            errorMessage: ""));
        try {
          List<Adherent> adherentsList = await adherentRepository
              .allAdherents();
          print(adherentsList);
          emit(AdhrentState(adherents: adherentsList,
              requestState: RequestState.Loaded,
              errorMessage: ""));
        } catch (e) {
          emit(AdhrentState(adherents: [],
              requestState: RequestState.Error,
              errorMessage: e.toString()));
        }
      }

      if (event is DeleteAdherentEvent) {
        lastEvent = "DeleteAdhrent";
        emit(AdhrentState(adherents: [],
            requestState: RequestState.Loading,
            errorMessage: ""));
        try {
          await adherentRepository.deleteAdhrent(event.id);
          emit(AdhrentState(adherents: adherentRepository.adherents,
              requestState: RequestState.NONE,
              errorMessage: "",
              deleteState: DeleteState.Deleted));
        } catch (e) {
          emit(AdhrentState(adherents: [],
              requestState: RequestState.Error,
              errorMessage: e.toString()));
        }
      }
    });
  }
}
