import 'package:bir_qadam_pos/screens/barcode/barcode_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/hive_helper/log_helper.dart';

import '../../bloc/bloc.dart';
import '../widgets/app/app_shape.dart';

// ignore: must_be_immutable
class BarcodeScanPage extends StatefulWidget {
  const BarcodeScanPage({super.key});
  @override
  State<BarcodeScanPage> createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? _qrViewController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Maxsulotni skanerlang",
          textAlign: TextAlign.center,
          style: AppTextStyle.medium(color: AppColors.white),
        ),
      ),
      body: Stack(
        children: [
          QRView(
            key: _qrKey,
            onPermissionSet: _onPermissionSet,
            onQRViewCreated: _onQRViewCreated,
            formatsAllowed: const [
              BarcodeFormat.ean13,
              BarcodeFormat.code128,
              BarcodeFormat.upcA,
              BarcodeFormat.ean8,
              BarcodeFormat.code93,
              BarcodeFormat.itf,
              BarcodeFormat.upcE
            ],
            overlay: QrScannerOverlayShape(
              // cutOutHeight: 250.h,
              // cutOutWidth: 350.w,
              cutOutSize: 250.h,
              borderColor: Colors.white,
              borderRadius: 10.r,
              borderLength: 40.w,
              borderWidth: 3.w,
            ),
          ),
          Positioned(
            bottom: 100.h,
            right: 140.w,
            left: 140.w,
            child: BlocProvider(
              create: (context) => FlashBloc(),
              child: BlocBuilder<FlashBloc, FlashState>(
                builder: (context, state) {
                  FlashBloc flashBloc = context.watch();
                  bool isFlashLight = state.isLight;
                  return InkWell(
                    onTap: () async {
                      await _qrViewController?.toggleFlash();
                      final bool isLight =
                          await _qrViewController?.getFlashStatus() ?? false;
                      flashBloc.add(FlashLightEvent(isLight));
                    },
                    child: Container(
                      height: 40.h,
                      width: 80.w,
                      alignment: Alignment.center,
                      decoration: AppShape.simple(
                          color: AppColors.white.withOpacity(.2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isFlashLight ? Icons.flash_on : Icons.flash_off,
                            color: AppColors.white,
                          ),
                          Text(
                            state.isLight ? 'On' : 'Off',
                            style: AppTextStyle.regular(color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    _qrViewController = controller;
    await _qrViewController?.resumeCamera();

    _qrViewController?.scannedDataStream.listen((event) async {
      await _qrViewController?.pauseCamera();
      String barcode = event.code.toString();

      // ignore: use_build_context_synchronously

      Navigator.push(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(builder: (context) =>  BarcodeResultScreen(barcode)))
          .then((value) async {
        // BlocProvider.of<AddSearchingProductsBloc>(context)
        //     .add(GetSearchedProduct(barcode: barcode));
        await _qrViewController?.resumeCamera();
      });
    });
  }

  void _onPermissionSet(ctrl, hasPermission) {
    if (!hasPermission) {
      LogHelper.addLog(
        'Barcode permission denied',
        file: 'barcode_scan_screen.dart',
        method: 'PERMISSION',
        path: 'onPermission',
        statusCode: 10000,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _qrViewController?.dispose();
  }
}
