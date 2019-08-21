project_name: "app-sales"


# remote_dependency: app-sales-adapter  {
#   url: "https://github.com/looker/app-sales-fivetran-bigquery"
#   ref: "ce34e98e4c3d0dc32111cfba7836f1d28b0187b8"
# }

local_dependency: {
  project: "app-sales-config"
}

local_dependency: {
  project: "app-sales-adapter"
}

# remote_dependency: app-sales-config {
#   url: "git@github.com:looker/app-sales.git"
#   ref: "eccaff89662da5ac0763b629145578673b459d80"
# }


application: sales-analytics-application {
  label: "Sales Analytics"
  definition_file: "application.json"
}
