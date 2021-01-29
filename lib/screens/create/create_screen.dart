import 'package:artisan/components/customdrawer/custom_drawer.dart';
import 'package:artisan/components/customdrawer/custom_drawer_header.dart';
import 'package:artisan/components/customtextfield/custom_text_field.dart';
import 'package:artisan/stores/create_store.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/images_field.dart';

class CreateScreen extends StatelessWidget {
  final CreateStore createStore = CreateStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Criar Anúncio'),
        centerTitle: true,
      ),
      body: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 16,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImagesField(createStore),
              CustomTextField(
                labelText: "Título *",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                labelText: "Descrição *",
                maxLines: null,
                textInputType: TextInputType.multiline,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                labelText: "Preço *",
                prefixText: 'R\$',
                textInputType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RealInputFormatter(centavos: true)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                labelText: "Título *",
              )
            ],
          ),
        ),
      ),
    );
  }
}
