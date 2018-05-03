view: all_data {
  label: "South Asia Data Collection"
  sql_table_name: south_asia.all_data ;;

## I. GTD ID and Date (sorting this view based on the Code Book Categories)

  dimension: eventid {
    group_label: "GTD ID and Date"
    label: "GTD ID"
    description: "The Unique ID that the Incident has in the GTD"
    primary_key: yes
    value_format_name: id
    sql: ${TABLE}.eventid ;;
  }

  dimension: iyear {
    group_label: "GTD ID and Date"
    label: "Year"
    type: number
    value_format_name: id
    sql: ${TABLE}.iyear;;
    hidden: yes
  }

  dimension: imonth {
    group_label: "GTD ID and Date"
    label: "Month"
    type: string
    value_format: "*0#"
    sql: ${TABLE}.imonth ;;
    hidden: yes
  }

  dimension: iday {
    group_label: "GTD ID and Date"
    label: "Day"
    type: string
    value_format: "*0#"
    sql: ${TABLE}.iday ;;
    hidden: yes
  }

  dimension: incident_date{
    group_label: "GTD ID and Date"
    label: "Incident Date"
    sql: CONCAT(CAST(${iyear} as string),"-",CAST(${imonth} as string),"-",CAST(IF(${iday} = 0, 1, ${iday}) as string));;
    hidden: yes
  }
  dimension_group: time {
    group_label: "Incident Time"
    description: "Date of the Incident if known"
    type: time
    sql: CAST(DATE(all_data.iyear,IF(all_data.imonth = 0, 1, all_data.imonth),IF(all_data.iday = 0, 1, all_data.iday)) as TIMESTAMP);;
    timeframes: [raw,hour,date,day_of_month,month_name, day_of_week,day_of_week_index,week,month,year]
  }

  dimension: approxdate {
    group_label: "GTD ID and Date"
    label: "Approximate Date"
    description: "The most likely date that the Incident took place"
    type: string
    sql: ${TABLE}.approxdate ;;
  }

  dimension: extended {
    group_label: "GTD ID and Date"
    label: "Extended Incident?"
    description: "Let's you know if the Incident lasted for more than 24 hours"
    case: {
      when: {
        sql: ${TABLE}.extended = 1 ;;
          label: "Yes"
      }
      else: "No"
    }

  }

  dimension_group: resolution {
    group_label: "GTD ID and Date"
    label: "Date of Extended Incident Resolution"
    description: "Let's you know at what date an extended Incident was resolved"
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

  dimension: Decade {
    group_label: "GTD ID and Date"
    type: tier
    tiers: [1970, 1980, 1990, 2000, 2010]
    style: integer
    sql: ${TABLE}.iyear ;;
    value_format: "0"
  }


## II. Incident Information

  dimension: summary {
    group_label: "Incident Summary"
    label: "Incident Summary"
    description: "A short summary noting the 'when, where, who, what, how,
and why'"
    type: string
    sql: ${TABLE}.summary ;;
  }

  dimension: crit1 {
    group_label: "Incident Summary"
    label: "Inclusion Criteria - POLITICAL, ECONOMIC, RELIGIOUS, OR SOCIAL GOAL"
    case: {
      when: {
        sql:  ${TABLE}.crit1 = 1  ;;
        label: "Yes"
      }
      else: "No"
    }
  }

  dimension: crit2 {
    group_label: "Incident Summary"
    label: "Inclusion Criteria -  INTENTION TO COERCE, INTIMIDATE OR PUBLICIZE TO LARGER
    AUDIENCE(S)"
    case: {
      when: {
        sql:  ${TABLE}.crit2 = 1  ;;
        label: "Yes"
      }
      else: "No"
    }
  }

  dimension: crit3 {
    group_label: "Incident Summary"
    label: "Inclusion Criteria -  OUTSIDE INTERNATIONAL HUMANITARIAN LAW"
    case: {
      when: {
        sql:  ${TABLE}.crit3 = 1  ;;
        label: "Yes"
      }
      else: "No"
    }
  }

  dimension: doubtterr {
    group_label: "Incident Information"
    label: "Doubt Terrorism Proper?"
    description: "Indicates whether there is doubt regarding the categorization of the incident as an act of terror "
    case: {
      when: {
        sql:  ${TABLE}.doubtterr = 1  ;;
        label: "Yes"
      }
      else: "No"
    }
  }

  dimension: alternative {
    group_label: "Incident Summary"
    type: number
    sql: ${TABLE}.alternative ;;
    hidden: yes
  }

  dimension: alternative_txt {
    group_label: "Incident Summary"
    label: "Alternative Designation"
    description: "Is only relevant if the Incident is doubted to be an actual terrorist attack"
    type: string
    sql: ${TABLE}.alternative_txt ;;
  }

  dimension: multiple {
    group_label: "Incident Summary"
    label: "Part of Multiple Incident"
    description: "Will tell you if there are related incidents"
    case: {
      when: {
        sql: ${TABLE}.multiple = 1 ;;
        label: "Yes"
      }
      else: "No"
    }
  }

  dimension: related {
    group_label: "Incident Summary"
    label: "Related Incidents"
    description: "Displayes the GTD ID if there have been related incidents"
    type: string
    sql: ${TABLE}.related ;;
  }

## III. Incident Location

  dimension: country {
    group_label: "Incident Location"
    label: "Country #Code"
    type: number
    sql: ${TABLE}.country ;;
    hidden: yes
  }

  dimension: country_txt {
    group_label: "Incident Location"
    label: "Country"
    type: string
    sql: ${TABLE}.country_txt ;;
    drill_fields: [time_year,gname,city]
    html: <a href="https://dcl.dev.looker.com/dashboards/97?Country= {{value}} "> {{ value}} </a> ;;
  }

  dimension: region {
    group_label: "Incident Location"
    type: number
    sql: ${TABLE}.region ;;
    hidden: yes
  }

  dimension: region_txt {
    group_label: "Incident Location"
    label: "Region"
    type: string
    sql: ${TABLE}.region_txt ;;
    hidden: yes
  }

  dimension: provstate {
    group_label: "Incident Location"
    label: "Province / Administrative Region /State"
    type: string
    sql: ${TABLE}.provstate ;;
  }

  dimension: city {
    group_label: "Incident Location"
    label: "City"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: vicinity {
    group_label: "Incident Location"
    label: "Vicinity"
    description: "Let's you know whether the attack happened in the immediate vicinity of a city"
    case: {
      when: {
        sql: ${TABLE}.vicinity = 1 ;;
        label: "Yes"
      }
      else: "No"
    }

  }


  dimension: location {
    group_label: "Incident Location"
    label: "Location Details"
    description: "Provides additional information about the location if available"
    type: string
    sql: ${TABLE}.location ;;
    hidden: yes
  }

  dimension: latitude {
    group_label: "Incident Location"
    type: number
    sql: ${TABLE}.latitude ;;
    hidden: yes
  }

  dimension: longitude {
    group_label: "Incident Location"
    type: number
    sql: ${TABLE}.longitude ;;
    hidden: yes
  }
  dimension: map_location {
    group_label: "Incident Location"
    label: "Map Location"
    type: location
    sql_latitude:ROUND(${TABLE}.latitude,2)  ;;
    sql_longitude:ROUND(${TABLE}.longitude,2) ;;
  }

  dimension: specificity {
    group_label: "Incident Location"
    label: "Geocoding Specificity"
    type: number
    sql: ${TABLE}.specificity ;;
    hidden: yes
  }

  dimension: district_ind {
    group_label: "Country specific district"
    label: "India"
    type: string
    map_layer_name:  districts_ind
    sql: ${TABLE}.city ;;
  }

  dimension: district_pak {
    group_label: "Country specific district"
    label: "Pakistan"
    type: string
    map_layer_name:  districts_pak
    sql: ${TABLE}.city ;;
  }

  dimension: district_sri {
    group_label: "Country specific district"
    label: "Sri Lanka"
    type: string
    map_layer_name:  districts_sri
    sql: ${TABLE}.city ;;
  }

  dimension: district_nep {
    group_label: "Country specific district"
    label: "Nepal"
    type: string
    map_layer_name:  districts_nep
    sql: ${TABLE}.city ;;
  }

  dimension: district_bhu {
    group_label: "Country specific district"
    label: "Bhutan"
    type: string
    map_layer_name:  districts_bhu
    sql: ${TABLE}.city ;;
  }

  dimension: district_afg {
    group_label: "Country specific district"
    label: "Afghanistan"
    type: string
    map_layer_name:  districts_afg
    sql: ${TABLE}.city ;;
  }

  dimension: district_mal {
    group_label: "Country specific district"
    label: "Maldives"
    type: string
    map_layer_name:  districts_mal
    sql: ${TABLE}.city ;;
  }

  dimension: district_bgd {
    group_label: "Country specific district"
    label: "Bangladesh"
    type: string
    map_layer_name:  districts_bgd
    sql: ${TABLE}.city ;;
  }


## IV. Attack Information

  dimension: attacktype1 {
    group_label: "Attack Information"
    type: number
    sql: ${TABLE}.attacktype1 ;;
    hidden: yes
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
    hidden: yes
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
    hidden: yes
  }

  dimension: attacktype3_txt {
    group_label: "Attack Information"
    label: "Attack Type 3"
    type: string
    sql: ${TABLE}.attacktype3_txt ;;
  }

  dimension: success {
    group_label: "Attack Information"
    label: "Success"
    case: {
      when: {
        sql:  ${TABLE}.success = 1  ;;
        label: "Yes"
      }
      else: "No"
    }
  }

  dimension: suicide {
    group_label: "Attack Information"
    label: "Suicide Attack"
    case: {
      when: {
        sql:  ${TABLE}.suicide = 1  ;;
        label: "Yes"
      }
      else: "No"
    }
  }

## V. Weapon Information


  dimension: weaptype1 {
    group_label: "Weapon Information"
    type: number
    sql: ${TABLE}.weaptype1 ;;
    hidden: yes
  }

  dimension: weaptype1_txt {
    group_label: "Weapon Information"
    label: "First Weapon Type"
    type: string
    sql: ${TABLE}.weaptype1_txt ;;
  }

  dimension: weapsubtype1 {
    group_label: "Weapon Information"
    type: number
    sql: ${TABLE}.weapsubtype1 ;;
    hidden: yes
  }

  dimension: weapsubtype1_txt {
    group_label: "Weapon Information"
    label: "First Weapon Sub-Type"
    type: string
    sql: ${TABLE}.weapsubtype1_txt ;;
  }

  dimension: weaptype2 {
    group_label: "Weapon Information"
    type: number
    sql: ${TABLE}.weaptype2 ;;
    hidden: yes
  }

  dimension: weaptype2_txt {
    group_label: "Weapon Information"
    label: "Second Weapon Type"
    type: string
    sql: ${TABLE}.weaptype2_txt ;;
  }

  dimension: weapsubtype2 {
    group_label: "Weapon Information"
    type: number
    sql: ${TABLE}.weapsubtype2 ;;
    hidden: yes
  }

  dimension: weapsubtype2_txt {
    group_label: "Weapon Information"
    label: "Second Weapon Sub-Type"
    type: string
    sql: ${TABLE}.weapsubtype2_txt ;;
  }

  dimension: weaptype3 {
    group_label: "Weapon Information"
    type: string
    sql: ${TABLE}.weaptype3 ;;
    hidden: yes
  }

  dimension: weaptype3_txt {
    group_label: "Weapon Information"
    label: "Third Weapon Type"
    type: string
    sql: ${TABLE}.weaptype3_txt ;;
    hidden: yes
  }

  dimension: weapsubtype3 {
    group_label: "Weapon Information"
    type: number
    sql: ${TABLE}.weapsubtype3 ;;
    hidden: yes
  }

  dimension: weapsubtype3_txt {
    group_label: "Weapon Information"
    label: "Third Weapon Sub-Type"
    type: string
    sql: ${TABLE}.weapsubtype3_txt ;;
    hidden: yes
  }

  dimension: weaptype4 {
    group_label: "Weapon Information"
    type: string
    sql: ${TABLE}.weaptype4 ;;
    hidden: yes
  }

  dimension: weaptype4_txt {
    group_label: "Weapon Information"
    label: "Fourth Weapon Type"
    type: string
    sql: ${TABLE}.weaptype4_txt ;;
    hidden: yes
  }

  dimension: weapsubtype4 {
    group_label: "Weapon Information"
    type: string
    sql: ${TABLE}.weapsubtype4 ;;
    hidden: yes
  }

  dimension: weapsubtype4_txt {
    group_label: "Weapon Information"
    label: "Fourth Weapon Sub-Type"
    type: string
    sql: ${TABLE}.weapsubtype4_txt ;;
    hidden: yes
  }

  dimension: weapdetail {
    group_label: "Weapon Information"
    label: "Weapon Details"
    type: string
    sql: ${TABLE}.weapdetail ;;
  }

## VI. Target/Victim Information

  dimension: targtype1 {
    group_label: "Target/Victim Information"
    type: number
    sql: ${TABLE}.targtype1 ;;
    hidden: yes
  }

  dimension: targtype1_txt {
    group_label: "Target/Victim Information"
    label: "Target/Victim Type 1"
    type: string
    sql: ${TABLE}.targtype1_txt ;;
  }

  dimension: targsubtype1 {
    group_label: "Target/Victim Information"
    type: number
    sql: ${TABLE}.targsubtype1 ;;
    hidden: yes
  }

  dimension: targsubtype1_txt {
    group_label: "Target/Victim Information"
    label: "Target/Victim Subtype 1"
    type: string
    sql: ${TABLE}.targsubtype1_txt ;;
  }

  dimension: corp1 {
    group_label: "Target/Victim Information"
    label: "Name of Entity 1"
    type: string
    sql: ${TABLE}.corp1 ;;
  }

  dimension: target1 {
    group_label: "Target/Victim Information"
    label: "Specific Target/Victim 1"
    type: string
    sql: ${TABLE}.target1 ;;
  }

  dimension: natlty1 {
    group_label: "Target/Victim Information"
    type: number
    sql: ${TABLE}.natlty1 ;;
    hidden: yes
  }

  dimension: natlty1_txt {
    group_label: "Target/Victim Information"
    label: "Nationality of Target/Victim 1"
    type: string
    sql: ${TABLE}.natlty1_txt ;;
  }

  dimension: targtype2 {
    group_label: "Target/Victim Information"
    type: number
    sql: ${TABLE}.targtype2 ;;
    hidden: yes
  }

  dimension: targtype2_txt {
    group_label: "Target/Victim Information"
    label: "Target/Victim Type 2"
    type: string
    sql: ${TABLE}.targtype2_txt ;;
  }

  dimension: targsubtype2 {
    group_label: "Target/Victim Information"
    type: number
    sql: ${TABLE}.targsubtype2 ;;
    hidden: yes
  }

  dimension: targsubtype2_txt {
    group_label: "Target/Victim Information"
    label: "Target/Victim Subtype 2"
    type: string
    sql: ${TABLE}.targsubtype2_txt ;;
  }

  dimension: corp2 {
    group_label: "Target/Victim Information"
    label: "Name of Entity 2"
    type: string
    sql: ${TABLE}.corp2 ;;
  }

  dimension: target2 {
    group_label: "Target/Victim Information"
    label: "Specific Target/Victim 2"
    type: string
    sql: ${TABLE}.target2 ;;
  }

  dimension: natlty2 {
    group_label: "Target/Victim Information"
    type: number
    sql: ${TABLE}.natlty2 ;;
    hidden: yes
  }

  dimension: natlty2_txt {
    group_label: "Target/Victim Information"
    label: "Nationality of Target/Victim 2"
    type: string
    sql: ${TABLE}.natlty2_txt ;;
  }

  dimension: targtype3 {
    group_label: "Target/Victim Information"
    type: string
    sql: ${TABLE}.targtype3 ;;
    hidden: yes
  }

  dimension: targtype3_txt {
    group_label: "Target/Victim Information"
    label: "Target/Victim Type 3"
    type: string
    sql: ${TABLE}.targtype3_txt ;;
  }

  dimension: targsubtype3 {
    group_label: "Target/Victim Information"
    type: string
    sql: ${TABLE}.targsubtype3 ;;
    hidden: yes
  }

  dimension: targsubtype3_txt {
    group_label: "Target/Victim Information"
    label: "Target/Victim Subtype 3"
    type: string
    sql: ${TABLE}.targsubtype3_txt ;;
  }

  dimension: corp3 {
    group_label: "Target/Victim Information"
    label: "Name of Entity 3"
    type: string
    sql: ${TABLE}.corp3 ;;
  }

  dimension: target3 {
    group_label: "Target/Victim Information"
    label: "Specific Target/Victim 3"
    type: string
    sql: ${TABLE}.target3 ;;
  }

  dimension: natlty3 {
    group_label: "Target/Victim Information"
    type: string
    sql: ${TABLE}.natlty3 ;;
    hidden: yes
  }

  dimension: natlty3_txt {
    group_label: "Target/Victim Information"
    label: "Nationality of Target/Victim 3"
    type: string
    sql: ${TABLE}.natlty3_txt ;;
  }

## VII. Perpetrator Information

  dimension: gname {
    group_label: "Perpetrator Information"
    label: "Perpetrator Group Name"
    type: string
    sql: ${TABLE}.gname ;;
    html: <a href="/dashboards/94?Group= {{value}} "> {{ value}} </a> ;;

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

  dimension: gsubname {
    group_label: "Perpetrator Information"
    label: "First Perpetrator Sub-Group Name"
    type: string
    sql: ${TABLE}.gsubname ;;
  }

  dimension: gname2 {
    group_label: "Perpetrator Information"
    label: "Second Perpetrator Group Name"
    type: string
    sql: ${TABLE}.gname2 ;;
  }

  dimension: gsubname2 {
    group_label: "Perpetrator Information"
    label: "Second Perpetrator Sub-Group Name"
    type: string
    sql: ${TABLE}.gsubname2 ;;
  }

  dimension: gname3 {
    group_label: "Perpetrator Information"
    label: "Third Perpetrator Group Name"
    type: string
    sql: ${TABLE}.gname3 ;;
  }

  dimension: gsubname3 {
    group_label: "Perpetrator Information"
    label: "Third Perpetrator Sub-Group Name"
    type: string
    sql: ${TABLE}.gsubname3 ;;
  }

  dimension: guncertain1 {
    group_label: "Perpetrator Information"
    label: "First Perpetrator Group Suspected/Unconfirmed?"
    type: number
    sql: ${TABLE}.guncertain1 ;;
  }

  dimension: guncertain2 {
    group_label: "Perpetrator Information"
    label: "Second Perpetrator Group Suspected/Unconfirmed?"
    type: number
    sql: ${TABLE}.guncertain2 ;;
  }

  dimension: guncertain3 {
    group_label: "Perpetrator Information"
    label: "Third Perpetrator Group Suspected/Unconfirmed?"
    type: string
    sql: ${TABLE}.guncertain3 ;;
  }

  dimension: individual {
    group_label: "Perpetrator Information"
    label: "Unaffiliated Individual(s)"
    type: number
    sql: ${TABLE}.individual ;;
  }

  dimension: nperps {
    group_label: "Perpetrator Information"
    label: "Number of Perpetrators"
    type: number
    sql: ${TABLE}.nperps ;;
  }

  dimension: nperpcap {
    group_label: "Perpetrator Information"
    label: "Number of Perpetrators Captured"
    type: number
    sql: ${TABLE}.nperpcap ;;
  }

  dimension: claimed {
    group_label: "Perpetrator Information"
    label: "First Group Claim of Responsibility?"
    type: number
    sql: ${TABLE}.claimed ;;
  }

  dimension: claimmode {
    group_label: "Perpetrator Information"
    type: number
    sql: ${TABLE}.claimmode ;;
    hidden: yes
  }

  dimension: claimmode_txt {
    group_label: "Perpetrator Information"
    label: "Mode for Claim of Responsibility"
    type: string
    sql: ${TABLE}.claimmode_txt ;;
  }

  dimension: compclaim {
    group_label: "Perpetrator Information"
    label: "Competing Claims of Responsibility?"
    type: string
    sql: ${TABLE}.compclaim ;;
  }

  dimension: claim2 {
    group_label: "Perpetrator Information"
    label: "Second Group Claim of Responsibility?"
    type: number
    sql: ${TABLE}.claim2 ;;
  }

  dimension: claimmode2 {
    group_label: "Perpetrator Information"
    type: string
    sql: ${TABLE}.claimmode2 ;;
    hidden: yes
  }

  dimension: claimmode2_txt {
    group_label: "Perpetrator Information"
    label: "Second Mode for Claim of Responsibility"
    type: string
    sql: ${TABLE}.claimmode2_txt ;;
  }

  dimension: claim3 {
    group_label: "Perpetrator Information"
    label: "Third Group Claim of Responsibility?"
    type: string
    sql: ${TABLE}.claim3 ;;
  }

  dimension: claimmode3 {
    group_label: "Perpetrator Information"
    type: string
    sql: ${TABLE}.claimmode3 ;;
    hidden: yes
  }

  dimension: claimmode3_txt {
    group_label: "Perpetrator Information"
    label: "Third Mode for Claim of Responsibility"
    type: string
    sql: ${TABLE}.claimmode3_txt ;;
  }

  dimension: motive {
    group_label: "Perpetrator Information"
    label: "Motive"
    type: string
    sql: ${TABLE}.motive ;;
  }

## VIII. Casualties and Consequences

  dimension: nkill {
    group_label: "Casualties and Consequences"
    label: "Total Number of Fatalities"
    type: number
    sql: ${TABLE}.nkill ;;
  }

  dimension: nkillus {
    group_label: "Casualties and Consequences"
    label: "Number of US Fatalities"
    type: number
    sql: ${TABLE}.nkillus ;;
  }

  dimension: nkillter {
    group_label: "Casualties and Consequences"
    label: "Number of Perpetrator Fatalities"
    type: number
    sql: ${TABLE}.nkillter ;;
  }

  dimension: nwound {
    group_label: "Casualties and Consequences"
    label: "Total Number of Injured"
    type: number
    sql: ${TABLE}.nwound ;;
  }

  dimension: nwoundus {
    group_label: "Casualties and Consequences"
    label: "Number of U.S. Injured"
    type: number
    sql: ${TABLE}.nwoundus ;;
  }

  dimension: nwoundte {
    group_label: "Casualties and Consequences"
    label: "Number of Perpetrators Injured"
    type: number
    sql: ${TABLE}.nwoundte ;;
  }

  dimension: property {
    group_label: "Casualties and Consequences"
    label: "Property Damage"
    type: number
    sql: ${TABLE}.property ;;
  }

  dimension: propextent {
    group_label: "Casualties and Consequences"
    type: number
    sql: ${TABLE}.propextent ;;
    hidden: yes
  }

  dimension: propextent_txt {
    group_label: "Casualties and Consequences"
    label: "Extent of Property Damage"
    type: string
    sql: ${TABLE}.propextent_txt ;;
  }

  dimension: propvalue {
    group_label: "Casualties and Consequences"
    label: "Value of Property Damage (in USD)"
    type: number
    sql: ${TABLE}.propvalue ;;
  }

  dimension: propcomment {
    group_label: "Casualties and Consequences"
    label: "Property Damage Comments"
    type: string
    sql: ${TABLE}.propcomment ;;
  }

  dimension: ishostkid {
    group_label: "Casualties and Consequences"
    label: "Hostages or Kidnapping Victims"
    type: number
    value_format_name: id
    sql: ${TABLE}.ishostkid ;;
  }

  dimension: nhostkid {
    group_label: "Casualties and Consequences"
    label: "Total Number of Hostages/ Kidnapping Victims"
    type: number
    value_format_name: id
    sql: ${TABLE}.nhostkid ;;
  }

  dimension: nhostkidus {
    group_label: "Casualties and Consequences"
    label: "Number of U.S. Hostages/ Kidnapping Victims"
    type: number
    sql: ${TABLE}.nhostkidus ;;
  }

  dimension: nhours {
    group_label: "Casualties and Consequences"
    label: "Hours of Kidnapping / Hostage Incident"
    type: number
    sql: ${TABLE}.nhours ;;
  }

  dimension: ndays {
    group_label: "Casualties and Consequences"
    label: "Days of Kidnapping / Hostage Incident"
    type: number
    sql: ${TABLE}.ndays ;;
  }

  dimension: divert {
    group_label: "Casualties and Consequences"
    label: "Country That Kidnappers/Hijackers Diverted To"
    type: string
    sql: ${TABLE}.divert ;;
  }

  dimension: kidhijcountry {
    group_label: "Casualties and Consequences"
    label: "Country of Kidnapping/Hijacking Resolution"
    type: string
    sql: ${TABLE}.kidhijcountry ;;
  }

  dimension: ransom {
    group_label: "Casualties and Consequences"
    label: "Ransom Demanded"
    type: number
    sql: ${TABLE}.ransom ;;
  }

  dimension: ransomamt {
    group_label: "Casualties and Consequences"
    label: "Total Ransom Amount Demanded"
    type: number
    sql: ${TABLE}.ransomamt ;;
  }

  dimension: ransomamtus {
    group_label: "Casualties and Consequences"
    label: "Ransom Amount Demanded from U.S. Sources"
    type: string
    sql: ${TABLE}.ransomamtus ;;
  }

  dimension: ransompaid {
    group_label: "Casualties and Consequences"
    label: "Total Ransom Amount Paid"
    type: number
    value_format_name: id
    sql: ${TABLE}.ransompaid ;;
  }

  dimension: ransompaidus {
    group_label: "Casualties and Consequences"
    label: "Ransom Amount Paid By U.S. Sources"
    type: string
    sql: ${TABLE}.ransompaidus ;;
  }

  dimension: ransomnote {
    group_label: "Casualties and Consequences"
    label: "Ransom Notes"
    type: string
    sql: ${TABLE}.ransomnote ;;
  }

  dimension: hostkidoutcome {
    group_label: "Casualties and Consequences"
    type: number
    sql: ${TABLE}.hostkidoutcome ;;
  }

  dimension: hostkidoutcome_txt {
    group_label: "Casualties and Consequences"
    label: "Kidnapping/Hostage Outcome"
    type: string
    sql: ${TABLE}.hostkidoutcome_txt ;;
  }

  dimension: nreleased {
    group_label: "Casualties and Consequences"
    label: "Number Released/Escaped/Rescued"
    type: number
    sql: ${TABLE}.nreleased ;;
  }

## IX. Additional Information and Sources

  dimension: addnotes {
    group_label: "Additional Information and Sources"
    label: "Additional Notes"
    type: string
    sql: ${TABLE}.addnotes ;;
  }

  dimension: int_log {
    group_label: "Additional Information and Sources"
    label: "International- Logistical"
    type: number
    sql: ${TABLE}.INT_LOG ;;
  }

  dimension: int_ideo {
    group_label: "Additional Information and Sources"
    label: "International- Ideological"
    type: number
    value_format_name: id
    sql: ${TABLE}.INT_IDEO ;;
  }

  dimension: int_misc {
    group_label: "Additional Information and Sources"
    label: "International- Miscellaneous"
    type: number
    sql: ${TABLE}.INT_MISC ;;
  }

  dimension: int_any {
    group_label: "Additional Information and Sources"
    label: "International- Any of the above"
    type: number
    sql: ${TABLE}.INT_ANY ;;
  }

  dimension: scite1 {
    group_label: "Additional Information and Sources"
    label: "First Source Citation"
    type: string
    sql: ${TABLE}.scite1 ;;
  }

  dimension: scite2 {
    group_label: "Additional Information and Sources"
    label: "Second Source Citation"
    type: string
    sql: ${TABLE}.scite2 ;;
  }

  dimension: scite3 {
    group_label: "Additional Information and Sources"
    label: "Third Source Citation"
    type: string
    sql: ${TABLE}.scite3 ;;
  }

  dimension: dbsource {
    group_label: "Additional Information and Sources"
    label: "Data Collection"
    type: string
    sql: ${TABLE}.dbsource ;;
  }


###### Measures and Stuff

  measure: count {
    type: count
  }

  measure: sum {
    type: sum
    }
}
