import 'package:json_annotation/json_annotation.dart';

part 'financial_index_response.g.dart';

@JsonSerializable()
class FinancialIndexResponse {
  @JsonKey(name: 'symbol')
  final String? symbol;
  @JsonKey(name: 'pe')
  final double? pe;
  @JsonKey(name: 'pe4Q')
  final double? pe4Q;
  @JsonKey(name: 'peRank')
  final int? peRank;
  @JsonKey(name: 'eps')
  final double? eps;
  @JsonKey(name: 'eps_rank')
  final int? epsRank;
  @JsonKey(name: 'eps4Q')
  final double? eps4Q;
  @JsonKey(name: 'eps4Q_rank')
  final int? eps4QRank;
  @JsonKey(name: 'eps_diluted')
  final double? epsDiluted;
  @JsonKey(name: 'eps4q_diluted')
  final double? eps4qDiluted;
  @JsonKey(name: 'first_trading_date')
  final String? firstTradingDate;
  @JsonKey(name: 'min52w')
  final double? min52w;
  @JsonKey(name: 'min52w_rank')
  final int? min52wRank;
  @JsonKey(name: 'max52w')
  final double? max52w;
  @JsonKey(name: 'max52w_rank')
  final int? max52wRank;
  @JsonKey(name: 'avg_trading_vol')
  final int? avgTradingVol;
  @JsonKey(name: 'avg_trading_vol_rank')
  final int? avgTradingVolRank;
  @JsonKey(name: 'listed_share_vol')
  final int? listedShareVol;
  @JsonKey(name: 'listed_share_vol_rank')
  final int? listedShareVolRank;
  @JsonKey(name: 'circulation_vol')
  final int? circulationVol;
  @JsonKey(name: 'circulation_vol_rank')
  final int? circulationVolRank;
  @JsonKey(name: 'roe')
  final double? roe;
  @JsonKey(name: 'roe4Q')
  final double? roe4Q;
  @JsonKey(name: 'roe_rank')
  final int? roeRank;
  @JsonKey(name: 'pb')
  final double? pb;
  @JsonKey(name: 'pb4Q')
  final double? pb4Q;
  @JsonKey(name: 'pb_rank')
  final int? pbRank;
  @JsonKey(name: 'roa')
  final double? roa;
  @JsonKey(name: 'roa4Q')
  final double? roa4Q;
  @JsonKey(name: 'roa_rank')
  final int? roaRank;
  @JsonKey(name: 'year')
  final int? year;
  @JsonKey(name: 'book_value')
  final double? bookValue;
  @JsonKey(name: 'book_value4Q')
  final double? bookValue4Q;
  @JsonKey(name: 'book_value_rank')
  final int? bookValueRank;
  @JsonKey(name: 'the_beta')
  final double? theBeta;
  @JsonKey(name: 'the_beta4Q')
  final double? theBeta4Q;
  @JsonKey(name: 'the_beta_rank')
  final int? theBetaRank;
  @JsonKey(name: 'market_cap')
  final int? marketCap;
  @JsonKey(name: 'market_cap_rank')
  final int? marketCapRank;
  @JsonKey(name: 'free_float')
  final int? freeFloat;
  @JsonKey(name: 'free_float_rank')
  final int? freeFloatRank;
  @JsonKey(name: 'free_float_rate')
  final double? freeFloatRate;
  @JsonKey(name: 'free_float_rate_rank')
  final int? freeFloatRateRank;
  @JsonKey(name: 'group_id')
  final int? groupId;
  @JsonKey(name: 'group_name')
  final String? groupName;
  @JsonKey(name: 'group_count')
  final int? groupCount;
  @JsonKey(name: 'foreign_total_room')
  final int? foreignTotalRoom;
  @JsonKey(name: 'foreign_current_room')
  final int? foreignCurrentRoom;
  @JsonKey(name: 'audit_firm_id')
  final int? auditFirmId;
  @JsonKey(name: 'audit_firm_year')
  final int? auditFirmYear;
  @JsonKey(name: 'ev_per_ebitda')
  final int? evPerEbitda;
  @JsonKey(name: 'ev_per_ebitda4Q')
  final int? evPerEbitda4Q;
  @JsonKey(name: 'ev_per_ebit')
  final int? evPerEbit;
  @JsonKey(name: 'ev_per_ebit4Q')
  final int? evPerEbit4Q;

  FinancialIndexResponse(
      this.symbol,
      this.pe,
      this.pe4Q,
      this.peRank,
      this.eps,
      this.epsRank,
      this.eps4Q,
      this.eps4QRank,
      this.epsDiluted,
      this.eps4qDiluted,
      this.firstTradingDate,
      this.min52w,
      this.min52wRank,
      this.max52w,
      this.max52wRank,
      this.avgTradingVol,
      this.avgTradingVolRank,
      this.listedShareVol,
      this.listedShareVolRank,
      this.circulationVol,
      this.circulationVolRank,
      this.roe,
      this.roe4Q,
      this.roeRank,
      this.pb,
      this.pb4Q,
      this.pbRank,
      this.roa,
      this.roa4Q,
      this.roaRank,
      this.year,
      this.bookValue,
      this.bookValue4Q,
      this.bookValueRank,
      this.theBeta,
      this.theBeta4Q,
      this.theBetaRank,
      this.marketCap,
      this.marketCapRank,
      this.freeFloat,
      this.freeFloatRank,
      this.freeFloatRate,
      this.freeFloatRateRank,
      this.groupId,
      this.groupName,
      this.groupCount,
      this.foreignTotalRoom,
      this.foreignCurrentRoom,
      this.auditFirmId,
      this.auditFirmYear,
      this.evPerEbitda,
      this.evPerEbitda4Q,
      this.evPerEbit,
      this.evPerEbit4Q);

  factory FinancialIndexResponse.fromJson(Map<String, dynamic> json) => _$FinancialIndexResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FinancialIndexResponseToJson(this);
}
