import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crud/data/model/person.dart';
import 'package:crud/data/network/api_client_response.dart';
import 'package:equatable/equatable.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final ApiClientResponse _apiClientResponse = ApiClientResponse();
  PersonBloc() : super(PersonInitial()) {
    on<GetPersonEvent>(getPerson);
    on<CreatePersonEvent>(addPerson);
    on<EditPersonEvent>(editPerson);
    on<DeletePersonEvent>(deletePerson);
  }

  FutureOr<void> getPerson(
      GetPersonEvent event, Emitter<PersonState> emit) async {
    emit(PersonLoading());
    try {
      List<Person> listPerson = await _apiClientResponse.fetchData();
      if (listPerson.isNotEmpty) {
        emit(PersonLoadingSuccses(person: listPerson));
      } else {
        emit(PersonEmpetyState());
      }
    } catch (e) {
      emit(const PersonLoadingError(message: 'Failed to load data'));
    }
  }

  FutureOr<void> addPerson(
      CreatePersonEvent event, Emitter<PersonState> emit) async {
    emit(PersonLoading());
    try {
      final newPerson = await _apiClientResponse.addProfile(
          firstName: event.firstName,
          lastName: event.lastName,
          message: event.message);
      emit(YourPesonState(yourperson: newPerson));
    } catch (e) {
      emit(const PersonLoadingError(message: 'Error to load data'));
    }
  }

  FutureOr<void> editPerson(
      EditPersonEvent event, Emitter<PersonState> emit) async {
    emit(PersonLoading());
    try {
      final newPerson = await _apiClientResponse.editData(
          id: event.id,
          firstname: event.firstName,
          lastname: event.lastName,
          message: event.message);
      emit(YourPesonState(yourperson: newPerson));
    } catch (e) {
      emit(const PersonLoadingError(message: 'Error to load data'));
    }
  }

  FutureOr<void> deletePerson(
      DeletePersonEvent event, Emitter<PersonState> emit) async {
    emit(PersonLoading());
    try {
      final newPerson = await _apiClientResponse.deleteData(id: event.id);
      emit(YourPesonState(yourperson: newPerson));
    } catch (e) {
      emit(const PersonLoadingError(message: 'Error to load data'));
    }
  }
}
