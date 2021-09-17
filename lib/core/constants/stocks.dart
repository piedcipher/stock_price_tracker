/// Stocks to track
const Map<Stocks, String> stocksToTrack = {
  Stocks.reli: 'RELI',
  Stocks.tcs: 'TCS',
  Stocks.itc: 'ITC',
  Stocks.hdfc: 'HDBK',
  Stocks.infy: 'INFY',
};

/// Stocks
enum Stocks {
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
