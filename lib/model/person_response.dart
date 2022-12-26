import 'package:movieapp/model/person.dart';

class PersonsResponse {
  final List<Person> persons;
  final String error;

  PersonsResponse(this.persons, this.error);

  PersonsResponse.fromJson(Map<String, dynamic> json)
      : persons = (json["results"] as List)
            .map((i) => new Person.fromJson(i))
            .toList(),
        error = "";

  PersonsResponse.withError(String errorValue)
      : persons = [],
        error = errorValue;
}
