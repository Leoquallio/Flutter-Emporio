import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/controller/products_controller.dart';
import 'package:flutter_emporio/src/themes/colors_app.dart';
import 'package:flutter_emporio/src/view/product/components/data_table_product.dart';
import 'package:flutter_emporio/src/view/product/components/new_product.dart';
import 'package:flutter_emporio/src/widgets/custom_button_circular.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductsController? _ProductsController;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _ProductsController =
          Provider.of<ProductsController>(context, listen: false);
      _ProductsController!.getAllProducts();
    });
  }

  @override
  void dispose() {
    _ProductsController!.isLoading = false;
    _ProductsController!.products = [];
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
                      builder: (context, ProductsController, _) =>
                          ProductsController.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : ProductsController.products.isEmpty
                                  ? Center(
                                      child: Image.asset(
                                        'assets/images/products_not_found.png',
                                        height: size.height * 0.5,
                                      ),
                                    )
                                  : DataTableProduct(
                                      produtos: ProductsController.products),
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
                    builder: (context) => const ProductPage(),
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
