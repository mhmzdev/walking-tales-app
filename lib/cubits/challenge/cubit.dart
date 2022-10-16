import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:walking_tales/models/challenge.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'mocks.dart';
part 'state.dart';

class ChallengeCubit extends Cubit<ChallengeState> {
  static ChallengeCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<ChallengeCubit>(context, listen: listen);

  ChallengeCubit() : super(const ChallengeStateDefault());

  final repo = ChallengeRepository();

  Future<void> fetch() async {
    emit(state.copyWith(
      fetch: const ChallengeFetchLoading(),
    ));
    try {
      final data = await repo.fetch();
      emit(state.copyWith(
        fetch: ChallengeFetchSuccess(data: data),
      ));
    } catch (e) {
      emit(state.copyWith(
        fetch: ChallengeFetchFailed(message: e.toString()),
      ));
    }
  }
}
// end-cubit
