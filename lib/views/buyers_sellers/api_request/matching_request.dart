class MatchingRequest {
  String type = '';
  List<String> xFor = [];
  double? minSize = null;
  double? maxSize = null;
  String? sizeType;
  double? minSellPrice;
  double? maxSellPrice;
  double? minRentPrice;
  double? maxRentPrice;
  double? minLeasePrice;
  double? maxLeasePrice;
  bool findMatchingInquiries;

  MatchingRequest({
    required this.type,
    required this.xFor,
    this.minSize,
    this.maxSize,
    this.sizeType,
    this.minSellPrice,
    this.maxSellPrice,
    this.minRentPrice,
    this.maxRentPrice,
    this.minLeasePrice,
    this.maxLeasePrice,
    this.findMatchingInquiries = false,
  });

  bool _isSellOrBuyAvailable(List<String> xFor) {
    return xFor.contains('buy') || xFor.contains('sell');
  }

  bool _isRentAvailable(List<String> xFor) {
    return xFor.contains('rent');
  }

  bool _isLeaseAvailable(List<String> xFor) {
    return xFor.contains('lease');
  }

  Map toJson() => {
        'type': type,
        '${findMatchingInquiries ? 'buy' : 'sell'}': _isSellOrBuyAvailable(xFor)
            ? {'min_price': minSellPrice, 'max_price': maxSellPrice}
            : null,
        'rent': _isRentAvailable(xFor)
            ? {'min_price': minRentPrice, 'max_price': maxRentPrice}
            : null,
        'lease': _isLeaseAvailable(xFor)
            ? {'min_price': minLeasePrice, 'max_price': maxLeasePrice}
            : null,
        'min_size': minSize,
        'max_size': maxSize,
        'size_type': sizeType
      };
}
