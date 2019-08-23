include: "//app-sales-adapter/campaign_adapter.view"
include: "//@{CONFIG_PROJECT_NAME}/campaign.view.lkml"

view: campaign {
  extends: [campaign_config]
}


view: campaign_core {
  extends: [campaign_adapter]

  dimension_group: _fivetran_synced { hidden: yes }
  dimension_group: system_modstamp { hidden: yes }

  measure: count { label: "Number of Campaigns" }
}