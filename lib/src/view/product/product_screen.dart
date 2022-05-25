import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/controller/controller.dart';
import 'package:flutter_emporio/src/repository/product_repository.dart';
import 'package:flutter_emporio/src/themes/colors_app.dart';
import 'package:flutter_emporio/src/view/product/components/data_table_product.dart';
import 'package:flutter_emporio/src/view/product/components/product_widget.dart';
import 'package:flutter_emporio/src/widgets/custom_button_circular.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductsController? _productsController;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _productsController =
          Provider.of<ProductsController>(context, listen: false);
      _productsController!.getAllProducts();
    });
  }

  @override
  void dispose() {
    _productsController!.isLoading = false;
    _productsController!.products = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorsApp.kSecondColor.withOpacity(0.5),
              ),
              height: size.height * 0.8,
              width: size.width <= 1000 ? size.width * 0.95 : size.width * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.05),
                    Consumer<ProductsController>(
                      builder: (context, productsController, _) =>
                          productsController.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : productsController.products.isEmpty
                                  ? Center(
                                      child: Image.asset(
                                        'assets/images/products_not_found.png',
                                        height: size.height * 0.5,
                                      ),
                                    )
                                  : DataTableProduct(
                                      produtos: productsController.products),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.02),
                child: CustomButtonCircular(
                  size.height * 0.05,
                  size.width * 0.1,
                  "Adicionar produto",
                  () => showDialog(
                    context: context,
                    builder: (context) => const ProductWidget(),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
