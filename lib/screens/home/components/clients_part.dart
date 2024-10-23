import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../bloc/bloc.dart';
import '../../../core/core.dart';
import '../../../provider/ordering_provider.dart';
import 'clients_part/six_client_button.dart';

class ClientsPart extends StatefulWidget {
  const ClientsPart({super.key});
  @override
  State<ClientsPart> createState() => _ClientsPartState();
}

class _ClientsPartState extends State<ClientsPart> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final orderingProvider = Provider.of<OrderingProvider>(context);
    final sixClient4List = orderingProvider.getSixClient4List;
    final selectedClientIndex = orderingProvider.getSelectedIndex;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.sp),
      child: BlocBuilder<ClientBloc, ClientState>(
        builder: (context, state) {
          return SizedBox(
            height: 50.w,
            width: MediaQuery.of(context).size.width * 1,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              orderingProvider.getSixClient4List.length > 4
                  ? const SizedBox(width: 0, height: 0)
                  : InkWell(
                      borderRadius: BorderRadius.circular(10.r),
                      onTap: () {
                        orderingProvider.addClient();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 0.sp),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.07),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.sp, horizontal: 15.sp),
                            child: Text(
                              "+ Qo’shish",
                              style: AppTextStyle.regular(
                                  color: AppColors.primary),
                            ),
                          ),
                        ),
                      ),
                    ),
              sixClient4List.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemCount: sixClient4List.length,
                      itemBuilder: (context, index) {
                        final client = sixClient4List[index];
                        return SixClientsButton(
                          isSelected: selectedClientIndex == index,
                          clientNumber: client.clientNumber,
                          onPressed: () {
                            orderingProvider.selectClient(index);
                          },
                        );
                      })
                  : const SizedBox(),
            ]),
          );
        },
      ),
    );
  }
}
