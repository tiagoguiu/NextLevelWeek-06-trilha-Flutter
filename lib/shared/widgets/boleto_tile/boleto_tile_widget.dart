import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import '../../models/boleto_model.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel data;
  const BoletoTileWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.name!,
          style: TextStyles.titleListTile,
        ),
        subtitle: Text("Vence em ${data.dueDate}"),
        trailing: Text.rich(
            TextSpan(text: "R\$", style: TextStyles.trailingRegular, children: [
          TextSpan(
            text: "${data.value!.toStringAsFixed(2)}",
            style: TextStyles.trailingBold,
          )
        ])),
      ),
    );
  }
}
