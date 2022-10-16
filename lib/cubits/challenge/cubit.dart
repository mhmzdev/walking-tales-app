import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
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
      final data = repo.fetch();
      data.listen((event) {
        final docs = event.docs;
        final challenges = List.generate(
          docs.length,
          (index) => Challenge.fromMap(
            docs[index].data(),
          ),
        );
        emit(state.copyWith(
          fetch: ChallengeFetchSuccess(data: challenges),
        ));
      }, onDone: () {
        emit(state.copyWith(
          fetch: ChallengeFetchSuccess(data: state.fetch?.data),
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        fetch: ChallengeFetchFailed(message: e.toString()),
      ));
    }
  }

  Future<void> add(Challenge challenge) async {
    emit(state.copyWith(
      add: const ChallengeAddLoading(),
    ));
    try {
      await repo.add(challenge);

      emit(state.copyWith(
        add: const ChallengeAddSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        add: ChallengeAddFailed(message: e.toString()),
      ));
    }
  }
}



// end-cubit
