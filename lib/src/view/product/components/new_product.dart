import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/controller/new_product_controller.dart';
import 'package:flutter_emporio/src/controller/product_controller.dart';
import 'package:flutter_emporio/src/model/produto_model.dart';
import 'package:flutter_emporio/src/utils/alerts.dart';
import 'package:flutter_emporio/src/widgets/custom_button_circular.dart';
import 'package:flutter_emporio/src/widgets/custom_field_widget.dart';
import 'package:provider/provider.dart';

class NewProduct extends StatefulWidget {
  final Produto? produto;
  const NewProduct({Key? key, this.produto}) : super(key: key);

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  NewProductController? _newProductController;
  ProductController? _productController;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _gtinController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _estoqueController = TextEditingController();
  final TextEditingController _expirationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _newProductController =
          Provider.of<NewProductController>(context, listen: false);
      _productController =
          Provider.of<ProductController>(context, listen: false);
      _nameController.text = widget.produto?.nomeProduto ?? '';
      _descriptionController.text = widget.produto?.descricaoProduto ?? '';
      _gtinController.text = widget.produto?.gtinProduto ?? '';
      _estoqueController.text = widget.produto?.qtdEstoque.toString() ?? '';
      _expirationController.text = widget.produto?.dataValidadeProduto ?? '';
      String valorProduto = widget.produto?.valorProdutoInCents != null
          ? (widget.produto!.valorProdutoInCents! * 100).toString()
          : '';
      _priceController.text = valorProduto;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        height: size.height * 0.6,
        width: size.width * 0.5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Consumer<NewProductController>(
                builder: (context, _, __) => widget.produto?.urlImagemProduto !=
                        null
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        height: size.height * 0.15,
                        width: size.width * 0.15,
                        child: Image.network(widget.produto!.urlImagemProduto!))
                    : null == _newProductController?.imageProduct
                        ? GestureDetector(
                            onTap: () =>
                                _newProductController?.getImageProduct(),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              height: size.height * 0.15,
                              width: size.width * 0.15,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.camera),
                                    SizedBox(height: 5),
                                    Text('Adicionar imagem')
                                  ]),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.image),
                              Text(_newProductController!.nameProduct!),
                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: () =>
                                    _newProductController?.clearImage(),
                                icon: Icon(
                                  Icons.delete,
                                  color: Theme.of(context).primaryColor,
                                ),
                              )
                            ],
                          ),
              ),
              CustomFieldWidget(
                textEditingController: _nameController,
                height: size.height * 0.05,
                width: size.width * 0.3,
                textLabel: 'Nome',
              ),
              CustomFieldWidget(
                textEditingController: _descriptionController,
                height: size.height * 0.05,
                width: size.width * 0.3,
                textLabel: 'Descrição',
              ),
              CustomFieldWidget(
                textEditingController: _gtinController,
                height: size.height * 0.05,
                width: size.width * 0.3,
                textLabel: 'Código',
              ),
              CustomFieldWidget(
                textEditingController: _priceController,
                height: size.height * 0.05,
                width: size.width * 0.3,
                textLabel: 'Valor',
              ),
              CustomFieldWidget(
                textEditingController: _estoqueController,
                height: size.height * 0.05,
                width: size.width * 0.3,
                textLabel: 'Estoque',
              ),
              CustomFieldWidget(
                textEditingController: _expirationController,
                height: size.height * 0.05,
                width: size.width * 0.3,
                textLabel: 'Validade',
              ),
              CustomButtonCircular(
                size.height * 0.05,
                size.width * 0.1,
                'Salvar',
                () => _newProductController?.create(
                    _nameController.text,
                    _expirationController.text,
                    _descriptionController.text,
                    _gtinController.text,
                    _priceController.text,
                    _estoqueController.text, onSucess: (String message) {
                  Navigator.pop(context);
                  _productController?.getAllProducts();
                  Alerts.showSucess(context,
                      height: size.height * 0.3,
                      width: size.width * 0.4,
                      message: message);
                }, onError: (String message) {
                  Alerts.showError(context,
                      height: size.height * 0.2,
                      width: size.width * 0.2,
                      message: message);
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
