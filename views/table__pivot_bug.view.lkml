view: table_pivot_bug {
  derived_table: {
    sql: select "abc" as string, "123" as number
      union all
      select "bcd" as string, "234" as number
      union all
      select "cde" as string, "345" as number
      union all
      select "" as string, "456" as number
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: string {
    type: string
    sql: ${TABLE}.string ;;
  }

  dimension: number {
    type: string
    sql: ${TABLE}.number ;;
  }

  set: detail {
    fields: [string, number]
  }
}
