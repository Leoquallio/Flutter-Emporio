import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/controller/new_product_controller.dart';
import 'package:flutter_emporio/src/model/produto_model.dart';
import 'package:flutter_emporio/src/view/product/components/fields_new_product.dart';

import 'package:provider/provider.dart';

class NewProduct extends StatefulWidget {
  final Produto? produto;
  const NewProduct({Key? key, this.produto}) : super(key: key);

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  NewProductController? _newProductController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _newProductController =
          Provider.of<NewProductController>(context, listen: false);
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
              Expanded(
                child: FieldsNewProduct(produto: widget.produto),
              )
            ],
          ),
        ),
      ),
    );
  }
}
