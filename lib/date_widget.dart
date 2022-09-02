import 'package:flutter/material.dart';

class DateWidget extends StatefulWidget {
   DateWidget(this.selectedDate,this.onDateSelected);
   DateTime selectedDate;
   Function(DateTime dateTime) onDateSelected;

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showDatePickerDialog();
      },
      child: Container(
          padding: EdgeInsets.all(12),
          // how to format datetime in dart -> intl
          //"yyyy/MM/dd"
          child: Text('${widget.selectedDate.year}/${widget.selectedDate.month}/${widget.selectedDate.day}',
            style: Theme.of(context).textTheme.bodyMedium!
                .copyWith(color:Colors.grey ),
            textAlign: TextAlign.center,
          )),
    );
  }
  void showDatePickerDialog()async{
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: widget.selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if(dateTime!=null){
      setState(() {
        widget.selectedDate = dateTime;
        widget.onDateSelected(dateTime);
      });
    }
  }
}
