part of 'lsp_bloc.dart';

@immutable
abstract class LspState extends Equatable {}

/// For lsp selection page

// When User Presses Login Button, the state will be changed to Loading
class LspSelectionLoading extends LspState {
  @override
  List<Object?> get props => [];
}

// After lsp is loaded, state changes to LspSelectionNotSelected
class LspSelectionNotSelected extends LspState {
  final List<LspModel> lspModelList;

  LspSelectionNotSelected(this.lspModelList);

  @override
  List<Object> get props => [lspModelList];
}

// After lsp is selected, state changes to LspSelectionSelected
class LspSelectionSelected extends LspState {
  final LspModel lspModel;

  LspSelectionSelected(this.lspModel);

  @override
  List<Object> get props => [lspModel];
}

// Any Error that occurs during Lsp Selection will be handled by this state
class LspSelectionError extends LspState {
  final String message;

  LspSelectionError({required this.message});

  @override
  List<Object> get props => [message];
}
