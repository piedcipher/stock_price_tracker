/// Stocks to track
const Map<_Stocks, String> stocksToTrack = {
  _Stocks.reli: 'RELI',
  _Stocks.tcs: 'TCS',
  _Stocks.itc: 'ITC',
  _Stocks.hdfc: 'HDBK',
  _Stocks.infy: 'INFY',
};

/// Stocks
enum _Stocks {
  /// Stock of Reliance Industries
  reli,

  /// Stock of Tata Consultancy Services
  tcs,

  /// Stock of ITC Ltd.
  itc,

  /// Stock of HDFC Bank
  hdfc,

  /// Stock of Infosys
  infy,
}
