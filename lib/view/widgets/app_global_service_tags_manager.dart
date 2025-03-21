import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/model/service_model.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppGlobalServiceTagsManager extends StatefulWidget {
  final String? helpText;
  final String? hintText;
  final List<ServiceModel> services;
  final List<ServiceModel> initialSelected;
  final void Function(List<ServiceModel>)? onChanged;

  const AppGlobalServiceTagsManager({
    super.key,
    this.helpText,
    this.hintText,
    required this.services,
    this.initialSelected = const [],
    this.onChanged,
  });

  @override
  State<AppGlobalServiceTagsManager> createState() =>
      _AppGlobalServiceTagsManagerState();
}

class _AppGlobalServiceTagsManagerState
    extends State<AppGlobalServiceTagsManager> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late List<ServiceModel> _selectedServices;

  @override
  void initState() {
    super.initState();
    _selectedServices = List.from(widget.initialSelected);

    _focusNode.addListener(() {
      if (_focusNode.hasFocus && _textController.text.isEmpty) {
        _textController.text = ' ';
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted) _textController.clear();
        });
      }
    });
  }

  void _addService(ServiceModel service) {
    if (!_selectedServices.any((s) => s.id == service.id)) {
      setState(() => _selectedServices.add(service));
      _textController.clear();
      _notifyChange();
    }
  }

  void _removeService(ServiceModel service) {
    setState(() => _selectedServices.removeWhere((s) => s.id == service.id));
    _notifyChange();
  }

  void _notifyChange() {
    widget.onChanged?.call(_selectedServices);
  }

  List<ServiceModel> _filterServices(String query) {
    return widget.services
        .where((s) =>
            s.label!.toLowerCase().contains(query.toLowerCase()) &&
            !_selectedServices.any((selected) => selected.id == s.id))
        .toList();
  }

  Widget _buildSelectedTags() {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: _selectedServices
          .map(
            (service) => Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.only(
                right: 6,
              ),
              height: 30.px,
              decoration: BoxDecoration(
                color: primary500,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: primary500),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    service.label!,
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => _removeService(service),
                    child: Icon(
                      Icons.close,
                      size: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildAutocompleteField() {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 50.w, maxWidth: 50.w),
      child: RawAutocomplete<ServiceModel>(
        textEditingController: _textController,
        focusNode: _focusNode,
        optionsBuilder: (TextEditingValue value) {
          final query = value.text.trim();
          return query.isEmpty
              ? const Iterable<ServiceModel>.empty()
              : _filterServices(query);
        },
        displayStringForOption: (ServiceModel option) => option.label ?? '',
        fieldViewBuilder: (context, controller, focusNode, onSubmitted) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 6),
              hintText: widget.hintText ?? '',
              border: InputBorder.none,
              hintStyle: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: primaryBorder,
              ),
            ),
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: primary950,
            ),
          );
        },
        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4,
              child: Container(
                width: 80.w,
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options.elementAt(index);
                    return ListTile(
                      title: Text(option.label ?? ''),
                      onTap: () => onSelected(option),
                    );
                  },
                ),
              ),
            ),
          );
        },
        onSelected: _addService,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.helpText != null)
          Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: AppGlobalText(
              text: widget.helpText!,
              style: TextStyleEnum.h3_bold,
              color: primary950,
            ),
          ),
        Container(
          width: 80.w,
          padding: const EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffAFBACA)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_selectedServices.isNotEmpty) _buildSelectedTags(),
                _buildAutocompleteField(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
