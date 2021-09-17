/// Stocks to track
const Map<Stock, String> stocksToTrack = {
  Stock.reli: 'RELI',
  Stock.tcs: 'TCS',
  Stock.itc: 'ITC',
  Stock.hdfc: 'HDBK',
  Stock.infy: 'INFY',
};

/// Stocks
enum Stock {
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
