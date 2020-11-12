import 'dart:async';

import 'package:cutting_edge/support_files/enums.dart';

class GenderBloc {
  StreamController genderStreamController =
      StreamController<Gender>.broadcast();
  StreamSink<Gender> get genderSink => genderStreamController.sink;
  Stream<Gender> get genderStream => genderStreamController.stream;

  GenderBloc() {
    genderStream.listen((event) {
      return event;
    });
  }

  void closeGenderStream() {
    genderStreamController.close();
  }
}
