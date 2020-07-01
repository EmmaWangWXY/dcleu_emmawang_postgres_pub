project_name: "emmawang_postgres"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
constant: connection {
  value: "donotchange_romain_gcp_postgres"
  export: override_required
}
