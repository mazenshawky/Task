import 'package:flutter/material.dart';

import '../../utilites/constants.dart';
import '../../utilites/validator.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_inkwell_btn.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';

class AddNewServiceScreen extends StatefulWidget {
  const AddNewServiceScreen({Key? key}) : super(key: key);

  @override
  State<AddNewServiceScreen> createState() => _AddNewServiceScreenState();
}

List<String> categories = ['Gardens', 'Cleaning', 'Electricity', 'Interior Design'];
List<String> services = ['Service 1', 'Service 2', 'Service 3', 'Service 4'];
List<String> cities = ['Cairo', 'Alexandria', 'Al Mansurah', 'Al Minya', 'Aswan', 'Banha', 'Dahab', 'El Gouna'];

String? category;
String? service;
String? city;

var descriptionController = TextEditingController();
var priceController = TextEditingController();
var formKey = GlobalKey<FormState>();

class _AddNewServiceScreenState extends State<AddNewServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhiteColor,
      appBar: AppBar(
        backgroundColor: lightWhiteColor,
        elevation: 0,
        centerTitle: true,
        leading: CustomInkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/icons/ic_back.png",scale: 2,),
          ),
        ),
        title: CustomText(
          title: "Add a new service",
          fontSize: 20,
          color: blackColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // category
                      CustomText(
                        title: "Category",
                        fontSize: 15,
                        color: blackColor,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: shadowColor, spreadRadius: 0, blurRadius: 5, offset: Offset(0, 4)),
                          ],
                        ),
                        child: DropdownButtonFormField<String>(
                          onChanged: categoryChanged,
                          value: category,
                          hint: CustomText(
                            title: '------',
                            fontSize: 14,
                            color: kTimeMessageColor,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            fillColor: whiteColor,
                            filled: true,
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Image.asset("assets/icons/ic_down.png",scale: 1,),
                          ),
                          items: categories.map<DropdownMenuItem<String>>((String? value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value!),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // service name
                      CustomText(
                        title: "Service Name",
                        fontSize: 15,
                        color: blackColor,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: shadowColor, spreadRadius: 0, blurRadius: 5, offset: Offset(0, 4)),
                          ],
                        ),
                        child: DropdownButtonFormField<String>(
                          onChanged: serviceChanged,
                          value: service,
                          hint: CustomText(
                            title: '------',
                            fontSize: 14,
                            color: kTimeMessageColor,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            fillColor: whiteColor,
                            filled: true,
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Image.asset("assets/icons/ic_down.png",scale: 1,),
                          ),
                          items: services.map<DropdownMenuItem<String>>((String? value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value!),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // description
                      CustomText(
                        title: "Description",
                        fontSize: 15,
                        color: blackColor,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: shadowColor, spreadRadius: 0, blurRadius: 5, offset: Offset(0, 4)),
                          ],
                        ),
                        child: CustomTextField(
                          controller: descriptionController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          validation: descriptionField,
                          isUnderlineInputBorder: false,
                          isOutlineInputBorder: false,
                          contentPaddingLeft: 5,
                          decoration: InputDecoration(
                            hintText: '----------',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: kTimeMessageColor,
                            ),
                            fillColor: whiteColor,
                            filled: true,
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        )
                      ),
                      const SizedBox(height: 12),
                      // city
                      CustomText(
                        title: "City",
                        fontSize: 15,
                        color: blackColor,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: shadowColor, spreadRadius: 0, blurRadius: 5, offset: Offset(0, 4)),
                          ],
                        ),
                        child: DropdownButtonFormField<String>(
                          onChanged: cityChanged,
                          value: city,
                          hint: CustomText(
                            title: 'Cairo',
                            fontSize: 14,
                            color: kTimeMessageColor,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            fillColor: whiteColor,
                            filled: true,
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Image.asset("assets/icons/ic_down.png",scale: 1,),
                          ),
                          items: cities.map<DropdownMenuItem<String>>((String? value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value!),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // price
                      CustomText(
                        title: "Price",
                        fontSize: 15,
                        color: blackColor,
                      ),
                      const SizedBox(height: 8),
                      Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: shadowColor, spreadRadius: 0, blurRadius: 5, offset: Offset(0, 4)),
                            ],
                          ),
                          child: CustomTextField(
                            controller: priceController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (_) {},
                            validation: priceField,
                            isUnderlineInputBorder: false,
                            isOutlineInputBorder: false,
                            contentPaddingLeft: 5,
                            decoration: InputDecoration(
                              hintText: 'EGP 70',
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: kTimeMessageColor,
                              ),
                              fillColor: whiteColor,
                              filled: true,
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          )
                      ),
                      const SizedBox(height: 137),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: CustomButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){}
                    },
                    btnHeight: 46,
                    btnWidth: double.infinity,
                    btnRadius: 26,
                    title: "Add",
                    fontWeight: FontWeight.w500,
                    btnColor: blueColor,
                    textColor: whiteColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void categoryChanged(String? val) {
    setState((){
      category = val!;
    });
  }
  void serviceChanged(String? val) {
    setState((){
      service = val!;
    });
  }
  void cityChanged(String? val) {
    setState((){
      city = val!;
    });
  }
}
