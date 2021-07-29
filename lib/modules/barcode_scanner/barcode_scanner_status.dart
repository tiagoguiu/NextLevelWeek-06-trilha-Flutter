
class BarcodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barcode;
  final bool stopScanner;

  BarcodeScannerStatus({
    this.isCameraAvailable = false,
    this.barcode = "",
    this.error = "",
    this.stopScanner = false,
  });
//factory são construtores alternativos que serão acessados atraves do ponto

  factory BarcodeScannerStatus.available() =>
      BarcodeScannerStatus(
        isCameraAvailable: true,
        stopScanner: false,
      );
  factory BarcodeScannerStatus.error(String message) => BarcodeScannerStatus(
        error: message,
        stopScanner: true,
      );
  factory BarcodeScannerStatus.barcode(String barcode) => BarcodeScannerStatus(
        barcode: barcode,
        stopScanner: true,
      );

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;
}
