import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:walking_tales/models/stats.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class UserStatsCubit extends Cubit<UserStatsState> {
  static UserStatsCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<UserStatsCubit>(context, listen: listen);

  UserStatsCubit() : super(UserStatsDefault());

  final repo = UserStatsRepository();

  Future<void> fetch() async {
    emit(const UserStatsFetchLoading());
    try {
      List<Stats> all = [];

      final data = repo.fetch();
      data.listen(
        (event) {
          final raw = event.docs;
          int totalSteps = 0;
          int totalCaloriesBurned = 0;
          double averageSpeed = 0;
          double totalDistanceCovered = 0;
          final List<Stats> auctions = List.generate(raw.length, (index) {
            totalSteps +=
                (raw[index].data() as dynamic)["userStepCount"] as int;
            totalCaloriesBurned +=
                (raw[index].data() as dynamic)["caloriesBurned"] as int;
            averageSpeed += (raw[index].data() as dynamic)["speed"] as double;
            totalDistanceCovered +=
                (raw[index].data() as dynamic)["distanceTraveled"] as double;
            return Stats.fromMap(
              raw[index].data(),
            );
          });

          all = List.from(auctions);
          averageSpeed = averageSpeed / all.length;

          emit(
            UserStatsFetchSuccess(
                data: all,
                totalCaloriesBurned: totalCaloriesBurned,
                averageSpeed: averageSpeed,
                totalSteps: totalSteps,
                distanceTraveled: totalDistanceCovered),
          );
        },
        onDone: () {
          emit(UserStatsFetchSuccess(
              data: state.data,
              totalCaloriesBurned: state.totalCaloriesBurned,
              averageSpeed: state.averageSpeed,
              totalSteps: state.totalSteps,
              distanceTraveled: state.distanceTraveled));
        },
        onError: (err, stk) {
          emit(
            UserStatsFetchFailed(message: err.toString()),
          );
        },
      );
    } catch (e) {
      emit(UserStatsFetchFailed(message: e.toString()));
    }
  }

  Future<void> submitStats(Stats stats) async {
    await repo.submitStats(stats);
  }
}
