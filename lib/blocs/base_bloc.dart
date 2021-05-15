import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/data_response_error_model.dart';
import '../utils/console.dart';

/// Abstract [Bloc] that contains console logging.
abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  BaseBloc(State initialState) : super(initialState);

  /// Log api errors via [Console] and return string representation.
  String apiError(List<DataResponseErrorModel> errors) {
    Console.log('API ERROR', errors.first.message, error: errors.first);

    if (errors.first.code == '401') {
      // Perform logout
    }

    return errors.first.message;
  }
}
