connection: "@{connection}"

# include all the views
include: "/views/**/*.view"

datagroup: emmawang_postgres_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: emmawang_postgres_default_datagroup

explore: all_types {}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

# explore: calendar {
#   join: orders {
#     sql_on: ${calendar.series_date} = ${orders.created_date};;
#     type: left_outer
#     relationship: one_to_many
#   }
# }
explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {}

explore: NDT_test  {
  view_name: NDT_test
}
