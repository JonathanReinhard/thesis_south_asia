view: terrorist_organizations {
  label: "Terrorist Organizations"
  derived_table: {
    sql: SELECT
    all_data.gname AS gname,
    all_data.motive As motive,
    all_data.claimed AS claimed
    FROM all_data
    WHERE all_data.region_txt="South Asia"
    GROUP BY 1,2,3
    ;;
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

dimension: motive {
  label: "Motive"
  type: string
  sql: ${TABLE}.motive ;;
}

measure: count {
  type: count
}
measure: distinct_count {
  type: count_distinct
  sql: ${TABLE}.gname ;;
}

}
