view: all_data {
  sql_table_name: south_asia.all_data ;;

  dimension: addnotes {
    label: "Additional Notes"
    type: string
    sql: ${TABLE}.addnotes ;;
  }

  dimension: alternative {
    group_label: "Alternative Designation"
    type: number
    sql: ${TABLE}.alternative ;;
  }

  dimension: alternative_txt {
    group_label: "Alternative Designation"
    type: string
    sql: ${TABLE}.alternative_txt ;;
  }

  dimension: approxdate {
    group_label: "GTD ID and Date"
    label: "Approximate Date"
    type: string
    sql: ${TABLE}.approxdate ;;
  }

  dimension: attacktype1 {
    group_label: "Attack Information"
    type: number
    sql: ${TABLE}.attacktype1 ;;
  }

  dimension: attacktype1_txt {
    group_label: "Attack Information"
    label: "Attack Type 1"
    type: string
    sql: ${TABLE}.attacktype1_txt ;;
  }

  dimension: attacktype2 {
    group_label: "Attack Information"
    type: number
    sql: ${TABLE}.attacktype2 ;;
  }

  dimension: attacktype2_txt {
    group_label: "Attack Information"
    label: "Attack Type 2"
    type: string
    sql: ${TABLE}.attacktype2_txt ;;
  }

  dimension: attacktype3 {
    group_label: "Attack Information"
    type: string
    sql: ${TABLE}.attacktype3 ;;
  }

  dimension: attacktype3_txt {
    group_label: "Attack Information"
    label: "Attack Type 3"
    type: string
    sql: ${TABLE}.attacktype3_txt ;;
  }

  dimension: city {
    label: "City"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: claim2 {
    type: number
    sql: ${TABLE}.claim2 ;;
  }

  dimension: claim3 {
    type: string
    sql: ${TABLE}.claim3 ;;
  }

  dimension: claimed {
    type: number
    sql: ${TABLE}.claimed ;;
  }

  dimension: claimmode {
    type: number
    sql: ${TABLE}.claimmode ;;
  }

  dimension: claimmode2 {
    type: string
    sql: ${TABLE}.claimmode2 ;;
  }

  dimension: claimmode2_txt {
    type: string
    sql: ${TABLE}.claimmode2_txt ;;
  }

  dimension: claimmode3 {
    type: string
    sql: ${TABLE}.claimmode3 ;;
  }

  dimension: claimmode3_txt {
    type: string
    sql: ${TABLE}.claimmode3_txt ;;
  }

  dimension: claimmode_txt {
    type: string
    sql: ${TABLE}.claimmode_txt ;;
  }

  dimension: compclaim {
    type: string
    sql: ${TABLE}.compclaim ;;
  }

  dimension: corp1 {
    type: string
    sql: ${TABLE}.corp1 ;;
  }

  dimension: corp2 {
    type: string
    sql: ${TABLE}.corp2 ;;
  }

  dimension: corp3 {
    type: string
    sql: ${TABLE}.corp3 ;;
  }

  dimension: country {
    type: number
    sql: ${TABLE}.country ;;
  }

  dimension: country_txt {
    type: string
    sql: ${TABLE}.country_txt ;;
  }

  dimension: crit1 {
    type: number
    sql: ${TABLE}.crit1 ;;
  }

  dimension: crit2 {
    type: number
    sql: ${TABLE}.crit2 ;;
  }

  dimension: crit3 {
    type: number
    sql: ${TABLE}.crit3 ;;
  }

  dimension: dbsource {
    type: string
    sql: ${TABLE}.dbsource ;;
  }

  dimension: divert {
    type: string
    sql: ${TABLE}.divert ;;
  }

  dimension: doubtterr {
    type: number
    sql: ${TABLE}.doubtterr ;;
  }

  dimension: eventid {
    group_label: "GTD ID and Date"
    label: "GTD ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.eventid ;;
  }

  dimension: extended {
    group_label: "GTD ID and Date"
    type: number
    sql: ${TABLE}.extended ;;
  }

  dimension: gname {
    type: string
    sql: ${TABLE}.gname ;;
  }

  dimension: gname2 {
    type: string
    sql: ${TABLE}.gname2 ;;
  }

  dimension: gname3 {
    type: string
    sql: ${TABLE}.gname3 ;;
  }

  dimension: gsubname {
    type: string
    sql: ${TABLE}.gsubname ;;
  }

  dimension: gsubname2 {
    type: string
    sql: ${TABLE}.gsubname2 ;;
  }

  dimension: gsubname3 {
    type: string
    sql: ${TABLE}.gsubname3 ;;
  }

  dimension: guncertain1 {
    type: number
    sql: ${TABLE}.guncertain1 ;;
  }

  dimension: guncertain2 {
    type: number
    sql: ${TABLE}.guncertain2 ;;
  }

  dimension: guncertain3 {
    type: string
    sql: ${TABLE}.guncertain3 ;;
  }

  dimension: hostkidoutcome {
    type: number
    sql: ${TABLE}.hostkidoutcome ;;
  }

  dimension: hostkidoutcome_txt {
    type: string
    sql: ${TABLE}.hostkidoutcome_txt ;;
  }

  dimension: iday {
    group_label: "GTD ID and Date"
    type: number
    sql: ${TABLE}.iday ;;
  }

  dimension: imonth {
    group_label: "GTD ID and Date"
    type: number
    sql: ${TABLE}.imonth ;;
  }

  dimension: individual {
    type: number
    sql: ${TABLE}.individual ;;
  }

  dimension: int_any {
    type: number
    sql: ${TABLE}.INT_ANY ;;
  }

  dimension: int_ideo {
    type: number
    value_format_name: id
    sql: ${TABLE}.INT_IDEO ;;
  }

  dimension: int_log {
    type: number
    sql: ${TABLE}.INT_LOG ;;
  }

  dimension: int_misc {
    type: number
    sql: ${TABLE}.INT_MISC ;;
  }

  dimension: ishostkid {
    type: number
    value_format_name: id
    sql: ${TABLE}.ishostkid ;;
  }

  dimension: iyear {
    group_label: "GTD ID and Date"
    type: number
    sql: ${TABLE}.iyear ;;
  }


  dimension: kidhijcountry {
    type: string
    sql: ${TABLE}.kidhijcountry ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: map_location {
    type: location
    sql_latitude:${TABLE}.latitude  ;;
    sql_longitude:${TABLE}.longitude ;;
  }

  dimension: motive {
    type: string
    sql: ${TABLE}.motive ;;
  }

  dimension: multiple {
    type: number
    sql: ${TABLE}.multiple ;;
  }

  dimension: natlty1 {
    type: number
    sql: ${TABLE}.natlty1 ;;
  }

  dimension: natlty1_txt {
    type: string
    sql: ${TABLE}.natlty1_txt ;;
  }

  dimension: natlty2 {
    type: number
    sql: ${TABLE}.natlty2 ;;
  }

  dimension: natlty2_txt {
    type: string
    sql: ${TABLE}.natlty2_txt ;;
  }

  dimension: natlty3 {
    type: string
    sql: ${TABLE}.natlty3 ;;
  }

  dimension: natlty3_txt {
    type: string
    sql: ${TABLE}.natlty3_txt ;;
  }

  dimension: ndays {
    type: number
    sql: ${TABLE}.ndays ;;
  }

  dimension: nhostkid {
    type: number
    value_format_name: id
    sql: ${TABLE}.nhostkid ;;
  }

  dimension: nhostkidus {
    type: number
    sql: ${TABLE}.nhostkidus ;;
  }

  dimension: nhours {
    type: number
    sql: ${TABLE}.nhours ;;
  }

  dimension: nkill {
    type: number
    sql: ${TABLE}.nkill ;;
  }

  dimension: nkillter {
    type: number
    sql: ${TABLE}.nkillter ;;
  }

  dimension: nkillus {
    type: number
    sql: ${TABLE}.nkillus ;;
  }

  dimension: nperpcap {
    type: number
    sql: ${TABLE}.nperpcap ;;
  }

  dimension: nperps {
    type: number
    sql: ${TABLE}.nperps ;;
  }

  dimension: nreleased {
    type: number
    sql: ${TABLE}.nreleased ;;
  }

  dimension: nwound {
    type: number
    sql: ${TABLE}.nwound ;;
  }

  dimension: nwoundte {
    type: number
    sql: ${TABLE}.nwoundte ;;
  }

  dimension: nwoundus {
    type: number
    sql: ${TABLE}.nwoundus ;;
  }

  dimension: propcomment {
    type: string
    sql: ${TABLE}.propcomment ;;
  }

  dimension: property {
    type: number
    sql: ${TABLE}.property ;;
  }

  dimension: propextent {
    type: number
    sql: ${TABLE}.propextent ;;
  }

  dimension: propextent_txt {
    type: string
    sql: ${TABLE}.propextent_txt ;;
  }

  dimension: propvalue {
    type: number
    sql: ${TABLE}.propvalue ;;
  }

  dimension: provstate {
    type: string
    sql: ${TABLE}.provstate ;;
  }

  dimension: ransom {
    type: number
    sql: ${TABLE}.ransom ;;
  }

  dimension: ransomamt {
    type: number
    sql: ${TABLE}.ransomamt ;;
  }

  dimension: ransomamtus {
    type: string
    sql: ${TABLE}.ransomamtus ;;
  }

  dimension: ransomnote {
    type: string
    sql: ${TABLE}.ransomnote ;;
  }

  dimension: ransompaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.ransompaid ;;
  }

  dimension: ransompaidus {
    type: string
    sql: ${TABLE}.ransompaidus ;;
  }

  dimension: region {
    type: number
    sql: ${TABLE}.region ;;
  }

  dimension: region_txt {
    type: string
    sql: ${TABLE}.region_txt ;;
  }

  dimension: related {
    type: string
    sql: ${TABLE}.related ;;
  }

  dimension_group: resolution {
    group_label: "GTD ID and Date"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.resolution ;;
  }

  dimension: scite1 {
    type: string
    sql: ${TABLE}.scite1 ;;
  }

  dimension: scite2 {
    type: string
    sql: ${TABLE}.scite2 ;;
  }

  dimension: scite3 {
    type: string
    sql: ${TABLE}.scite3 ;;
  }

  dimension: specificity {
    type: number
    sql: ${TABLE}.specificity ;;
  }

  dimension: success {
    group_label: "Attack Information"
    type: number
    sql: ${TABLE}.success ;;
  }

  dimension: suicide {
    group_label: "Attack Information"
    label: "Suicide Attack"
    type: number
    sql: ${TABLE}.suicide ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}.summary ;;
  }

  dimension: target1 {
    type: string
    sql: ${TABLE}.target1 ;;
  }

  dimension: target2 {
    type: string
    sql: ${TABLE}.target2 ;;
  }

  dimension: target3 {
    type: string
    sql: ${TABLE}.target3 ;;
  }

  dimension: targsubtype1 {
    type: number
    sql: ${TABLE}.targsubtype1 ;;
  }

  dimension: targsubtype1_txt {
    type: string
    sql: ${TABLE}.targsubtype1_txt ;;
  }

  dimension: targsubtype2 {
    type: number
    sql: ${TABLE}.targsubtype2 ;;
  }

  dimension: targsubtype2_txt {
    type: string
    sql: ${TABLE}.targsubtype2_txt ;;
  }

  dimension: targsubtype3 {
    type: string
    sql: ${TABLE}.targsubtype3 ;;
  }

  dimension: targsubtype3_txt {
    type: string
    sql: ${TABLE}.targsubtype3_txt ;;
  }

  dimension: targtype1 {
    type: number
    sql: ${TABLE}.targtype1 ;;
  }

  dimension: targtype1_txt {
    type: string
    sql: ${TABLE}.targtype1_txt ;;
  }

  dimension: targtype2 {
    type: number
    sql: ${TABLE}.targtype2 ;;
  }

  dimension: targtype2_txt {
    type: string
    sql: ${TABLE}.targtype2_txt ;;
  }

  dimension: targtype3 {
    type: string
    sql: ${TABLE}.targtype3 ;;
  }

  dimension: targtype3_txt {
    type: string
    sql: ${TABLE}.targtype3_txt ;;
  }

  dimension: vicinity {
    type: number
    sql: ${TABLE}.vicinity ;;
  }

  dimension: weapdetail {
    group_label: "Weapon Information"
    label: "Weapon Details"
    type: string
    sql: ${TABLE}.weapdetail ;;
  }

  dimension: weapsubtype1 {
    group_label: "Weapon Information"
    type: number
    sql: ${TABLE}.weapsubtype1 ;;
  }

  dimension: weapsubtype1_txt {
    group_label: "Weapon Information"
    label: "First Weapon Sub-Type"
    type: string
    sql: ${TABLE}.weapsubtype1_txt ;;
  }

  dimension: weapsubtype2 {
    group_label: "Weapon Information"
    type: number
    sql: ${TABLE}.weapsubtype2 ;;
  }

  dimension: weapsubtype2_txt {
    group_label: "Weapon Information"
    label: "Second Weapon Sub-Type"
    type: string
    sql: ${TABLE}.weapsubtype2_txt ;;
  }

  dimension: weapsubtype3 {
    group_label: "Weapon Information"
    type: number
    sql: ${TABLE}.weapsubtype3 ;;
  }

  dimension: weapsubtype3_txt {
    group_label: "Weapon Information"
    label: "Third Weapon Sub-Type"
    type: string
    sql: ${TABLE}.weapsubtype3_txt ;;
  }

  dimension: weapsubtype4 {
    group_label: "Weapon Information"
    type: string
    sql: ${TABLE}.weapsubtype4 ;;
  }

  dimension: weapsubtype4_txt {
    group_label: "Weapon Information"
    label: "Fourth Weapon Sub-Type"
    type: string
    sql: ${TABLE}.weapsubtype4_txt ;;
  }

  dimension: weaptype1 {
    group_label: "Weapon Information"
    type: number
    sql: ${TABLE}.weaptype1 ;;
  }

  dimension: weaptype1_txt {
    group_label: "Weapon Information"
    label: "First Weapon Type"
    type: string
    sql: ${TABLE}.weaptype1_txt ;;
  }

  dimension: weaptype2 {
    group_label: "Weapon Information"
    type: number
    sql: ${TABLE}.weaptype2 ;;
  }

  dimension: weaptype2_txt {
    group_label: "Weapon Information"
    label: "Second Weapon Type"
    type: string
    sql: ${TABLE}.weaptype2_txt ;;
  }

  dimension: weaptype3 {
    group_label: "Weapon Information"
    type: string
    sql: ${TABLE}.weaptype3 ;;
  }

  dimension: weaptype3_txt {
    group_label: "Weapon Information"
    label: "Third Weapon Type"
    type: string
    sql: ${TABLE}.weaptype3_txt ;;
  }

  dimension: weaptype4 {
    group_label: "Weapon Information"
    type: string
    sql: ${TABLE}.weaptype4 ;;
  }

  dimension: weaptype4_txt {
    group_label: "Weapon Information"
    label: "Fourth Weapon Type"
    type: string
    sql: ${TABLE}.weaptype4_txt ;;
  }

  measure: count {
    type: count
    drill_fields: [gname, gsubname]
  }
}
