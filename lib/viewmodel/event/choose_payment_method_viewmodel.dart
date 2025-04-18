import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tchilla/viewmodel/interface/ichoose_payment_method_viewmodel.dart';
import 'dart:io';

class ChoosePaymentMethodViewmodel extends IchoosePaymentMethodViewmodel {
  final RxInt _bodyViewIndex = 0.obs;
  final iban = "000600001597205730102";
  RxInt get bodyViewIndex => _bodyViewIndex;

  final Rx<File?> _selectedPdfFile = Rx<File?>(null);
  Rx<File?> get selectedPdfFile => _selectedPdfFile;

  @override
  void switchMethod(int index) {
    _bodyViewIndex.value = index;
  }

  @override
  void navigateToBack() {
    if (_bodyViewIndex.value != 0) {
      _bodyViewIndex.value = 0;
      return;
    }

    this.navigator.navigateToBack();
  }

  @override
  void paymentMCX() {
    this.navigator.navigateToTiketPage("11");
  }

  void copyIban() {
    Clipboard.setData(ClipboardData(text: iban));
    showSuccess("IBAN copiado com sucesso");
  }

  void submitReceiptevice() async {
    if (_selectedPdfFile.value == null) {
      showWarning("Infome o Comprovativo de pagamneto");

      return;
    }
    return this.navigator.navigateToSucessPage();
  }

  void setReceiptevice() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      _selectedPdfFile.value = File(filePath);
      print("PDF selecionado: $filePath");
    } else {
      print("Seleção cancelada");
    }
  }

  void clearReceiptFile() {
    _selectedPdfFile.value = null;
  }

  @override
  void dispose() {
    super.dispose();
    _selectedPdfFile.value = null;
    _bodyViewIndex.value = 0;
  }
}
