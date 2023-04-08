import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/login/lsp_model.dart';
import '../../repositories/lsp_selection_repository.dart';

part 'lsp_event.dart';
part 'lsp_state.dart';

class LspBloc extends Bloc<LspEvent, LspState> {
  final LspSelectionRepository lspSelectionRepository;
  LspBloc({required this.lspSelectionRepository})
      : super(LspSelectionLoading()) {
    // When User Presses Lsp Selection Button, we send a LspSelectionRequested event to AuthBloc to handle and emit States - LspSelectionNotSelected or LspSelectionError
    on<LspSelectionRequested>((event, emit) async {
      try {
        final lspModelList = await lspSelectionRepository.getLspModelList();
        emit(LspSelectionNotSelected(lspModelList));
      } catch (e) {
        emit(LspSelectionError(message: e.toString()));
      }
    });
    // When User Selects an Lsp, we send a LspSelected event to AuthBloc to handle and emit States - LspSelectionSelected or LspSelectionError
    on<LspSelected>((event, emit) async {
      try {
        final lspModel =
            await lspSelectionRepository.setLspModel(lspModel: event.lspModel);
        emit(LspSelectionSelected(event.lspModel));
      } catch (e) {
        emit(LspSelectionError(message: e.toString()));
      }
    });
  }
}
