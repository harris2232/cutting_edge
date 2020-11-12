import 'dart:async';

enum priceFilter { min, max }

class PriceBloc {
  final priceStreamController = StreamController<priceFilter>.broadcast();
  StreamSink<priceFilter> get priceSink => priceStreamController.sink;
  Stream<priceFilter> get priceStream => priceStreamController.stream;

  PriceBloc() {
    priceStream.listen((event) {
      if (event == priceFilter.min) {
        return true;
      } else {
        return false;
      }
    });
  }

  void closeBloc() {
    priceStreamController.close();
  }
}
