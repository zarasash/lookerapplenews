# This LookML view file has been anonymized for public sharing.
# All specific business names, table names, and proprietary terms have been replaced
# with generic, descriptive equivalents to demonstrate the structure without
# revealing sensitive information.

view: analytics_metrics_daily {
  sql_table_name: `project.schema.anonymized_metrics_daily` ;;

  # --- General Dimensions ---

  dimension: hash_key {
    type: string
    description: "A unique identifier for each combination of date, brand, and site domain."
    sql: ${TABLE}.hash_key ;;
  }

  dimension: parent_brand {
    type: string
    description: "The parent brand for the site, joined from a brand mapping table."
    sql: ${TABLE}.parent_brand ;;
  }

  dimension: site_domain {
    type: string
    description: "The clean website domain, without 'www' or a trailing slash."
    sql: ${TABLE}.site_domain ;;
  }

  dimension_group: date {
    type: time
    description: "The day of the data, in YYYY-MM-DD format."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  # --- Core Metrics ---

  dimension: users {
    type: number
    description: "The count of distinct user identifiers."
    sql: ${TABLE}.users ;;
  }

  dimension: free_tier_users {
    type: number
    description: "The count of distinct users who are not premium members."
    sql: ${TABLE}.free_tier_users ;;
  }

  dimension: premium_users {
    type: number
    description: "The count of distinct users who are premium members."
    sql: ${TABLE}.premium_users ;;
  }

  dimension: unique_pageviews {
    type: number
    description: "The count of distinct, de-duped content view events."
    sql: ${TABLE}.unique_pageviews ;;
  }

  dimension: pageviews {
    type: number
    description: "The total count of all content view events."
    sql: ${TABLE}.pageviews ;;
  }

  dimension: total_engagement_time {
    type: number
    description: "The total time in seconds a user was engaged with the content."
    sql: ${TABLE}.total_engagement_time ;;
  }

  dimension: call_to_action_clicks {
    type: number
    description: "The total count of clicks on affiliate or promotional links."
    sql: ${TABLE}.call_to_action_clicks ;;
  }

  # --- Commerce Metrics ---

  dimension: commerce_revenue_usd {
    type: number
    description: "Revenue from commerce, converted to USD."
    sql: ${TABLE}.commerce_revenue_usd ;;
  }

  dimension: commerce_revenue_gbp {
    type: number
    description: "Revenue from commerce, converted to GBP."
    sql: ${TABLE}.commerce_revenue_gbp ;;
  }

  dimension: commerce_sales_order_value_usd {
    type: number
    description: "The total sales order value, converted to USD."
    sql: ${TABLE}.commerce_sales_order_value_usd ;;
  }

  dimension: commerce_sales_order_value_gbp {
    type: number
    description: "The total sales order value, converted to GBP."
    sql: ${TABLE}.commerce_sales_order_value_gbp ;;
  }

  dimension: commerce_transactions {
    type: number
    description: "The count of site-level commerce transactions."
    sql: ${TABLE}.commerce_transactions ;;
  }

  # --- Advertising Metrics ---

  dimension: ads_impressions {
    type: number
    description: "The sum of ad impressions."
    sql: ${TABLE}.ads_impressions ;;
  }

  dimension: ads_revenue_usd_daily {
    type: number
    description: "The sum of ad revenue in USD on a daily basis."
    sql: ${TABLE}.ads_revenue_usd_daily ;;
  }

  dimension: ads_revenue_gbp_daily {
    type: number
    description: "The sum of ad revenue converted to GBP on a daily basis."
    sql: ${TABLE}.ads_revenue_gbp_daily ;;
  }

  dimension: ads_revenue_gbp_monthly {
    type: number
    description: "The sum of ad revenue in GBP, calculated using a monthly exchange rate."
    sql: ${TABLE}.ads_revenue_gbp_monthly ;;
  }

  # --- Comparison Metrics (1 Week Ago) ---

  dimension: users_1_week_ago {
    type: number
    description: "Distinct users from one week prior."
    sql: ${TABLE}.users_1_week_ago ;;
  }

  dimension: free_tier_users_1_week_ago {
    type: number
    description: "Free-tier users from one week prior."
    sql: ${TABLE}.free_tier_users_1_week_ago ;;
  }

  dimension: premium_users_1_week_ago {
    type: number
    description: "Premium users from one week prior."
    sql: ${TABLE}.premium_users_1_week_ago ;;
  }

  dimension: unique_pageviews_1_week_ago {
    type: number
    description: "Unique pageviews from one week prior."
    sql: ${TABLE}.unique_pageviews_1_week_ago ;;
  }

  dimension: pageviews_1_week_ago {
    type: number
    description: "Pageviews from one week prior."
    sql: ${TABLE}.pageviews_1_week_ago ;;
  }

  dimension: call_to_action_clicks_1_week_ago {
    type: number
    description: "Call-to-action clicks from one week prior."
    sql: ${TABLE}.call_to_action_clicks_1_week_ago ;;
  }

  dimension: total_engagement_time_1_week_ago {
    type: number
    description: "Total engagement time from one week prior."
    sql: ${TABLE}.total_engagement_time_1_week_ago ;;
  }

  dimension: commerce_revenue_usd_1_week_ago {
    type: number
    description: "Commerce revenue in USD from one week prior."
    sql: ${TABLE}.commerce_revenue_usd_1_week_ago ;;
  }

  dimension: commerce_revenue_gbp_1_week_ago {
    type: number
    description: "Commerce revenue in GBP from one week prior."
    sql: ${TABLE}.commerce_revenue_gbp_1_week_ago ;;
  }

  dimension: commerce_sales_order_value_usd_1_week_ago {
    type: number
    description: "Sales order value in USD from one week prior."
    sql: ${TABLE}.commerce_sales_order_value_usd_1_week_ago ;;
  }

  dimension: commerce_sales_order_value_gbp_1_week_ago {
    type: number
    description: "Sales order value in GBP from one week prior."
    sql: ${TABLE}.commerce_sales_order_value_gbp_1_week_ago ;;
  }

  dimension: commerce_transactions_1_week_ago {
    type: number
    description: "Commerce transactions from one week prior."
    sql: ${TABLE}.commerce_transactions_1_week_ago ;;
  }

  dimension: ads_impressions_1_week_ago {
    type: number
    description: "Ad impressions from one week prior."
    sql: ${TABLE}.ads_impressions_1_week_ago ;;
  }

  dimension: ads_revenue_usd_daily_1_week_ago {
    type: number
    description: "Daily ad revenue in USD from one week prior."
    sql: ${TABLE}.ads_revenue_usd_daily_1_week_ago ;;
  }

  dimension: ads_revenue_gbp_daily_1_week_ago {
    type: number
    description: "Daily ad revenue in GBP from one week prior."
    sql: ${TABLE}.ads_revenue_gbp_daily_1_week_ago ;;
  }

  dimension: ads_revenue_gbp_monthly_1_week_ago {
    type: number
    description: "Monthly ad revenue in GBP from one week prior."
    sql: ${TABLE}.ads_revenue_gbp_monthly_1_week_ago ;;
  }

  # --- Comparison Metrics (2 Weeks Ago) ---

  dimension: users_2_week_ago {
    type: number
    description: "Distinct users from two weeks prior."
    sql: ${TABLE}.users_2_week_ago ;;
  }

  dimension: free_tier_users_2_week_ago {
    type: number
    description: "Free-tier users from two weeks prior."
    sql: ${TABLE}.free_tier_users_2_week_ago ;;
  }

  dimension: premium_users_2_week_ago {
    type: number
    description: "Premium users from two weeks prior."
    sql: ${TABLE}.premium_users_2_week_ago ;;
  }

  dimension: unique_pageviews_2_week_ago {
    type: number
    description: "Unique pageviews from two weeks prior."
    sql: ${TABLE}.unique_pageviews_2_week_ago ;;
  }

  dimension: pageviews_2_week_ago {
    type: number
    description: "Pageviews from two weeks prior."
    sql: ${TABLE}.pageviews_2_week_ago ;;
  }

  dimension: call_to_action_clicks_2_week_ago {
    type: number
    description: "Call-to-action clicks from two weeks prior."
    sql: ${TABLE}.call_to_action_clicks_2_week_ago ;;
  }

  dimension: total_engagement_time_2_week_ago {
    type: number
    description: "Total engagement time from two weeks prior."
    sql: ${TABLE}.total_engagement_time_2_week_ago ;;
  }

  dimension: commerce_revenue_usd_2_week_ago {
    type: number
    description: "Commerce revenue in USD from two weeks prior."
    sql: ${TABLE}.commerce_revenue_usd_2_week_ago ;;
  }

  dimension: commerce_revenue_gbp_2_week_ago {
    type: number
    description: "Commerce revenue in GBP from two weeks prior."
    sql: ${TABLE}.commerce_revenue_gbp_2_week_ago ;;
  }

  dimension: commerce_sales_order_value_usd_2_week_ago {
    type: number
    description: "Sales order value in USD from two weeks prior."
    sql: ${TABLE}.commerce_sales_order_value_usd_2_week_ago ;;
  }

  dimension: commerce_sales_order_value_gbp_2_week_ago {
    type: number
    description: "Sales order value in GBP from two weeks prior."
    sql: ${TABLE}.commerce_sales_order_value_gbp_2_week_ago ;;
  }

  dimension: commerce_transactions_2_week_ago {
    type: number
    description: "Commerce transactions from two weeks prior."
    sql: ${TABLE}.commerce_transactions_2_week_ago ;;
  }

  dimension: ads_impressions_2_week_ago {
    type: number
    description: "Ad impressions from two weeks prior."
    sql: ${TABLE}.ads_impressions_2_week_ago ;;
  }

  dimension: ads_revenue_usd_daily_2_week_ago {
    type: number
    description: "Daily ad revenue in USD from two weeks prior."
    sql: ${TABLE}.ads_revenue_usd_daily_2_week_ago ;;
  }

  dimension: ads_revenue_gbp_daily_2_week_ago {
    type: number
    description: "Daily ad revenue in GBP from two weeks prior."
    sql: ${TABLE}.ads_revenue_gbp_daily_2_week_ago ;;
  }

  dimension: ads_revenue_gbp_monthly_2_week_ago {
    type: number
    description: "Monthly ad revenue in GBP from two weeks prior."
    sql: ${TABLE}.ads_revenue_gbp_monthly_2_week_ago ;;
  }

  # --- Comparison Metrics (4 Weeks Ago) ---

  dimension: users_4_week_ago {
    type: number
    description: "Distinct users from four weeks prior."
    sql: ${TABLE}.users_4_week_ago ;;
  }

  dimension: free_tier_users_4_week_ago {
    type: number
    description: "Free-tier users from four weeks prior."
    sql: ${TABLE}.free_tier_users_4_week_ago ;;
  }

  dimension: premium_users_4_week_ago {
    type: number
    description: "Premium users from four weeks prior."
    sql: ${TABLE}.premium_users_4_week_ago ;;
  }

  dimension: unique_pageviews_4_week_ago {
    type: number
    description: "Unique pageviews from four weeks prior."
    sql: ${TABLE}.unique_pageviews_4_week_ago ;;
  }

  dimension: pageviews_4_week_ago {
    type: number
    description: "Pageviews from four weeks prior."
    sql: ${TABLE}.pageviews_4_week_ago ;;
  }

  dimension: call_to_action_clicks_4_week_ago {
    type: number
    description: "Call-to-action clicks from four weeks prior."
    sql: ${TABLE}.call_to_action_clicks_4_week_ago ;;
  }

  dimension: total_engagement_time_4_week_ago {
    type: number
    description: "Total engagement time from four weeks prior."
    sql: ${TABLE}.total_engagement_time_4_week_ago ;;
  }

  dimension: commerce_revenue_usd_4_week_ago {
    type: number
    description: "Commerce revenue in USD from four weeks prior."
    sql: ${TABLE}.commerce_revenue_usd_4_week_ago ;;
  }

  dimension: commerce_revenue_gbp_4_week_ago {
    type: number
    description: "Commerce revenue in GBP from four weeks prior."
    sql: ${TABLE}.commerce_revenue_gbp_4_week_ago ;;
  }

  dimension: commerce_sales_order_value_usd_4_week_ago {
    type: number
    description: "Sales order value in USD from four weeks prior."
    sql: ${TABLE}.commerce_sales_order_value_usd_4_week_ago ;;
  }

  dimension: commerce_sales_order_value_gbp_4_week_ago {
    type: number
    description: "Sales order value in GBP from four weeks prior."
    sql: ${TABLE}.commerce_sales_order_value_gbp_4_week_ago ;;
  }

  dimension: commerce_transactions_4_week_ago {
    type: number
    description: "Commerce transactions from four weeks prior."
    sql: ${TABLE}.commerce_transactions_4_week_ago ;;
  }

  dimension: ads_impressions_4_week_ago {
    type: number
    description: "Ad impressions from four weeks prior."
    sql: ${TABLE}.ads_impressions_4_week_ago ;;
  }

  dimension: ads_revenue_usd_daily_4_week_ago {
    type: number
    description: "Daily ad revenue in USD from four weeks prior."
    sql: ${TABLE}.ads_revenue_usd_daily_4_week_ago ;;
  }

  dimension: ads_revenue_gbp_daily_4_week_ago {
    type: number
    description: "Daily ad revenue in GBP from four weeks prior."
    sql: ${TABLE}.ads_revenue_gbp_daily_4_week_ago ;;
  }

  dimension: ads_revenue_gbp_monthly_4_week_ago {
    type: number
    description: "Monthly ad revenue in GBP from four weeks prior."
    sql: ${TABLE}.ads_revenue_gbp_monthly_4_week_ago ;;
  }

  # --- Comparison Metrics (52 Weeks Ago) ---

  dimension: users_52_week_ago {
    type: number
    description: "Distinct users from 52 weeks prior."
    sql: ${TABLE}.users_52_week_ago ;;
  }

  dimension: free_tier_users_52_week_ago {
    type: number
    description: "Free-tier users from 52 weeks prior."
    sql: ${TABLE}.free_tier_users_52_week_ago ;;
  }

  dimension: premium_users_52_week_ago {
    type: number
    description: "Premium users from 52 weeks prior."
    sql: ${TABLE}.premium_users_52_week_ago ;;
  }

  dimension: unique_pageviews_52_week_ago {
    type: number
    description: "Unique pageviews from 52 weeks prior."
    sql: ${TABLE}.unique_pageviews_52_week_ago ;;
  }

  dimension: pageviews_52_week_ago {
    type: number
    description: "Pageviews from 52 weeks prior."
    sql: ${TABLE}.pageviews_52_week_ago ;;
  }

  dimension: call_to_action_clicks_52_week_ago {
    type: number
    description: "Call-to-action clicks from 52 weeks prior."
    sql: ${TABLE}.call_to_action_clicks_52_week_ago ;;
  }

  dimension: total_engagement_time_52_week_ago {
    type: number
    description: "Total engagement time from 52 weeks prior."
    sql: ${TABLE}.total_engagement_time_52_week_ago ;;
  }

  dimension: commerce_revenue_usd_52_week_ago {
    type: number
    description: "Commerce revenue in USD from 52 weeks prior."
    sql: ${TABLE}.commerce_revenue_usd_52_week_ago ;;
  }

  dimension: commerce_revenue_gbp_52_week_ago {
    type: number
    description: "Commerce revenue in GBP from 52 weeks prior."
    sql: ${TABLE}.commerce_revenue_gbp_52_week_ago ;;
  }

  dimension: commerce_sales_order_value_usd_52_week_ago {
    type: number
    description: "Sales order value in USD from 52 weeks prior."
    sql: ${TABLE}.commerce_sales_order_value_usd_52_week_ago ;;
  }

  dimension: commerce_sales_order_value_gbp_52_week_ago {
    type: number
    description: "Sales order value in GBP from 52 weeks prior."
    sql: ${TABLE}.commerce_sales_order_value_gbp_52_week_ago ;;
  }

  dimension: commerce_transactions_52_week_ago {
    type: number
    description: "Commerce transactions from 52 weeks prior."
    sql: ${TABLE}.commerce_transactions_52_week_ago ;;
  }

  dimension: ads_impressions_52_week_ago {
    type: number
    description: "Ad impressions from 52 weeks prior."
    sql: ${TABLE}.ads_impressions_52_week_ago ;;
  }

  dimension: ads_revenue_usd_daily_52_week_ago {
    type: number
    description: "Daily ad revenue in USD from 52 weeks prior."
    sql: ${TABLE}.ads_revenue_usd_daily_52_week_ago ;;
  }

  dimension: ads_revenue_gbp_daily_52_week_ago {
    type: number
    description: "Daily ad revenue in GBP from 52 weeks prior."
    sql: ${TABLE}.ads_revenue_gbp_daily_52_week_ago ;;
  }

  dimension: ads_revenue_gbp_monthly_52_week_ago {
    type: number
    description: "Monthly ad revenue in GBP from 52 weeks prior."
    sql: ${TABLE}.ads_revenue_gbp_monthly_52_week_ago ;;
  }

  # --- Measures ---

  measure: count {
    type: count
  }
}
