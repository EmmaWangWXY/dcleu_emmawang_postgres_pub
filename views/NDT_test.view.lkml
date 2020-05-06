# If necessary, uncomment the line below to include explore_source.
# this is an NDT with bind_filters with templated filters.
include: "/models/emmawang_postgres.model.lkml"

view: NDT_test {
  derived_table: {
    explore_source: order_items {
      column: id { field: orders.id }
      column: created_date { field: orders.created_date }
      column: status { field: orders.status }
      column: user_id { field: orders.user_id }
      column: count { field: orders.count }
#       column: filter_me {}
#       filters: {field:orders.status value:"cancelled"}
      bind_filters: {
        from_field: NDT_test.filter_me
        to_field: orders.status
      }
    }
  }

  filter: filter_me{
    type: string
  }
  dimension: id {
    type: number
  }
  dimension: created_date {
    type: date
  }
  dimension: status {}

  dimension: user_id {
    type: number
  }
  dimension: count {
    type: number
  }
}
