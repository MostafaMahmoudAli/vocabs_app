import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/custom_floating_action_button.dart';
import '../widgets/add_word_dialog.dart';
import '../widgets/filter_dialog_button.dart';
import '../widgets/lang_filter_widget.dart';
import '../widgets/words_widget.dart';

class LayOutScreen extends StatelessWidget {
  const LayOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton:
      CustomFloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder:(context)=>AddWordDialog(),
        ),
      ),
      body: Padding(
        padding:  EdgeInsetsDirectional.symmetric(
          horizontal:10.0.w,
          vertical:10.0.h
        ),
        child:  Column(
          children:
          [
           const Row(
             children: [
               LanguageFilterWidget(),
               Spacer(),
               FilterDialogButton(),
             ],
           ),
            SizedBox(
              height:15.0.h,
            ),
            const WordsWidget(),
          ],
        ),
      ),
    );
  }
}
