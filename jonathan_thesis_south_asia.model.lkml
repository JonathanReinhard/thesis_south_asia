connection: "jonathan_south-asia_terrorism"
label: "Terrorism in South Asia"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: jonathan_thesis_south_asia_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: jonathan_thesis_south_asia_default_datagroup

explore: all_data {
  sql_always_where: ${region_txt}="South Asia" ;;
}

explore: terrorist_organizations {}

map_layer: districts {
  file: "Region.json"
}
