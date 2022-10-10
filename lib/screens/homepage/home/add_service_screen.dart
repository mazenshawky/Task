import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/models/city_model.dart';
import 'package:mono/provider/add_service_provider.dart';
import 'package:mono/provider/auth_provider.dart';
import 'package:mono/provider/category_provider.dart';
import 'package:mono/provider/city_provider.dart';
import 'package:mono/screens/account/city_screen.dart';
import 'package:mono/screens/homepage/homepage.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/utilites/helper.dart';
import 'package:mono/utilites/validator.dart';
import 'package:mono/widgets/custom_button.dart';
import 'package:mono/widgets/custom_inkwell_btn.dart';
import 'package:mono/widgets/custom_parent_widget.dart';
import 'package:mono/widgets/custom_text.dart';
import 'package:mono/widgets/custom_textfield.dart';
import 'package:mono/widgets/custom_toast.dart';
import 'package:provider/provider.dart';

class AddServiceScreen extends StatefulWidget {
  AddServiceScreen({Key? key}) : super(key: key);

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  List<String> items = [
    'Select Category',
    'masakin eayn shams',
    'maydan alhijaz',
    'altajamue al\'awal',
    'masakin shiratun',
    'ruksi',
    'almizalaat',
    'alnazhuh',
    'alsayidah zaynab',
    'abu alriysh',
    'rawd alfaraj',
    'tariq alfinjarii',
    'aleabaasia',
    'dawaran shibra',
    'zahra madinat nasr',
    'eabaasia',
    'bishtil',
    'kubri uktubar',
    'alkhalifat almamun',
    'alhijaz',
    'al\'alif maskan',
    'mawqif alsalam alnamudhajii',
    'almarj',
    'jisr alsuways',
    'alhayu alsaabie',
    'almazalat',
    'alsabe eimarat',
    'alzaawiat alhamra',
    'alnuzhat aljadida',
    'eabaas aleaqaad',
    'hadayiq alqabih',
    'altajamue',
    'makram eubayd',
    'saray alqabih',
    'alnazhuh aljadida',
    'kuliyat banat eayn shams',
    'tahrir',
    'jiza',
    'alhadayiq',
    'masakin alshuruq',
    'zahra eayn shams',
  ];
  final serviceNameController = TextEditingController();
  String? category;
  final priceController = TextEditingController();

  Data? city;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final catProvider = Provider.of<CategoryProvider>(context, listen: false);
    return CustomParentWidget(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Color for Android
          statusBarIconBrightness: Brightness.dark,
        ),
        sized: false,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: CustomInkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/icons/ic_back.png",
                  scale: 2,
                ),
              ),
            ),
            title: CustomText(
              title: "Add Service",
              fontSize: 18,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: Consumer<AuthProvider>(builder: (context, authProvider, child) {
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 50,
                    ),
                    //service name
                    Container(
                      padding: kHrPadding,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "service name",
                            fontSize: 15,
                            color: blackColor,
                          ),
                          //Space
                          SizedBox(
                            height: Helper.setHeight(context) * 0.10 - 70,
                          ),
                          CustomTextField(
                            controller: serviceNameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            autofillHints: [AutofillHints.name],
                            onChanged: (_) {},
                            validation: firstNameField,
                            hintText: "service name",
                            isUnderlineInputBorder: true,
                            isOutlineInputBorder: false,
                            contentPaddingLeft: 5,
                          )
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 50,
                    ),
                    //price
                    Container(
                      padding: kHrPadding,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "price",
                            fontSize: 15,
                            color: blackColor,
                          ),
                          //Space
                          SizedBox(
                            height: Helper.setHeight(context) * 0.10 - 70,
                          ),
                          CustomTextField(
                            controller: priceController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            autofillHints: [AutofillHints.email],
                            onChanged: (_) {},
                            validation: priceField,
                            hintText: "price",
                            isUnderlineInputBorder: true,
                            isOutlineInputBorder: false,
                            contentPaddingLeft: 5,
                          )
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 50,
                    ),
                    //category
                    Container(
                      padding: kHrPadding,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "category",
                            fontSize: 15,
                            color: blackColor,
                          ),
                          const SizedBox(height: 25,),
                          DropdownButtonFormField<String>(
                            onChanged: categoryChanged,
                            value: category,
                            hint: const Text('No Category',style: TextStyle(color: Colors.black),),
                            decoration: const InputDecoration(
                              filled: true,
                              //border: InputBorder.none,
                            ),
                            items: catProvider.categoriesMap.values.map<DropdownMenuItem<String>>((String? value) {
                              return DropdownMenuItem<String>(
                                child: Text(value!),
                                value: value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 50,
                    ),
                    //service location
                    Container(
                      padding: kHrPadding,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "service location",
                            fontSize: 15,
                            color: blackColor,
                          ),
                          Card(child: buildCity(),),
                        ],
                      ),
                    ),
                    SizedBox(height: Helper.setHeight(context) * 0.03 + 10),
                    //Sign up
                    Consumer<AddServiceProvider>(
                      builder: (context, provider, child) => Container(
                        padding: kHrPadding,
                        child: CustomButton(
                          onPressed: () async {
                            if(formKey.currentState!.validate() && city?.id != null && category != null){
                              await provider.addService(
                                name: serviceNameController.text,
                                categoryId: catProvider.getCategoryId(category)!,
                                subCategoryId: 5,
                                price: priceController.text.toString(),
                                cityId: city!.id!,
                              );
                              if(provider.addServiceModel?.message?.isNotEmpty?? false) {
                                print(provider.addServiceModel?.message!);
                                showToast(text: provider.addServiceModel?.message??'');
                                Helper.toRemoveUntiScreen(context, HomePage());
                              } else {
                                showToast(text: 'Please try again');
                              }
                            } else if(city?.id == null){
                              showToast(text: 'Please select a location');
                            } else if(category == null){
                              showToast(text: 'Please select a category');
                            } else {
                              showToast(text: 'Please try again');
                            }
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
                    ),
                    //Space
                    SizedBox(
                      height: Helper.setHeight(context) * 0.10 - 40,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void categoryChanged(String? val) {
    setState((){
      category = val!;
      print(category);
    });
  }

  Widget buildCity() {
    // ignore: prefer_function_declarations_over_variables
    final onTap = () async {
      final provider = Provider.of<CityProvider>(context, listen: false);
      await provider.getCities();
      final city = await Navigator.push(context, MaterialPageRoute(builder: (context) => const CityScreen()),
      );

      if (city == null) return;

      setState(() => this.city = city);
    };

    return buildCityPicker(
      child: city == null
          ? buildListTile(title: 'No Location', onTap: onTap)
          : buildListTile(
        title: city!.name!,
        onTap: onTap,
      ),
    );
  }

  Widget buildListTile({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
      trailing: Icon(Icons.arrow_drop_down, color: Colors.black),
    );
  }

  Widget buildCityPicker({
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select City',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Card(margin: EdgeInsets.zero, child: child),
        ],
      );
}
