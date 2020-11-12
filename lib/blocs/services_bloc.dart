import 'dart:async';

class ServicesBloc {
  StreamController servicesStreamController =
      StreamController<String>.broadcast();
  StreamSink<String> get servicesSink => servicesStreamController.sink;
  Stream<String> get servicesStream => servicesStreamController.stream;

  ServicesBloc() {
    servicesStream.listen((event) {
      return event;
    });
  }

  void closeBloc() {
    servicesStreamController.close();
  }
}
