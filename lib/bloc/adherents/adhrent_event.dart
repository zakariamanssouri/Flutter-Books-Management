
abstract class AdhrentEvent {}

class LoadAllAdhrentEvent extends AdhrentEvent{}
class DeleteAdherentEvent extends AdhrentEvent{
  int id;

  DeleteAdherentEvent({required this.id});
}

