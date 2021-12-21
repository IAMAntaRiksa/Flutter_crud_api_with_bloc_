part of 'person_bloc.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object> get props => [];
}

class PersonInitial extends PersonState {}

class PersonEmpetyState extends PersonState {}

class PersonLoading extends PersonState {}

class PersonLoadingSuccses extends PersonState {
  final List<Person> person;
  const PersonLoadingSuccses({
    required this.person,
  });
  @override
  List<Object> get props => [person];
}

class PersonLoadingError extends PersonState {
  final String message;
  const PersonLoadingError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class YourPesonState extends PersonState {
  final Person yourperson;
  const YourPesonState({
    required this.yourperson,
  });

  @override
  List<Object> get props => [yourperson];
}
