import 'package:flutter/material.dart';
import 'package:profi_kit_testapp/core/colors/my_colors.dart';
import 'package:profi_kit_testapp/core/text_style/my_text_style.dart';
import 'package:profi_kit_testapp/features/add_items/presentation/add_items_end_drawer/decoration/input_decoration_for_drawer_text_field.dart';

class AddItemsEndDrawer extends StatelessWidget{
  const AddItemsEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      shape:  const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.myAppVeryLightRedColor,
                  ),
                  child: const Icon(
                    Icons.home_filled,
                    color: MyColors.myAppRedColor,
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(
                        Icons.close,
                    )),
                  ),
                )
              ],
              ),
              const SizedBox(height: 30),
              const Text('Новая позиция',
              style: MyTextStyle.myAppDrawerBoldBigTextStyle,
              ),
              const SizedBox(height: 5),
              const Text('Заполните все поля для заполнения номенклатуры',
              style: MyTextStyle.myAppDrawerGreySmallTextStyle,
              ),
              const SizedBox(height: 15),
              const Text('Название',
              style: MyTextStyle.myAppDrawerNamingBoldBigTextStyle,
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecorationForDrawerTextField.getDecoration('Гриндер, Ось ролика гриндера'),
                ),
              ),
              const SizedBox(height: 15),
              const Text('Единицы измерения',
                style: MyTextStyle.myAppDrawerNamingBoldBigTextStyle,),
              const SizedBox(height: 5),
              SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecorationForDrawerTextField.getDecoration('кол-во штук'),
                ),
              ),
              const SizedBox(height: 15),
              const Text('Артикул/код',
                style: MyTextStyle.myAppDrawerNamingBoldBigTextStyle,),
              const SizedBox(height: 5),
              SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecorationForDrawerTextField.getDecoration('4325523'),
                ),
              ),
              const SizedBox(height: 15),
              const Text('Описание',
                style: MyTextStyle.myAppDrawerNamingBoldBigTextStyle,),
              const SizedBox(height: 5),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                decoration: InputDecorationForDrawerTextField.getDecoration('Ось ролика гриндера и т.д.'),
              ),
              //const Spacer(),
              SizedBox(height: MediaQuery.of(context).size.height/5),
              Row(children: [
                Material(
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(5),
                    splashColor: MyColors.myBlack26Color,
                    child: Ink(
                      width: 140,
                      height: 35,
                      decoration: BoxDecoration(
                        color: MyColors.myAppDarkGreyColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(child: Text('Отмена',
                        style: MyTextStyle.myThinWhiteMediumTextStyle,
                      )),
                    ),
                  ),
                ),
                const Spacer(),
                Material(
                  child: InkWell(
                    onTap: (){
                    },
                    borderRadius: BorderRadius.circular(5),
                    splashColor: MyColors.myAppLightRedColor,
                    child: Ink(
                      width: 140,
                      height: 35,
                      decoration: BoxDecoration(
                        color: MyColors.myAppRedColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(child: Text('Подтвердить',
                        style: MyTextStyle.myThinWhiteMediumTextStyle,
                      )),
                    ),
                  ),
                ),
              ],
              ),


            ],
          ),
        ),
      ),
    );
  }

}