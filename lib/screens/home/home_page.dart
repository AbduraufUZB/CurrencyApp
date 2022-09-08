import 'package:currencyapp/screens/home/home_cubit.dart';
import 'package:currencyapp/screens/home/home_state.dart';
import 'package:currencyapp/widgets/currency_item_card.dart';
import 'package:currencyapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (ctx, state) {
            if (state is HomeError) {
              return Center(
                child: Text(
                  state.error,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              );
            } else if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is HomeLoaded) {
              return Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Total price",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                              Icon(Icons.mark_chat_unread_rounded,
                                  color: Colors.grey)
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(children: [
                            Text(
                                "\$ ${state.currencyModel.last.cbPrice!.split(".")[0]}.",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 40)),
                            Text(
                                state.currencyModel.last.cbPrice!.split(".")[1],
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 40))
                          ]),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "+ \$ ${state.currencyModel.last.cbPrice!.split(".")[0]}.",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                "${state.currencyModel.last.cbPrice!.split(".")[1]}   ",
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 20),
                              ),
                              const Text(
                                "4.28% ",
                                style: TextStyle(
                                    color: Colors.greenAccent, fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                color: Colors.white,
                                text: "Buy",
                                textColor: Colors.black,
                              ),
                              CustomButton(
                                color: Colors.white.withOpacity(0.6),
                                text: "Sell",
                                textColor: Colors.white,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Center(
                            child: Container(
                              height: 5,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text("My portfolios",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.52,
                            child: ListView.builder(
                              itemCount: state.currencyModel.length,
                              itemBuilder: (ctx, i) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CurrencyItemCard(currencyModel: state.currencyModel[i]),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const Center(
                child: Text(
                  "Xato Bor",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
