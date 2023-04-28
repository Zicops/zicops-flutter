import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'exams_event.dart';
part 'exams_state.dart';

class ExamsBloc extends Bloc<ExamsEvent, ExamsState> {
  ExamsBloc() : super(ExamsInitial()) {
    on<ExamsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
