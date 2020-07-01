view: calendar {
  derived_table: {
    sql: SELECT generate_series('2012-01-01'::timestamp, '2012-12-31', '1 day') as series ;;
    sql_trigger_value: 1 ;;
    indexes: ["1"]
  }



dimension_group: series {
  type: time
  timeframes: [
    raw,
    time,
    date,
    week,
    month,
    quarter,
    year
  ]
  sql: generate_series('2019-01-01'::timestamp, '2019-12-31', '1 day') ;;
}
}
