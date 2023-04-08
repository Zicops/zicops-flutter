part of 'lsp_bloc.dart';

abstract class LspEvent extends Equatable {
  const LspEvent();
  @override
  List<Object> get props => [];
}

class LspSelectionRequested extends LspEvent {
  const LspSelectionRequested();
}

class LspSelected extends LspEvent {
  final LspModel lspModel;
  const LspSelected({required this.lspModel});
}
