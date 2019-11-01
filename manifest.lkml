project_name: "app-sales"

application: sales-analytics {
  label: "Sales Analytics"
  definition_file: "application.json"
  config_project: "@{CONFIG_PROJECT_NAME}"
}


################ Constants ################

constant: CONNECTION_NAME {
  value: "app-salesforce"
  export: override_required
}

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
  ref: "e748a79293e829e324002d48b13ef900ef95c12c"
}

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  override_constant: SCHEMA_NAME {
    value: "@{SCHEMA_NAME}"
  }
}
