project_name: "app-sales"

application: sales-analytics-application {
  label: "Sales Analytics"
  definition_file: "application.json"
}


################ Constants ################

# Used in google_analytics_block.model connection param
constant: CONNECTION_NAME {
  value: "looker_application"
  export: override_required
}

# Used in ga_sessions.view sql_table_name
constant: SCHEMA_NAME {
  value: "salesforce_for_looker"
  export: override_required
}

constant: CONFIG_PROJECT_NAME {
  value: "app-sales-config"
  export: override_required
}





################ Dependencies ################


remote_dependency: app-sales-adapter  {
  url: "https://github.com/looker/app-sales-fivetran-bigquery"
  ref: "ce34e98e4c3d0dc32111cfba7836f1d28b0187b8"
}

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  override_constant: SCHEMA_NAME {
    value: "@{SCHEMA_NAME}"
  }

}
