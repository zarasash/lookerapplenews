include: "/_public/data-mart/reporting/stats_daily.layer.lkml"

# Look Ups
include: "/_public/lookups/master_entity_map.layer.lkml"
include: "/_public/lookups/master_entity_list.layer.lkml"
include: "/_public/lookups/master_entity_verticals.layer.lkml"
include: "/_public/lookups/calendar.layer.lkml"
include: "/_public/lookups/master_entity_custom_verticals.layer.lkml"

view: top_entities_daily_stats {
  derived_table: {
    explore_source: daily_stats_1 {
      column: total_views {
        field: daily_stats_1.total_views
      }

      column: entity_split {
        field: daily_stats_1.parent_entity
      }

      derived_column: rank {
        sql: RANK() OVER (ORDER BY total_views DESC) ;;
      }

      bind_all_filters: yes

      sort: {
        field: daily_stats_1.total_views
        desc: yes
      }
    }
  }

  dimension: total_views {
    type: number
    sql: ${TABLE}.total_views ;;
  }

  dimension: entity_split {
    type: string
    sql: ${TABLE}.entity_split ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: ranked_entity {
    type: string
    sql:
      CASE
        WHEN ${rank} < 10 THEN '0' || ${rank} || ') ' || ${entity_split}
        ELSE ${rank} || ') ' || ${entity_split}
      END ;;
  }
}

explore: daily_stats_1 {
  group_label: "Public Reporting"
  label: "Daily Stats"
  view_label: "Daily Stats"
  from: daily_stats

  sql_always_where: ${date_date} <= CURRENT_DATE() ;;

  join: master_entity_list {
    type: left_outer
    sql_on: LOWER(${daily_stats_1.parent_entity}) = LOWER(${master_entity_list.parent_entity}) ;;
    relationship: many_to_one
  }

  join: master_entity_verticals {
    type: left_outer
    sql_on: LOWER(${master_entity_list.parent_entity}) = LOWER(${master_entity_verticals.parent_entity}) ;;
    relationship: one_to_one
  }

  join: calendar {
    type: left_outer
    sql_on: ${daily_stats_1.date_date} = ${calendar.date_date} ;;
    relationship: many_to_one
  }


join: top_entities_daily_stats {
  type: left_outer
  sql_on: LOWER(${daily_stats_1.parent_entity}) = LOWER(${top_entities_daily_stats.entity_split}) ;;
  relationship: many_to_one
}
}
