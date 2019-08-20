- dashboard: pipeline_velocity
  title: Pipeline Velocity
  extends: sales_analytics_base
  embed_style:
    background_color: "#ffffff"
    title_color: "#3a4245"
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Avg Days Stage 1 - Close
    name: Avg Days Stage 1 - Close
    model: sales_analytics
    explore: opportunity
    type: single_value
    fields: [opportunity_stage_history.avg_days_in_stage]
    filters:
      opportunity.is_renewal_upsell: 'No'
    limit: 500
    column_limit: 50
    stacking: ''
    trellis: ''
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
        __FILE: app-sales/pipeline_velocity.dashboard.lookml
        __LINE_NUM: 22
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: circle_outline
    series_colors:
      opportunity_stage_history.avg_days_in_stage: "#C762AD"
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: opportunity_stage_history.avg_days_in_stage,
            name: Avg Days In Stage, axisId: opportunity_stage_history.avg_days_in_stage,
            __FILE: app-sales/pipeline_velocity.dashboard.lookml, __LINE_NUM: 34}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear, __FILE: app-sales/pipeline_velocity.dashboard.lookml,
        __LINE_NUM: 34}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Opportunity: opportunity.name
      Manager: opportunity_owner.manager
      Time Frame: account.created_date
    row: 0
    col: 0
    width: 5
    height: 7
  - title: Conversion Rate By Stage
    name: Conversion Rate By Stage
    model: sales_analytics
    explore: opportunity
    type: looker_column
    fields: [opportunity_stage_history.stage, opportunity_stage_history.avg_days_in_stage,
      opportunity_stage_history.opps_in_each_stage]
    filters:
      opportunity.is_new_business: 'Yes'
      opportunity_stage_history.stage: "-NULL"
    sorts: [opportunity_stage_history.stage]
    limit: 500
    dynamic_fields: [{table_calculation: conversion_rates, label: Conversion Rates,
        expression: "${opportunity_stage_history.opps_in_each_stage}/ offset(${opportunity_stage_history.opps_in_each_stage},\
          \ -1)", value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    stacking: ''
    trellis: ''
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
        __FILE: app-sales/pipeline_velocity.dashboard.lookml
        __LINE_NUM: 153
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: none
    series_colors:
      opportunity_stage_history.avg_days_in_stage: "#BB55B4"
      conversion_rates: "#170658"
    series_types:
      conversion_rates: line
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    y_axes: [{label: '', orientation: left, series: [{id: opportunity_stage_history.avg_days_in_stage,
            name: Avg Days In Stage, axisId: opportunity_stage_history.avg_days_in_stage,
            __FILE: app-sales/pipeline_velocity.dashboard.lookml, __LINE_NUM: 171}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        type: linear, __FILE: app-sales/pipeline_velocity.dashboard.lookml, __LINE_NUM: 171},
      {label: !!null '', orientation: right, series: [{id: conversion_rates, name: Conversion
              Rates, axisId: conversion_rates, __FILE: app-sales/pipeline_velocity.dashboard.lookml,
            __LINE_NUM: 174}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, type: linear, __FILE: app-sales/pipeline_velocity.dashboard.lookml,
        __LINE_NUM: 174}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [opportunity_stage_history.opps_in_each_stage]
    listen:
      Opportunity: opportunity.name
      Manager: opportunity_owner.manager
      Time Frame: account.created_date
    row: 0
    col: 5
    width: 19
    height: 7
  - title: 'Rep: Average Days in Stage'
    name: 'Rep: Average Days in Stage'
    model: sales_analytics
    explore: opportunity
    type: looker_bar
    fields: [opportunity_stage_history.avg_days_in_stage, opportunity.total_closed_won_amount,
      opportunity_owner.name, opportunity_stage_history.stage]
    pivots: [opportunity_stage_history.stage]
    filters:
      opportunity_owner.name: "-NULL"
      opportunity.is_new_business: 'Yes'
      opportunity.created_date: 9 months
    sorts: [opportunity_stage_history.stage 0, opportunity_stage_history.avg_days_in_stage
        desc 0]
    limit: 1000
    dynamic_fields: [{table_calculation: total, label: Total, expression: 'sum(pivot_row(${opportunity.total_closed_won_amount}))',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: supermeasure,
        _type_hint: number}]
    stacking: normal
    trellis: ''
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: b20fe57d-cb13-420f-815b-60e907a43148
      options:
        steps: 5
        __FILE: app-sales/pipeline_velocity.dashboard.lookml
        __LINE_NUM: 228
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: circle
    series_types: {}
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hidden_series: [Stage 2 - 3 - opportunity_stage_history.avg_days_in_stage, Stage
        3 - 4 - opportunity_stage_history.avg_days_in_stage, Stage 5 - 6 - opportunity_stage_history.avg_days_in_stage,
      Develop - 3 - opportunity_stage_history.avg_days_in_stage, Develop Positive
        - 4 - opportunity_stage_history.avg_days_in_stage, Sales Submitted - 6 - opportunity_stage_history.avg_days_in_stage,
      Negotiate - 5 - opportunity_stage_history.avg_days_in_stage, Qualify - 2 - opportunity_stage_history.avg_days_in_stage,
      Closed Won - 7 - opportunity_stage_history.avg_days_in_stage]
    y_axes: [{label: '', orientation: left, series: [{id: opportunity_stage_history.avg_days_in_stage,
            name: Avg Days In Stage, axisId: opportunity_stage_history.avg_days_in_stage,
            __FILE: app-sales/pipeline_velocity.dashboard.lookml, __LINE_NUM: 248}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear, __FILE: app-sales/pipeline_velocity.dashboard.lookml,
        __LINE_NUM: 248}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    hidden_fields: [opportunity.total_closed_won_amount, total]
    listen:
      Opportunity: opportunity.name
      Manager: opportunity_owner.manager
      Time Frame: account.created_date
    row: 7
    col: 12
    width: 12
    height: 11
  - title: 'Days in Pipeline: Open Opps'
    name: 'Days in Pipeline: Open Opps'
    model: sales_analytics
    explore: opportunity
    type: looker_bar
    fields: [opportunity_stage_history.stage, opportunity_stage_history.total_days_in_stage,
      opportunity.name_id]
    pivots: [opportunity_stage_history.stage]
    filters:
      opportunity.is_new_business: 'Yes'
      opportunity_stage_history.stage: "-NULL,-Closed Won"
      opportunity.is_pipeline: 'Yes'
    sorts: [opportunity_stage_history.stage 0, opportunity_stage_history.total_days_in_stage
        desc 6]
    limit: 2000
    row_total: right
    stacking: normal
    trellis: ''
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
        __FILE: app-sales/pipeline_velocity.dashboard.lookml
        __LINE_NUM: 85
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: circle
    series_types: {}
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    y_axes: [{label: '', orientation: left, series: [{id: opportunity_stage_history.avg_days_in_stage,
            name: Avg Days In Stage, axisId: opportunity_stage_history.avg_days_in_stage,
            __FILE: app-sales/pipeline_velocity.dashboard.lookml, __LINE_NUM: 99}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear, __FILE: app-sales/pipeline_velocity.dashboard.lookml,
        __LINE_NUM: 99}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    hidden_fields:
    hidden_series: []
    listen:
      Opportunity: opportunity.name
      Manager: opportunity_owner.manager
      Time Frame: account.created_date
    row: 7
    col: 0
    width: 12
    height: 11
  filters:
  - name: Opportunity
    title: Opportunity
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: sales_analytics
    explore: opportunity
    listens_to_filters: []
    field: opportunity.name
  - name: Manager
    title: Manager
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: sales_analytics
    explore: opportunity
    listens_to_filters: []
    field: opportunity_owner.manager
  - name: Time Frame
    title: Time Frame
    type: field_filter
    default_value: 9 months
    allow_multiple_values: true
    required: false
    model: sales_analytics
    explore: opportunity
    listens_to_filters: []
    field: account.created_date
