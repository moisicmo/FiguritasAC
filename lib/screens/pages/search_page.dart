
import 'package:FiguritasAC/components/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InputComponent(
            controllerText: searchCtrl,
            labelText:'Buscar Pais/Sección',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            textCapitalization: TextCapitalization.characters ,
            inputFormatters: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))],
            onEditingComplete:() {
              
            },
            validator:(s){}
          )
        ],
      ),
    );
  }
}
