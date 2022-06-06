
import '../../models/Adherent.dart';

enum RequestState{Loaded,Loading,Error,NONE,Added}
enum DeleteState{Deleted,Error,NONE}

class AdhrentState {
  List<Adherent> adherents;
  RequestState requestState;
  DeleteState? deleteState;
  String errorMessage;

  AdhrentState({required this.adherents, required this.requestState, required this.errorMessage,this.deleteState});

}


