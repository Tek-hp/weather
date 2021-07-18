import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/baseview_model.dart';
import 'package:weather_app/di.dart';
import 'package:weather_app/helper_widget/touch_repel.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  /// Provides a builder function that will build/re-build the widget/screen
  final Widget Function(BuildContext ctx, T model, Widget child) builder;

  /// This method will be called as soon as model is ready
  final Function(T model) onModelReady;

  /// You can put logics for initState here.
  final Function(T model) initState;

  /// Weather to dispose view model once removed from router stack.
  /// default: True
  final bool disposeViewModel;

  /// You can put disposal logics here.
  final Function(T model) onDispose;

  /// If [true], it will wrap the child in TouchRepeal widget which will hide
  /// softkey when pressed outside textfield.
  final bool enableTouchRepeal;

  BaseView({
    @required this.builder,
    this.onModelReady,
    this.initState,
    this.disposeViewModel = true,
    this.onDispose,
    this.enableTouchRepeal = false,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model;

  @override
  void initState() {
    if (model == null) {
      _createViewModel();
    }

    super.initState();
  }

  _createViewModel() {
    model = locator<T>();

    if (widget.initState != null) {
      if (model.onModelReadyCalled) {
        widget.initState(model);
      }
    }

    if (widget.onModelReady != null) {
      if (!widget.disposeViewModel && !model.onModelReadyCalled) {
        widget.onModelReady(model);
        model.setOnModelReadyCalled(true);
      } else if (widget.disposeViewModel) {
        widget.onModelReady(model);
      }
    }
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose(model);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.enableTouchRepeal) {
      if (!widget.disposeViewModel) {
        return ChangeNotifierProvider.value(
          value: model,
          child: Consumer<T>(
            builder: (context, value, child) => TouchRepeal(
              child: widget.builder(context, value, child),
            ),
            child: null,
          ),
        );
      }

      return ChangeNotifierProvider(
        create: (context) => model,
        child: Consumer<T>(
          builder: (context, value, child) => TouchRepeal(
            child: widget.builder(context, value, child),
          ),
        ),
      );
    }

    if (!widget.disposeViewModel) {
      return ChangeNotifierProvider.value(
        value: model,
        child: Consumer<T>(
          builder: widget.builder,
          child: null,
        ),
      );
    }

    return ChangeNotifierProvider(
      create: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
