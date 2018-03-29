- dashboard: region_country_overview
  title: Region Country Overview
  layout: newspaper
  query_timezone: query_saved
  elements:
  - name: Region Incident Overview
    title: Region Incident Overview
    model: jonathan_thesis_south_asia
    explore: all_data
    type: looker_map
    fields:
    - all_data.count
    - all_data.map_location
    - all_data.country_txt
    sorts:
    - all_data.count desc
    limit: 5000
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    stacking: percent
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: circle
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: '12'
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    value_labels: legend
    label_type: labPer
    series_types: {}
    focus_on_hover: false
    swap_axes: false
    hide_legend: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_colors: {}
    colors:
    - 'palette: Green to Red'
    x_axis_reversed: false
    y_axis_reversed: false
    map_latitude: 22.69852756782256
    map_longitude: 78.89220535755159
    map_zoom: 4
    listen:
      Country: all_data.country_txt
    row: 0
    col: 7
    width: 9
    height: 10
  filters:
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: jonathan_thesis_south_asia
    explore: all_data
    listens_to_filters: []
    field: all_data.country_txt
