view: orders {
  sql_table_name: public.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
    link: {
      label: "embed test"
      url: "/dashboards/385"
    }
  }

  parameter: date_granularity {
    type: unquoted
    allowed_value: { label: "by Day" value: "day" }
    allowed_value: { label: "by Week" value: "week" }
    allowed_value: { label: "by Month" value: "month" }
    allowed_value: { label: "by Qtr" value: "qtr" }
  }

  dimension: Granularity {
    sql:
    {% if date_granularity._parameter_value == 'day' %}
      ${created_date}
    {% elsif date_granularity._parameter_value == 'week' %}
      ${created_week}
        {% elsif date_granularity._parameter_value == 'month' %}
      ${created_month}
        {% elsif date_granularity._parameter_value == 'qtr' %}
      ${created_quarter}
    {% else %}
      ${created_date}
    {% endif %};;
  }

  dimension_group: created {
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
    sql: ${TABLE}."created_at" ;;
  }

  dimension: order_amount {
    type: number
    sql: ${TABLE}."order_amount" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."user_id" ;;
  }

  measure: count {
    type: count
    value_format: "$#,##0.00"
    drill_fields: [id, users.id, users.name, order_items.count]
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
