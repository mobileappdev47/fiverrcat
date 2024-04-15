
import 'package:flutter/material.dart';
import 'package:pokercat/constant.dart';
import 'package:pokercat/pages/app_settings_screen/income_category_settings/app_default.dart';
import 'package:pokercat/pages/app_settings_screen/income_category_settings/income_category_provider.dart';

import '../../../addexpense/db/functions/category_functions.dart';
import '../../../addexpense/db/models/category/category_model_db.dart';


class IncomeCategoryList extends StatefulWidget {
  const IncomeCategoryList({super.key});

  @override
  State<IncomeCategoryList> createState() => _IncomeCategoryListState();
}

class _IncomeCategoryListState extends State<IncomeCategoryList> {
  TextEditingController incomeCategoryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late CategoryModel categoryIncomeModel;
  bool? defaultFlag = true;
  bool textFeildEdit = false;
  List<CategoryModel> selectedIncomeCategory = [];

  @override
  Widget build(BuildContext context) {
    CategoryDB().getAllCategory();
    final double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = 9;
    if (screenWidth > 350) {
      fontSize = 16;
    }
    return Scaffold(
      backgroundColor: AppTheme.pcScafoldColor,
      appBar: AppBar(
        backgroundColor: AppTheme.pcScafoldColor,
        title: const Text('Income Category', style: TextStyle(fontSize: 18)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(children: <Widget>[
                        const SizedBox(
                            width: 80,
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text('Name ',
                                    style: TextStyle(
                                        color: AppTheme.pcTextTertiaryColor)))),
                        Expanded(
                            child: TextFormField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                keyboardType: TextInputType.text,
                                maxLength: 14,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Required Feild';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: incomeCategoryController,
                                cursorColor: AppTheme.pcTextSecondayColor,
                                style: const TextStyle(
                                    color: AppTheme.pcTextSecondayColor),
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppTheme.pcTabBarSelectorColor))),
                                readOnly: false))
                      ]),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.pcTextPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  textStyle: const TextStyle(fontSize: 16),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 25)),
                              onPressed: () {
                                if (textFeildEdit == false) {
                                  if (_formKey.currentState!.validate()) {
                                    IncomeCategoryProvider()
                                        .onAddIncomeCategorySavedButton(
                                            incomeCategoryController);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            duration: Duration(seconds: 2),
                                            elevation: 2,
                                            behavior: SnackBarBehavior.floating,
                                            padding: EdgeInsets.all(15),
                                            backgroundColor:
                                                AppTheme.pcAppBarColor,
                                            content: Text('Saved',
                                                style: TextStyle(
                                                    color: Colors.white))));
                                  }
                                } else if (textFeildEdit == true) {
                                  categoryIncomeModel.name =
                                      incomeCategoryController.text;
                                  IncomeCategoryProvider().editCategoryDetails(
                                      categoryIncomeModel,
                                      incomeCategoryController);
                                  textFeildEdit = false;
                                  incomeCategoryController.clear();
                                }
                              },
                              child: Text(' Save ',
                                  style: TextStyle(
                                      color: AppTheme.pcTextSecondayColor,
                                      fontSize: fontSize))),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.pcTransactionColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  textStyle: const TextStyle(fontSize: 16),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 25)),
                              onPressed: () {
                                textFeildEdit = false;
                                incomeCategoryController.clear();
                              },
                              child: Text('Clear',
                                  style: TextStyle(
                                      color: AppTheme.pcTextSecondayColor,
                                      fontSize: fontSize))),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.pcTransactionColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  textStyle: const TextStyle(fontSize: 16),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 25)),
                              onPressed: () {
                                defaultFlag = true;
                                IncomeCategoryProvider().addDefaultCategory(
                                    AppDefaultIncomeCategory()
                                        .appDefaultIncomeCategory);
                                CategoryDB().getAllCategory();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        duration: Duration(seconds: 2),
                                        elevation: 2,
                                        behavior: SnackBarBehavior.floating,
                                        padding: EdgeInsets.all(15),
                                        backgroundColor: AppTheme.pcAppBarColor,
                                        content: Text('Updated.',
                                            style: TextStyle(
                                                color: Colors.white))));
                              },
                              child: Text('Default',
                                  style: TextStyle(
                                      color: AppTheme.pcTextSecondayColor,
                                      fontSize: fontSize)))
                        ],
                      ),
                      const SizedBox(height: 35),
                      const Divider(
                          thickness: 3, color: AppTheme.pcSecondaryDividerColor)
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: CategoryDB().incomeCategoryNotifier,
                builder: (BuildContext ctx,
                    List<CategoryModel> incomeCategoryList, Widget? child) {
                  final filterdList = incomeCategoryList
                      .where(
                          (model) => model.categoryType == CategoryType.income)
                      .toList();
                  return filterdList.isNotEmpty
                      ? ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            final data = filterdList[index];
                            return Row(
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    height: 40,
                                    child: Text(data.name,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color:
                                                AppTheme.pcTextSecondayColor))),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        textFeildEdit = true;
                                        incomeCategoryController =
                                            TextEditingController(
                                                text: data.name);
                                      });
                                      categoryIncomeModel = data;
                                    },
                                    icon: const Icon(Icons.edit_outlined,
                                        color: AppTheme.pcTextTertiaryColor)),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        filterdList[index].isDeleted =
                                            !filterdList[index].isDeleted;
                                        if (filterdList[index].isDeleted ==
                                            true) {
                                          selectedIncomeCategory.add(
                                              CategoryModel(
                                                  id: data.id,
                                                  name: data.name,
                                                  categoryType:
                                                      data.categoryType,
                                                  isDeleted: true));
                                        } else if (filterdList[index]
                                                .isDeleted ==
                                            false) {
                                          selectedIncomeCategory.removeWhere(
                                              (element) =>
                                                  element.id ==
                                                  filterdList[index].id);
                                        }
                                      });
                                    },
                                    icon: data.isDeleted
                                        ? const Icon(Icons.check_circle_rounded,
                                            color:
                                                AppTheme.pcTabBarSelectorColor)
                                        : const Icon(Icons.dangerous_outlined,
                                            color:
                                                AppTheme.pcTextTertiaryColor))
                              ],
                            );
                          },
                          separatorBuilder: (ctx, index) {
                            return const Divider(
                                thickness: 1,
                                color: AppTheme.pcSecondaryDividerColor);
                          },
                          itemCount: filterdList.length)
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    const Text(
                                        "Please add a new category or click the 'Default Categories' button to add default categories.",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey)),
                                    const SizedBox(height: 25),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: AppTheme.pcBottomNavigatorSelectorColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            textStyle:
                                                const TextStyle(fontSize: 16),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 25)),
                                        onPressed: () {
                                          defaultFlag = true;
                                          if (defaultFlag == true) {
                                            IncomeCategoryProvider()
                                                .addDefaultCategory(AppDefaultIncomeCategory()
                                                        .appDefaultIncomeCategory);
                                            defaultFlag = false;
                                          }
                                          CategoryDB().getAllCategory();
                                        },
                                        child: const Text('Default Categories',
                                            style: TextStyle(
                                                color: AppTheme.pcTextSecondayColor)))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                },
              ),
            ),
            selectedIncomeCategory.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.pcTextPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            textStyle: const TextStyle(fontSize: 16),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25)),
                        onPressed: () {
                          deleteDialog();
                        },
                        child: Text('Delete (${selectedIncomeCategory.length})',
                            style: const TextStyle(
                                color: AppTheme.pcTextSecondayColor))))
                : Container()
          ],
        ),
      ),
    );
  }

  deleteDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: AppTheme.pcWaveColor,
          title: const Text('Do you want to delete ?',
              style: TextStyle(
                  color: AppTheme.pcTextQuaternaryColor,
                  fontWeight: FontWeight.bold)),
          content: const Text(
              'All the releted datas will be cleared from the database!'),
          actions: [
            TextButton(
                onPressed: () {
                  for (var category in selectedIncomeCategory) {
                    CategoryDB().deleteCategory(category.id!);
                    setState(() {
                      selectedIncomeCategory = [];
                    });
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Yes',
                    style: TextStyle(
                        color: AppTheme.pcTextQuaternaryColor,
                        fontWeight: FontWeight.bold))),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No',
                    style: TextStyle(
                        color: AppTheme.pcTextQuaternaryColor,
                        fontWeight: FontWeight.bold)))
          ],
        );
      },
    );
  }
}
