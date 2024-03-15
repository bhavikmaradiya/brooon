import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './suggestions_box.dart';
import './suggestions_box_decoration.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../typedef.dart';

class SuggestionsList<T> extends StatefulWidget {
  final SuggestionsBox? suggestionsBox;
  final TextEditingController? controller;
  final bool getImmediateSuggestions;
  final SuggestionSelectionCallback<T>? onSuggestionSelected;
  final SuggestionsCallback<T>? suggestionsCallback;
  final ItemBuilder<T>? itemBuilder;
  final SuggestionsBoxDecoration? decoration;
  final Duration? debounceDuration;
  final WidgetBuilder? loadingBuilder;
  final WidgetBuilder? noItemsFoundBuilder;
  final ErrorBuilder? errorBuilder;
  final AnimationTransitionBuilder? transitionBuilder;
  final Duration? animationDuration;
  final double? animationStart;
  final AxisDirection? direction;
  final bool? hideOnLoading;
  final bool? hideOnEmpty;
  final bool? hideOnError;
  final bool? keepSuggestionsOnLoading;
  final int? minCharsForSuggestions;
  final bool hideKeyboardOnDrag;

  SuggestionsList({
    required this.suggestionsBox,
    this.controller,
    this.getImmediateSuggestions = false,
    this.onSuggestionSelected,
    this.suggestionsCallback,
    this.itemBuilder,
    this.decoration,
    this.debounceDuration,
    this.loadingBuilder,
    this.noItemsFoundBuilder,
    this.errorBuilder,
    this.transitionBuilder,
    this.animationDuration,
    this.animationStart,
    this.direction,
    this.hideOnLoading,
    this.hideOnEmpty,
    this.hideOnError,
    this.keepSuggestionsOnLoading,
    this.minCharsForSuggestions,
    this.hideKeyboardOnDrag = false,
  });

  @override
  _SuggestionsListState<T> createState() =>
      _SuggestionsListState<T>();
}

class _SuggestionsListState<T>
    extends State<SuggestionsList<T>>
    with SingleTickerProviderStateMixin {
  Iterable<T>? _suggestions;
  late bool _suggestionsValid;
  late VoidCallback _controllerListener;
  Timer? _debounceTimer;
  bool? _isLoading, _isQueued;
  Object? _error;
  String? _lastTextValue;

  @override
  void didUpdateWidget(SuggestionsList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _getSuggestions();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getSuggestions();
  }

  @override
  void initState() {
    super.initState();
    this._suggestionsValid = widget.minCharsForSuggestions! > 0 ? true : false;
    this._isLoading = false;
    this._isQueued = false;
    this._lastTextValue = widget.controller!.text;

    if (widget.getImmediateSuggestions) {
      this._getSuggestions();
    }

    this._controllerListener = () {
      // If we came here because of a change in selected text, not because of
      // actual change in text
      if (widget.controller!.text == this._lastTextValue) return;

      this._lastTextValue = widget.controller!.text;

      this._debounceTimer?.cancel();
      if (widget.controller!.text.length < widget.minCharsForSuggestions!) {
        if (mounted) {
          setState(() {
            _isLoading = false;
            _suggestions = null;
            _suggestionsValid = true;
          });
        }
        return;
      } else {
        this._debounceTimer = Timer(widget.debounceDuration!, () async {
          if (this._debounceTimer!.isActive) return;
          if (_isLoading!) {
            _isQueued = true;
            return;
          }

          await this.invalidateSuggestions();
          while (_isQueued!) {
            _isQueued = false;
            await this.invalidateSuggestions();
          }
        });
      }
    };

    widget.controller!.addListener(this._controllerListener);
  }

  Future<void> invalidateSuggestions() async {
    _suggestionsValid = false;
    _getSuggestions();
  }

  Future<void> _getSuggestions() async {
    if (_suggestionsValid) return;
    _suggestionsValid = true;

    if (mounted) {
      setState(() {
        this._isLoading = true;
        this._error = null;
      });

      Iterable<T>? suggestions;
      Object? error;

      try {
        suggestions =
            await widget.suggestionsCallback!(widget.controller!.text);
      } catch (e) {
        error = e;
      }

      if (this.mounted) {
        // if it wasn't removed in the meantime
        setState(() {
          double? animationStart = widget.animationStart;
          // allow suggestionsCallback to return null and not throw error here
          if (error != null || suggestions?.isEmpty == true) {
            animationStart = 1.0;
          }
          this._error = error;
          this._isLoading = false;
          this._suggestions = suggestions;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEmpty =
        this._suggestions?.length == 0 && widget.controller!.text == "";
    if ((this._suggestions == null || isEmpty) && this._isLoading == false)
      return Container();

    Widget child;
    if (this._isLoading!) {
      if (widget.hideOnLoading!) {
        child = Container(height: 0);
      } else {
        child = createLoadingWidget();
      }
    } else if (this._error != null) {
      if (widget.hideOnError!) {
        child = Container(height: 0);
      } else {
        child = createErrorWidget();
      }
    } else if (this._suggestions!.isEmpty) {
      if (widget.hideOnEmpty!) {
        child = Container(height: 0);
      } else {
        child = createNoItemsFoundWidget();
      }
    } else {
      child = createSuggestionsWidget();
    }

    BoxConstraints constraints;
    if (widget.decoration!.constraints == null) {
      constraints = BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.3,
      );
    } else {
      double maxHeight = MediaQuery.of(context).size.height * 0.3;
      constraints = widget.decoration!.constraints!.copyWith(
        minHeight: min(widget.decoration!.constraints!.minHeight, maxHeight),
        maxHeight: maxHeight,
      );
    }

    return ConstrainedBox(
      constraints: constraints,
      child: child,
    );
  }

  Widget createLoadingWidget() {
    Widget child;

    if (widget.keepSuggestionsOnLoading! && this._suggestions != null) {
      if (this._suggestions!.isEmpty) {
        child = createNoItemsFoundWidget();
      } else {
        child = createSuggestionsWidget();
      }
    } else {
      child = widget.loadingBuilder != null
          ? widget.loadingBuilder!(context)
          : Container(
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                border: Border.all(
                  color: CupertinoColors.extraLightBackgroundGray,
                  width: 1.0,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CupertinoActivityIndicator(),
                ),
              ),
            );
    }

    return child;
  }

  Widget createErrorWidget() {
    return widget.errorBuilder != null
        ? widget.errorBuilder!(context, this._error)
        : Container(
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              border: Border.all(
                color: CupertinoColors.extraLightBackgroundGray,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Error: ${this._error}',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: CupertinoColors.destructiveRed,
                  fontSize: 18.0,
                ),
              ),
            ),
          );
  }

  Widget createNoItemsFoundWidget() {
    return widget.noItemsFoundBuilder != null
        ? widget.noItemsFoundBuilder!(context)
        : SizedBox();
  }

  Widget createSuggestionsWidget() {
    Widget child = Container(
      decoration: BoxDecoration(
        color: widget.decoration!.color != null
            ? widget.decoration!.color
            : CupertinoColors.white,
        boxShadow: [
          new BoxShadow(
            color: StaticFunctions.getColor(
              context,
              ColorEnum.shadowColor,
            ),
            blurRadius: 1,
            blurStyle: BlurStyle.outer,
          ),
        ],
        border: widget.decoration!.border != null
            ? widget.decoration!.border
            : Border.all(
                color: CupertinoColors.extraLightBackgroundGray,
                width: 1.0,
              ),
        borderRadius: widget.decoration!.borderRadius != null
            ? widget.decoration!.borderRadius
            : null,
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context)
            .copyWith(scrollbars: false, overscroll: false),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          primary: false,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: this._suggestions!.length,
          keyboardDismissBehavior: widget.hideKeyboardOnDrag
              ? ScrollViewKeyboardDismissBehavior.onDrag
              : ScrollViewKeyboardDismissBehavior.manual,
          reverse: widget.suggestionsBox!.direction == AxisDirection.down
              ? false
              : widget.suggestionsBox!.autoFlipListDirection,
          itemBuilder: (context, index) {
            final current = this._suggestions!.toList()[index];
            return Material(
              color: Colors.transparent,
              child: InkWell(
                child: widget.itemBuilder!(
                    context,
                    current,
                    this._suggestions!.length > 1 &&
                        this._suggestions!.length - 1 != index),
                onTap: () {
                  widget.onSuggestionSelected!(current);
                },
              ),
            );
          },
        ),
      ),
    );

    if (widget.decoration!.hasScrollbar) {
      child = CupertinoScrollbar(child: child);
    }

    return child;
  }
}
