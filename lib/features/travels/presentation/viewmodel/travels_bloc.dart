import 'package:bloc/bloc.dart';
 import 'package:bevatel_task/features/travels/domain/repo/travels_repo.dart';
import 'package:bevatel_task/features/travels/presentation/viewmodel/travels_event.dart';
import 'package:bevatel_task/features/travels/presentation/viewmodel/travels_state.dart';

class TravelBloc extends Bloc<TravelEvent, TravelState> {
  final ITravelRepo travelRepo;

  TravelBloc({required this.travelRepo}) : super(TravelInitial()) {
    on<LoadTravels>(_onLoadTravels);
    on<AddTravel>(_onAddTravel);
    on<UpdateTravel>(_onUpdateTravel);
    on<DeleteTravel>(_onDeleteTravel);
  }

  Future<void> _onLoadTravels(
      LoadTravels event, Emitter<TravelState> emit) async {
    emit(TravelLoading());
    try {
      final travels = await travelRepo.getTravels();
      emit(TravelLoaded(travels));
    } catch (e) {
      emit(TravelError(e.toString()));
    }
  }

  Future<void> _onAddTravel(AddTravel event, Emitter<TravelState> emit) async {
    emit(TravelAdding());
    try {
      await travelRepo.addTravel(event.travel);
      emit(TravelAdded());
      add(LoadTravels());
    } catch (e) {
      emit(TravelError(e.toString()));
    }
  }

  Future<void> _onUpdateTravel(
      UpdateTravel event, Emitter<TravelState> emit) async {
    try {
      await travelRepo.updateTravel(event.travel);
      add(LoadTravels());
    } catch (e) {
      emit(TravelError(e.toString()));
    }
  }

  Future<void> _onDeleteTravel(
      DeleteTravel event, Emitter<TravelState> emit) async {
    try {
      await travelRepo.deleteTravel(event.travelId);
      add(LoadTravels());
    } catch (e) {
      emit(TravelError(e.toString()));
    }
  }
}
