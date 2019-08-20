connection: "app-salesforce"

# ADAPTER IMPORTS
include: "//app-sales-adapter/*.view"

# CORE IMPORTS
include: "*.view"
include: "*.explore"
include: "*.dashboard"

# CONFIG IMPORTS
include: "//app-sales-config/*.view"
include: "//app-sales-config/sales_analytics_config.model"

explore: account {
  extends: [account_config]
}

explore: opportunity_history_waterfall {
  extends: [opportunity_history_waterfall_config]
}

explore: lead {
  extends: [lead_config]
}

explore: contact {
  extends: [contact_config]
}

explore: historical_snapshot {
  extends: [historical_snapshot_config]
}

explore: opportuntiy {
  extends: [opportunity_config]
}
