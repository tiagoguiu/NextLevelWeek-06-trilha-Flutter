import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;

  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "O vencimento não pode ser vazio" : null;

  String? validateValor(double value) =>
      value == 0 ? "O valor não pode ser vazio" : null;

  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código não pode ser vazio" : null;

  void onChange(
      {String? name, String? dueDate, double? value, String? barcode}) {
    model = model.copyWith(
        name: name, dueDate: dueDate, value: value, barcode: barcode);
//esse copyWith serve para evitar que se um valor for nulo e quisermos preenchelo novamente o compilador tenha que ir na memoria e alterar o valor this da classe, logo essa forma é mais performatica pois o garbageCollector irá liberar essa memoria logo logo
  }

  Future<void> saveBoleto() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final boletos = instance.getStringList("boletos") ?? <String>[];
      boletos.add(model.toJson());
      await instance.setStringList("boletos", boletos);
      return;
    } catch (e) {}
  }

  Future<void> cadastrarBoleto() async {
    final form = formKey.currentState;
    //O FORM COM TEXTFORMFIELD TEM UMA INTERAÇÃO DE IDENTIFICAÇÃO ENTRE ELES
    if (form!.validate()) {
      return await saveBoleto();
    }
  }
}
