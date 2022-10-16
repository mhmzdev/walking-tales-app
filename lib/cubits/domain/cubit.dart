import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class DomainCubit extends Cubit<DomainState> {
  static DomainCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<DomainCubit>(context, listen: listen);

  DomainCubit() : super(DomainDefault());

  final repo = DomainRepository();

  Future<void> fetch() async {
    emit(const DomainFetchLoading());
    try {
      final raw = repo.fetch();
      raw.listen(
        (event) {
          final list = event.data()?['domains'] as List;
          final data = List<String>.from(list);
          emit(DomainFetchSuccess(data: data));
        },
        onDone: () {
          emit(DomainFetchSuccess(data: state.data));
        },
      );
    } catch (e) {
      emit(DomainFetchFailed(message: e.toString()));
    }
  }
}
