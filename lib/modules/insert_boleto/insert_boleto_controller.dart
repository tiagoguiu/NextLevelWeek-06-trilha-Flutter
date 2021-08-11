import 'package:flutter/cupertino.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;

  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "O vencimento não pode ser vazio" : null;

  String? validateValor(double value) =>
      value == 0 ? "O valor não pode ser vazio" : null;

  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código não pode ser vazio" : null;

  void onChange({String? name, String? dueDate, double? value, String? barcode}){
    
  }

  void cadastrarBoleto() {
    final form = formKey.currentState;
    //O FORM COM TEXTFORMFIELD TEM UMA INTERAÇÃO DE IDENTIFICAÇÃO ENTRE ELES
    if(form!.validate()){}
  }
}
