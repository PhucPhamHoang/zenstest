import 'package:flutter/material.dart';
import 'package:zenstest/data/model/drink_model.dart';
import 'package:zenstest/data/model/size_model.dart';
import 'package:zenstest/data/model/topping_model.dart';
import 'component/AppStyle.dart';
import 'package:badges/badges.dart' as badges;
import 'data/model/option_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ValueNotifier<int> _quantityNotifier;
  late ValueNotifier<double> _totalPrice;
  late TextEditingController noteController = TextEditingController();
  ValueNotifier<SizeModel> currentOrderSize =
      ValueNotifier(SizeModel(id: 0, name: "", price: 0));
  ValueNotifier<ToppingModel> currentOrderTopping =
      ValueNotifier(ToppingModel(id: 0, name: "", price: 0));
  ValueNotifier<OptionModel> currentOrderOption =
      ValueNotifier(OptionModel(id: 0, name: "", price: 0));
  DrinkModel? drinkModel;
  List<OptionModel>? optionModel;
  List<SizeModel>? sizeModel;
  List<ToppingModel>? toppingModel;
  late double basePrice;
  final Color _defaultColor = const Color.fromRGBO(254, 114, 76, 1);

  @override
  void initState() {
    _quantityNotifier = ValueNotifier<int>(0);
    _totalPrice = ValueNotifier<double>(0);
    super.initState();
  }

  Future<void> _incrementCounter() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _quantityNotifier.value += 1;
    _totalPrice.value = (basePrice +
            currentOrderTopping.value.price +
            currentOrderSize.value.price) *
        _quantityNotifier.value;
  }

  Future<void> _decrementCounter() async {
    if (_quantityNotifier.value > 0) {
      await Future.delayed(const Duration(milliseconds: 100));
      _quantityNotifier.value -= 1;
      _totalPrice.value = (basePrice +
              currentOrderTopping.value.price +
              currentOrderSize.value.price) *
          _quantityNotifier.value;
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            const SizedBox.expand(),
            FutureBuilder(
                future: DrinkModel.getData(),
                builder:
                    (BuildContext context, AsyncSnapshot<DrinkModel> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasData) {
                    basePrice = snapshot.data?.salePrice ?? 0;
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.asset(
                        snapshot.data?.img ?? "",
                        fit: BoxFit.fill,
                      ),
                    );
                  }
                  return Container();
                }),
            Positioned(
                top: MediaQuery.of(context).size.height * (0.3 / 6),
                left: 25,
                child: Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: 37,
                    height: 37,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chevron_left,
                        size: 35,
                      ),
                      color: Colors.black,
                    ),
                  ),
                )),
            Positioned(
                top: MediaQuery.of(context).size.height * (0.3 / 6),
                right: 25,
                child: Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: SizedBox(
                      width: 35,
                      height: 35,
                      child: badges.Badge(
                        badgeStyle: const badges.BadgeStyle(
                            shape: badges.BadgeShape.circle,
                            badgeColor: Colors.red,
                            padding: EdgeInsets.all(4)),
                        position: badges.BadgePosition.custom(
                          end: -3,
                          top: -6,
                        ),
                        badgeContent: const Text(
                          '5',
                          style: TextStyle(color: Colors.white),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_basket_outlined,
                            size: 25,
                          ),
                          color: Colors.black,
                        ),
                      )),
                )),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.265,
                left: 0,
                // bottom:0,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.58,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.amberAccent,
                    decoration: const BoxDecoration(
                      color: Color(0xfff0f1f4),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: _buildLowerContent(),
                    ))),
            Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  color: Colors.white,
                  child: _buildFooter(),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildLowerContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
          child: FutureBuilder(
              future: DrinkModel.getData(),
              builder:
                  (BuildContext context, AsyncSnapshot<DrinkModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data?.name ?? "",
                        style: AppStyle.exTremeBold,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        snapshot.data?.description ?? "",
                        style: AppStyle.medianLight,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 24,
                                color: Color.fromRGBO(255, 197, 41, 1),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text((snapshot.data?.rating ?? 0).toString(),
                                  style: AppStyle.medianBold)
                            ],
                          ),
                          RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: formatCurrency(
                                      snapshot.data?.price ?? 0,
                                      isPrice: false),
                                  style: AppStyle.medianLight.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      color:
                                          const Color.fromRGBO(97, 97, 1, 1))),
                              TextSpan(
                                  text:
                                      ' ${formatCurrency(snapshot.data?.salePrice ?? 0, isPrice: false)}',
                                  style: AppStyle.exTremeBold.copyWith(
                                    color: _defaultColor,
                                  )),
                            ]),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      _buildRichText("Chọn size ", "( Bắt buộc )"),
                      FutureBuilder(
                          future: SizeModel.getListData(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<SizeModel>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            if (snapshot.hasData) {
                              if (snapshot.data != null) {
                                return ValueListenableBuilder<SizeModel?>(
                                    valueListenable: currentOrderSize,
                                    builder: (BuildContext context,
                                        SizeModel? value, Widget? child) {
                                      List<Widget> sizeWidgets = snapshot.data!
                                          .map((sizeModel) =>
                                              _orderSizeOption(sizeModel))
                                          .toList();
                                      return Column(
                                        children: sizeWidgets,
                                      );
                                    });
                              }
                            }
                            return Container();
                          }),
                      const SizedBox(
                        height: 25,
                      ),
                      _buildRichText("Món ăn kèm ", "( không bắt buộc )"),
                      FutureBuilder(
                          future: ToppingModel.getListData(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<ToppingModel>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            if (snapshot.hasData) {
                              if (snapshot.data != null) {
                                return ValueListenableBuilder<ToppingModel>(
                                    valueListenable: currentOrderTopping,
                                    builder: (BuildContext context,
                                        ToppingModel value, Widget? child) {
                                      List<Widget> sizeWidgets = snapshot.data!
                                          .map((toppingModel) =>
                                              _orderTopping(toppingModel))
                                          .toList();
                                      return Column(
                                        children: sizeWidgets,
                                      );
                                    });
                              }
                            }
                            return Container();
                          }),
                      const SizedBox(
                        height: 25,
                      ),
                      _buildRichText(
                          "Yêu cầu thành phần", "( không bắt buộc )"),
                      FutureBuilder(
                          future: OptionModel.getListData(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<OptionModel>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            if (snapshot.hasData) {
                              if (snapshot.data != null) {
                                return ValueListenableBuilder<OptionModel>(
                                    valueListenable: currentOrderOption,
                                    builder: (BuildContext context,
                                        OptionModel value, Widget? child) {
                                      List<Widget> sizeWidgets = snapshot.data!
                                          .map((optionModel) =>
                                              _orderOption(optionModel))
                                          .toList();
                                      return Column(
                                        children: sizeWidgets,
                                      );
                                    });
                              }
                            }
                            return Container();
                          }),
                      const SizedBox(
                        height: 25,
                      ),
                      _buildRichText(
                          "Thêm lưu ý cho quán", "( không bắt buộc )"),
                      _buildTextField(),
                      Text(
                        "Việc thực hiện yêu cầu còn tùy thuộc vào khả năng của quán",
                        style: AppStyle.normalMedium.copyWith(
                            color: const Color.fromRGBO(97, 97, 1, 1)),
                      )
                    ],
                  );
                }
                return Container();
              }),
        ),
      ],
    );
  }

  Widget _buildTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 10),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(247, 247, 247, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: TextField(
          controller: noteController,
          maxLines: 5,
          decoration: const InputDecoration(
            hintText: 'Ghi chú ở đây',
            contentPadding: EdgeInsets.all(10.0),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildInputQuantityButton(
      Function() ontap, IconData icon, String type) {
    return GestureDetector(
      onTap: ontap,
      child: CircleAvatar(
        radius: type == "minus" ? 14 : 17,
        backgroundColor: _defaultColor,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildInputQuantity() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildInputQuantityButton(_decrementCounter, Icons.remove, "minus"),
          const SizedBox(width: 20),
          ValueListenableBuilder<int>(
            valueListenable: _quantityNotifier,
            builder: (BuildContext context, int value, Widget? child) {
              String formattedCounter = value.toString().padLeft(2, '0');
              return Text(formattedCounter, style: AppStyle.largeBold);
            },
          ),
          const SizedBox(width: 20),
          _buildInputQuantityButton(_incrementCounter, Icons.add, "plus"),
        ],
      ),
    );
  }

  Widget _buildRichText(String title, String subTitle) {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(text: title, style: AppStyle.largeBold),
        TextSpan(text: subTitle, style: AppStyle.medianLight),
      ]),
    );
  }

  Widget _orderSizeOption(SizeModel sizeModel) {
    return Column(
      children: [
        RadioListTile<SizeModel>(
          contentPadding: EdgeInsets.zero,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sizeModel.name,
                style: AppStyle.medianMedium,
              ),
              Text(
                formatCurrency(sizeModel.price),
                style: AppStyle.normalMedium,
              ),
            ],
          ),
          activeColor: _defaultColor,
          tileColor: Colors.black12,
          value: sizeModel,
          groupValue: currentOrderSize.value,
          onChanged: (SizeModel? value) {
            currentOrderSize.value = value!;
          },
          visualDensity: const VisualDensity(horizontal: -4),
        ),
        const Divider(
          color: Color.fromRGBO(220, 220, 220, 1),
          thickness: 0.5,
          height: 0.5,
        )
      ],
    );
  }

  Widget _orderTopping(ToppingModel toppingModel) {
    return Column(
      children: [
        RadioListTile<ToppingModel>(
          contentPadding: EdgeInsets.zero,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                toppingModel.name,
                style: AppStyle.medianMedium,
              ),
              Text(
                formatCurrency(toppingModel.price),
                style: AppStyle.normalMedium,
              ),
            ],
          ),
          activeColor: _defaultColor,
          tileColor: Colors.black12,
          value: toppingModel,
          groupValue: currentOrderTopping.value,
          onChanged: (ToppingModel? value) {
            currentOrderTopping.value = value!;
          },
        ),
        const Divider(
          color: Color.fromRGBO(220, 220, 220, 1),
          thickness: 0.5,
          height: 0.5,
        )
      ],
    );
  }

  Widget _orderOption(OptionModel optionModel) {
    return Column(
      children: [
        RadioListTile<OptionModel>(
          contentPadding: EdgeInsets.zero,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                optionModel.name,
                style: AppStyle.medianMedium,
              ),
              Text(
                formatCurrency(optionModel.price),
                style: AppStyle.normalMedium,
              ),
            ],
          ),
          activeColor: _defaultColor,
          tileColor: Colors.black12,
          value: optionModel,
          groupValue: currentOrderOption.value,
          onChanged: (OptionModel? value) {
            currentOrderOption.value = value!;
          },
        ),
        const Divider(
          color: Color.fromRGBO(220, 220, 220, 1),
          thickness: 0.5,
          height: 0.5,
        )
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildInputQuantity(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: _defaultColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  "assets/icons/bag.png",
                  color: _defaultColor,
                  height: 16,
                  width: 16,
                ),
              ),
              const SizedBox(width: 5),
              ValueListenableBuilder<double>(
                valueListenable: _totalPrice,
                builder: (BuildContext context, double value, Widget? child) {
                  return Text(
                      'Thêm vào đơn - ${formatCurrency(value, isPrice: false)}',
                      style: AppStyle.medianBold.copyWith(color: Colors.white));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  String formatCurrency(double value, {bool isPrice = true}) {
    String formattedValue = value.toStringAsFixed(0);
    final RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    formattedValue =
        formattedValue.replaceAllMapped(regex, (Match match) => '${match[1]}.');
    if (isPrice && (value > 0)) {
      formattedValue = '+$formattedValue';
    }
    formattedValue += 'đ';
    return formattedValue;
  }
}
