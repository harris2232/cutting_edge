import 'dart:async';
import 'package:cutting_edge/support_files/enums.dart';

class SortingBloc {
  StreamController sortingStreamController =
      StreamController<SortBy>.broadcast();
  StreamSink<SortBy> get sortingSink => sortingStreamController.sink;
  Stream<SortBy> get sortingStream => sortingStreamController.stream;

  SortingBloc() {
    sortingStream.listen((event) {
      return event;
    });
  }

  void closeGenderStream() {
    sortingStreamController.close();
  }
}
