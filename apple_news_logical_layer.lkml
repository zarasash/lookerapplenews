# ===================================================================================================================================
# Description       : File to create explores to be leveraged in core audience apple news reporting
# Author            : Zahra Safdari
# Created On        : 20 May 2025
# Last Updated      :
# -----------------------------------------------------------------------------------------------------------------------------------
# Change logs       : Version 1.0.0 - Explore created
# -----------------------------------------------------------------------------------------------------------------------------------
# Prerequisites     : "/_standard/datamart-internal/audience_core/apple_news_stats_daily.layer.lkml"
# -----------------------------------------------------------------------------------------------------------------------------------
# Dependencies      : Apple News Dashboard dashboards
# -----------------------------------------------------------------------------------------------------------------------------------
# Additional notes  :
# -----------------------------------------------------------------------------------------------------------------------------------


include: "/_standard/datamart-internal/audience_core/apple_news_stats_daily.layer.lkml"

# Look Ups
include: "/_standard/future-api/lookups/master_brand_brand_map.layer.lkml"
include: "/_standard/future-api/lookups/master_brand_parent_list.layer.lkml"
include: "/_standard/future-api/lookups/master_brand_mi_verticals.layer.lkml"
include: "/_standard/future-api/lookups/calendar.layer.lkml"
include: "/_standard/future-api/lookups/master_brand_custom_verticals.layer.lkml"

view: top_brands_apple_news_stats_daily {
  derived_table: {
    explore_source: apple_news_stats_daily_1 {
      column: total_pageviews {
        field: apple_news_stats_daily_1.total_pageviews
      }

      column: brand_split {
        field: apple_news_stats_daily_1.parent_brand
      }

      derived_column: rank {
        sql: RANK() OVER (ORDER BY total_pageviews DESC) ;;
      }

      bind_all_filters: yes

      sort: {
        field: apple_news_stats_daily_1.total_pageviews
        desc: yes
      }
    }
  }

  dimension: total_pageviews {
    type: number
    sql: ${TABLE}.total_pageviews ;;
  }

  dimension: brand_split {
    type: string
    sql: ${TABLE}.brand_split ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: ranked_brand {
    type: string
    sql:
      CASE
        WHEN ${rank} < 10 THEN '0' || ${rank} || ') ' || ${brand_split}
        ELSE ${rank} || ') ' || ${brand_split}
      END ;;
  }
}

explore: apple_news_stats_daily_1 {
  group_label: "Audience Core"
  label: "Daily Apple News Stats"
  view_label: "Daily Apple News Stats"
  from: apple_news_stats_daily

  sql_always_where: ${date_date} <= CURRENT_DATE() ;;

  join: master_brand_parent_list {
    type: left_outer
    sql_on: LOWER(${apple_news_stats_daily_1.parent_brand}) = LOWER(${master_brand_parent_list.parent_brand}) ;;
    relationship: many_to_one
  }

  join: master_brand_mi_verticals {
    type: left_outer
    sql_on: LOWER(${master_brand_parent_list.parent_brand}) = LOWER(${master_brand_mi_verticals.parent_brand}) ;;
    relationship: one_to_one
  }

  join: calendar {
    type: left_outer
    sql_on: ${apple_news_stats_daily_1.date_date} = ${calendar.date_date} ;;
    relationship: many_to_one
  }


join: top_brands_apple_news_stats_daily {
  type: left_outer
  sql_on: LOWER(${apple_news_stats_daily_1.parent_brand}) = LOWER(${top_brands_apple_news_stats_daily.brand_split}) ;;
  relationship: many_to_one
}
}
