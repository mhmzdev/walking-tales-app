import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:walking_tales/models/diet.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class DietCubit extends Cubit<DietState> {
  static DietCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<DietCubit>(context, listen: listen);

  DietCubit() : super(DietDefault());

  final repo = DietRepository();

  Future<void> fetch(int age, double h, double w) async {
    emit(const DietFetchLoading());
    try {
      final data = await repo.fetch(age, h, w);

      emit(DietFetchSuccess(data: data));
    } catch (e) {
      emit(DietFetchFailed(message: e.toString()));
    }
  }
}
