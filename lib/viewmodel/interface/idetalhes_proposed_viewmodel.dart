import 'package:flutter/material.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class IDetalhesProposedViewmodel extends BaseViewModel {
  void scheduleProposal(String id);
  selectProposed(String id);
  selectTab(int index);
  updateCurrentIndex(int index);
  initTabController(TickerProvider ticker);
}
