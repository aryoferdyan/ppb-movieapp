import 'package:movieapp/model/person_response.dart';
import 'package:movieapp/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class PersonsListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonsResponse> _subject =
      BehaviorSubject<PersonsResponse>();

  getPersons() async {
    PersonsResponse response = await _repository.getPersons();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PersonsResponse> get subject => _subject;
}

final personsBloc = PersonsListBloc();
