part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();

  @override
  List<Object> get props => [];
}

class GetPersonEvent extends PersonEvent {}

class CreatePersonEvent extends PersonEvent {
  final String firstName;
  final String lastName;
  final String message;
  const CreatePersonEvent({
    required this.firstName,
    required this.lastName,
    required this.message,
  });

  @override
  List<Object> get props => [firstName, lastName, message];
}

class EditPersonEvent extends PersonEvent {
  final String id;
  final String firstName;
  final String lastName;
  final String message;
  const EditPersonEvent({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.message,
  });

  @override
  List<Object> get props => [firstName, lastName, message, id];
}
