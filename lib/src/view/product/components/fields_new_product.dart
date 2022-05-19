import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/controller/controller.dart';
import 'package:flutter_emporio/src/model/produto_model.dart';
import 'package:flutter_emporio/src/utils/alerts.dart';
import 'package:flutter_emporio/src/utils/validators.dart';
import 'package:flutter_emporio/src/widgets/custom_button_circular.dart';
import 'package:flutter_emporio/src/widgets/custom_field_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class FieldsNewProduct extends StatelessWidget {
  late final ProductController? _productController;
  final Produto? produto;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _gtinController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _estoqueController = TextEditingController();
  final TextEditingController _expirationController = TextEditingController();
  final MaskTextInputFormatter dateFormatter =
      MaskTextInputFormatter(mask: '##/##/####');

  FieldsNewProduct({Key? key, this.produto}) : super(key: key) {
    _nameController.text = produto?.nomeProduto ?? '';
    _descriptionController.text = produto?.descricaoProduto ?? '';
    _gtinController.text = produto?.gtinProduto ?? '';
    _estoqueController.text = produto?.qtdEstoque.toString() ?? '';
    _expirationController.text = produto?.dataValidadeProduto ?? '';
    String valorProduto =
        produto?.valorProduto != null ? (produto!.valorProduto!) : '';
    _priceController.text = valorProduto;
  }
  @override
  Widget build(BuildContext context) {
    _productController = Provider.of<ProductController>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomFieldWidget(
            validator: (string) {
              if (Validators.isEmpty(string)) {
                return 'Campo obrigatório!';
              }
              return null;
            },
            textEditingController: _nameController,
            height: size.height * 0.05,
            width: size.width * 0.3,
            textLabel: 'Nome',
          ),
          CustomFieldWidget(
            validator: (string) {
              if (Validators.isEmpty(string)) {
                return 'Campo obrigatório!';
              }
              return null;
            },
            textEditingController: _descriptionController,
            height: size.height * 0.05,
            width: size.width * 0.3,
            textLabel: 'Descrição',
          ),
          CustomFieldWidget(
            validator: (string) {
              if (Validators.isEmpty(string)) {
                return 'Campo obrigatório!';
              }
              if (!Validators.isInt(string!)) {
                return 'Campo inválido!';
              }
              return null;
            },
            textEditingController: _gtinController,
            height: size.height * 0.05,
            width: size.width * 0.3,
            textLabel: 'Código',
          ),
          CustomFieldWidget(
            validator: (string) {
              if (Validators.isEmpty(string)) {
                return 'Campo obrigatório!';
              }
              if (!Validators.isDouble(string!)) {
                return 'Campo inválido!';
              }
              return null;
            },
            textEditingController: _priceController,
            prefixText: 'R\$ ',
            height: size.height * 0.05,
            width: size.width * 0.3,
            textLabel: 'Valor',
          ),
          CustomFieldWidget(
            validator: (string) {
              if (Validators.isEmpty(string)) {
                return 'Campo obrigatório!';
              }
              if (!Validators.isInt(string!)) {
                return 'Campo inválido!';
              }
              return null;
            },
            textEditingController: _estoqueController,
            height: size.height * 0.05,
            width: size.width * 0.3,
            textLabel: 'Quantidade estoque',
          ),
          CustomFieldWidget(
            validator: (string) {
              if (Validators.isEmpty(string)) {
                return 'Campo obrigatório!';
              }
              return null;
            },
            textEditingController: _expirationController,
            height: size.height * 0.05,
            width: size.width * 0.3,
            textLabel: 'Validade',
            formaters: [dateFormatter],
          ),
          Consumer<NewProductController>(
            builder: (context, newProductController, child) =>
                CustomButtonCircular(
                    size.height * 0.05, size.width * 0.1, 'Salvar', () {
              if (_formKey.currentState!.validate()) {
                newProductController.create(
                  _nameController.text,
                  _expirationController.text,
                  _descriptionController.text,
                  _gtinController.text,
                  _priceController.text,
                  _estoqueController.text,
                  onSucess: (String message) {
                    Navigator.pop(context);
                    _productController?.getAllProducts();
                    Alerts.showSucess(context,
                        height: size.height * 0.3,
                        width: size.width * 0.4,
                        message: message);
                  },
                  onError: (String message) {
                    Alerts.showError(context,
                        height: size.height * 0.2,
                        width: size.width * 0.2,
                        message: message);
                  },
                );
              }
            }, isLoading: newProductController.isLoading),
          )
        ],
      ),
    );
  }
}
