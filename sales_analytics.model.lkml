connection: "app-salesforce"
include: "*.view"
include: "//app-sales-adapter/*.view"
include: "//app-sales-config/*.view"
include: "*.dashboard"
# include: "//app-sales-config/explore_extends.explore.lkml"
include: "*.explore"

include: "//app-sales-config/sales_analytics_config.model"

# include: "//app-sales-config/opportunity_history_waterfall.explore.lkml"
# include: "//app-sales-config/account.explore.lkml"
# include: "//app-sales-config/opportunity.explore.lkml"
# include: "//app-sales-config/contact.explore.lkml"
# include: "//app-sales-config/lead.explore.lkml"

# include: "//app-sales-config/explore_extends.explore.lkml"


# explore: app {
#   hidden: yes
# }
# view: app {}

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
