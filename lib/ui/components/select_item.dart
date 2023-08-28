// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/ui/components/panel.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:portfolio/core/common/constants/app_colors.dart';

class SelectItemItem {
  final String title;
  final Function() onTap;
  final double fontSize;

  SelectItemItem({
    required this.title,
    required this.onTap,
    this.fontSize = 14,
  });
}

class SelectItem extends StatelessWidget {
  const SelectItem({
    super.key,
    required this.itens,
    this.index,
    this.itemsVisible = 2,
  });

  final List<SelectItemItem> itens;
  final int? index;
  final double itemsVisible;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final Duration anitionDuration = 200.ms;
    bool selected(SelectItemItem item) => index == itens.indexOf(item);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Panel(
          padding: EdgeInsets.zero,
          child: SingleChildScrollView(
            controller: scrollController,
            // physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Stack(
              children: [
                if (index != null)
                  AnimatedContainer(
                    duration: anitionDuration,
                    curve: Curves.fastOutSlowIn,
                    width: (constraints.maxWidth / itemsVisible),
                    padding: const EdgeInsets.all(20),
                    color: AppColors.green_700,
                    height: constraints.maxHeight < 1000 ? constraints.maxHeight : null,
                    margin: EdgeInsets.only(
                      left: (constraints.maxWidth / itemsVisible) * index!,
                    ),
                    child: const Text(''),
                  ),
                Row(
                  children: [
                    ...itens
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              Vibrate.feedback(FeedbackType.light);
                              e.onTap.call();
                            },
                            child: AnimatedContainer(
                              duration: anitionDuration,
                              padding: const EdgeInsets.all(20),
                              width: constraints.maxWidth / itemsVisible,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: AutoSizeText(
                                e.title.toUpperCase(),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: selected(e) ? AppColors.white : AppColors.green_700.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
