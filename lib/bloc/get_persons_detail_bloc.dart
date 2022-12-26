// import 'package:flutter/material.dart';
// import 'package:movieapp/model/persons_detail_response.dart';
// import 'package:movieapp/repository/repository.dart';
// import 'package:rxdart/rxdart.dart';

// class PersonsDetailBloc {
//   final MovieRepository _repository = MovieRepository();
//   final BehaviorSubject<PersonsDetailResponse> _subject =
//       BehaviorSubject<PersonsDetailResponse>();

//   getPersonsDetail(int id) async {
//     PersonsDetailResponse response = await _repository.getPersonsDetail(id);
//     _subject.sink.add(response);
//   }

//   void drainStream() async {
//     await _subject.drain();
//   }

//   @mustCallSuper
//   void dispose() async {
//     await _subject.drain();
//     _subject.close();
//   }

//   BehaviorSubject<PersonsDetailResponse> get subject => _subject;
// }

// final personsDetailBloc = PersonsDetailBloc();
