view: terrorist_organizations {
  label: "Terrorist Organizations"
  derived_table: {
    sql: SELECT
    DISTINCT(all_data.gname) AS gname,
    sum(all_data.nkill) AS fatalities,
    max(all_data.nkill) AS highest_fatalities,
    min(all_data.nkill) AS lowest_fatalities
    FROM all_data
    WHERE all_data.region_txt="South Asia"
    GROUP BY 1;;
  persist_for: "500 hours"
  }

dimension: gname {
  label: "Terrorist organisation"
  type: string
  sql: ${TABLE}.gname ;;

  link: {
    label: "Want to know more about {{ value }}? Google it!"
    url: "http://www.google.com/search?q={{ value }}"
    icon_url: "http://google.com/favicon.ico"
  }
  link: {
    label: "Want to know more about {{ value }}? Wiki to the rescue!"
    url: "https://en.wikipedia.org/w/index.php?search={{ value }}"
    icon_url: "https://de.wikipedia.org/favicon.ico"
  }
}

dimension: fatalities {
  label: "Fatalities"
  type: number
  sql: ${TABLE}.fatalities ;;
}

dimension: highest {
  type: number
  sql: ${TABLE}.highest_fatalities ;;
}

dimension: lowest {
  type: number
  sql: ${TABLE}.lowest_fatalities ;;
}

###### Measures and Stuff

measure: count {
  type: count
}
measure: distinct_count {
  type: count_distinct
  sql: ${TABLE}.gname ;;
}
measure: sum {
  type: sum
}

}
