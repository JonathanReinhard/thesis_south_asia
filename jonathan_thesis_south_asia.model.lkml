connection: "thesis_jiro_global_terrorism"
label: "Terrorism in South Asia"

# include all the views
include: "*.view"

# include all the dashboards
#include: "*.dashboard"

datagroup: jonathan_thesis_south_asia_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: jonathan_thesis_south_asia_default_datagroup

explore: all_data {
  sql_always_where: ${region_txt}="South Asia" ;;
}

map_layer: districts_ind {
  file: "IND_adm.json"
}

map_layer: districts_pak {
  file: "PAK_adm.json"
}
map_layer: districts_sri {
  file: "LKA_adm.json"
}
map_layer: districts_nep {
  file: "NPL_adm.json"
}
map_layer: districts_bhu {
  file: "BTN_adm.json"
}
map_layer: districts_afg {
  file: "AFG_adm.json"
}
map_layer: districts_mal {
  file: "MDV_adm.json"
}
map_layer: districts_bgd {
  file: "BGD_adm.json"
}
