connection: "app-salesforce"

include: "*.view"
include: "//app-sales-adapter/*.view"
include: "//app-sales-config/*.view"
include: "*.dashboard"
include: "*.explore"
include: "//app-sales-config/sales_analytics_config.model"



explore: lead {
  extends: [lead_config]
  hidden: no
}

explore: contact {
  extends: [contact_config]
  hidden: no
}

explore: opportunity {
  extends: [opportunity_config]
  hidden: no
}

explore: account {
  extends: [account_config]
  hidden: no
}

explore: opportunity_history_waterfall {
  extends: [opportunity_history_waterfall_config]
  hidden: no
}
