import 'package:flutter/material.dart';
import 'package:zenstest/data/model/drink_model.dart';
import 'package:zenstest/static/enum/orderSizeEnum.dart';
import 'component/AppStyle.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _quantity = 0;
  OrderSizeEnum? currentOrderSize;
  OrderSideEnum? currentOrderSide;
  late Future<DrinkModel?> model;
  final Color _defaultColor = const Color.fromRGBO(254, 114, 76, 1);
  @override
  void initState() {
    model.getData().then((value) => null);
    super.initState();
  }
  void _incrementCounter() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_quantity > 0) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            const SizedBox.expand(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.network(
                ,
                fit: BoxFit.fill,
              ),
            ),
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
                  height: MediaQuery.of(context).size.height * 0.735,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.amberAccent,
                  decoration: const BoxDecoration(
                    color: Color(0xfff0f1f4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: _buildLowerContent(),
                )),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Trà Đào mix Dâu",
                style: AppStyle.exTremeBold,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Thành phần: Cà phê nguyên chất, sữa, bột béo, đường, hương liệu,...",
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
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text('4.5', style: AppStyle.medianBold)
                    ],
                  ),
                  Row(
                    children: [
                      Text('59.000đ',
                          style: AppStyle.medianLight.copyWith(
                              decoration: TextDecoration.lineThrough)),
                      const SizedBox(
                        width: 7,
                      ),
                      Text('45.000đ',
                          style: AppStyle.exTremeBold.copyWith(
                            color: _defaultColor,
                          ))
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              _buildRichText("Chọn size ", "( Bắt buộc )"),
              _orderSizeOption(OrderSizeEnum.small),
              _orderSizeOption(OrderSizeEnum.medium),
              _orderSizeOption(OrderSizeEnum.large),
              const SizedBox(
                height: 25,
              ),
              _buildRichText("Món ăn kèm ", "( không bắt buộc )"),
              _orderSideOption(OrderSideEnum.cookie),
              _orderSideOption(OrderSideEnum.cake),
            ],
          ),
        ),
        Expanded(
            child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: _buildFooter(),
        ))
      ],
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
    String formattedCounter = _quantity.toString().padLeft(2, '0');
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildInputQuantityButton(_decrementCounter, Icons.remove, "minus"),
          const SizedBox(width: 20),
          Text(formattedCounter, style: AppStyle.largeBold),
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

  Widget _orderSizeOption(OrderSizeEnum orderSizeEnum) {
    return Column(
      children: [
        RadioListTile<OrderSizeEnum>(
          contentPadding: EdgeInsets.zero,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderSizeEnum.title,
                style: AppStyle.medianMedium,
              ),
              Text(
                orderSizeEnum.priceText,
                style: AppStyle.normalMedium,
              ),
            ],
          ),
          activeColor: _defaultColor,
          tileColor: Colors.black12,
          value: orderSizeEnum,
          groupValue: currentOrderSize,
          onChanged: (OrderSizeEnum? value) {
            setState(() {
              currentOrderSize = value;
            });
          },
          visualDensity: const VisualDensity(horizontal: -4),
        ),
        const Divider(
          color: Colors.black12,
          thickness: 0.5,
          height: 0.5,
        )
      ],
    );
  }

  Widget _orderSideOption(OrderSideEnum orderSideEnum) {
    return Column(
      children: [
        RadioListTile<OrderSideEnum>(
          contentPadding: EdgeInsets.zero,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderSideEnum.title,
                style: AppStyle.medianMedium,
              ),
              Text(
                orderSideEnum.priceText,
                style: AppStyle.normalMedium,
              ),
            ],
          ),
          activeColor: _defaultColor,
          tileColor: Colors.black12,
          value: orderSideEnum,
          groupValue: currentOrderSide,
          onChanged: (OrderSideEnum? value) {
            setState(() {
              currentOrderSide = value;
            });
          },
        ),
        const Divider(
          color: Colors.orange,
          thickness: 0.2,
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
                child: Icon(
                  Icons.shopping_bag,
                  color: _defaultColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 5),
              Text('Thêm vào đơn - 62.000đ',
                  style: AppStyle.medianBold.copyWith(color: Colors.white)),
            ],
          ),
        )
      ],
    );
  }

  double parseCurrencyStringToDouble(String value) {
    String cleanedValue = value.replaceAll(RegExp(r'[+đ]'), '');
    double number = double.parse(cleanedValue);
    return number;
  }
}
