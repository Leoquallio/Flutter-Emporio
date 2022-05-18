abstract class Validators {
  static String? validadeCodigo(String? codigo) {
    try {
      int.parse(codigo!);
      return null;
    } catch (e) {
      return 'Código inválido!';
    }
  }

  static String? validatePrice(String? price) {
    try {
      double.parse(price!);
      return null;
    } catch (e) {
      return 'Valor inválido!';
    }
  }
}
