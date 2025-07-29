# ===================================================================================================================================
# Description       : Aggregated daily view of topline Apple News performance combined with ecom and Ads, including comparitive date metrics
# Author            : Zahra Safdari
# Created On        : 20 May 2025
# Last Updated      : 28 May 2025
# -----------------------------------------------------------------------------------------------------------------------------------
# Change logs       : Version 1.0.0
#                   :
# -----------------------------------------------------------------------------------------------------------------------------------
# Prerequisites     : /_base/datamart-internal/audiene_core/apple_news_stats_daily.view.lkml
# -----------------------------------------------------------------------------------------------------------------------------------
# Dependents        : /logical/audience/audiene_core.explore.lkml
# -----------------------------------------------------------------------------------------------------------------------------------
# Additional notes  :
# -----------------------------------------------------------------------------------------------------------------------------------
include: "/_base/datamart-internal/audience_core/apple_news_stats_daily.view.lkml"

view: +apple_news_stats_daily {

# Measure Selectors
# To be used to dynamically change the comparative date dimensions in Looks and Dashboards

  parameter: comparison_period {
    view_label: "Utility"
    type: unquoted

    allowed_value: {
      label: "Prior 7 Days"
      value: "7_days_ago"
    }
    allowed_value: {
      label: "Prior 14 Days"
      value: "14_days_ago"
    }
    allowed_value: {
      label: "Prior 28 Days"
      value: "28_days_ago"
    }
    allowed_value: {
      label: "Prior 52 Weeks"
      value: "52_weeks_ago"
    }
  }

  parameter: currency_selector {
    view_label: "Utility"
    type: unquoted

    allowed_value: {
      label: "GBP"
      value: "gbp"
    }
    allowed_value: {
      label: "USD"
      value: "usd"
    }
  }

# ------------------------------------------------------------------------------------------------------------------------------------------------
# Ad Impressions

  measure: total_ad_impressions {
    type: sum
    group_label: "Ad Impressions"
    label: "Total Ad Impressions"
    description: "Total impressions - number of times the ad was seen that day"
    sql: ${ads_impressions};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  measure: total_ad_impressions_1_week_ago {
    type: sum
    group_label: "Ad Impressions"
    label: "Total Ad Impressions 1 week ago"
    description: "Total impressions - number of times the ad was seen - same day 7 days ago"
    sql: ${ads_impressions_1_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

# Comparative metrics

  measure: total_ad_impressions_difference_current_vs_1_week_ago {
    type:  number
    group_label: "Ad Impressions"
    label: "Ad Impressions: Difference vs 1 week Ago"
    description: "Total ad impression difference  (Current vs 1 week Ago)"
    sql: ${total_ad_impressions}-${total_ad_impressions_1_week_ago} ;;
    value_format: "#,###"
  }

  measure: total_ad_impressions_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "Ad Impressions"
    label: "Ad Impressions: % Difference vs 1 week Ago"
    description: "Ad impressions, percentage difference (Current vs 1 week Ago)"
    sql:  CASE
                  WHEN ${total_ad_impressions_1_week_ago} = 0 THEN 0
                  ELSE ${total_ad_impressions_difference_current_vs_1_week_ago}/${total_ad_impressions_1_week_ago}
                END;;
    value_format_name: percent_1
  }


  measure: total_ad_impressions_2_weeks_ago {
    type: sum
    group_label: "Ad Impressions"
    label: "Total Ad Impressions 2 weeks ago"
    description: "Total impressions - number of times the ad was seen - same day 14 days ago"
    sql: ${ads_impressions_2_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  # Comparative metrics

  measure: total_ad_impressions_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "Ad Impressions"
    label: "Ad Impressions: Difference vs 2 Weeks Ago"
    description: "Total ad impression difference  (Current vs 2 Weeks Ago)"
    sql: ${total_ad_impressions}-${total_ad_impressions_2_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_ad_impressions_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "Ad Impressions"
    label: "Ad Impressions: % Difference vs 2 Weeks Ago"
    description: "Ad impressions, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ad_impressions_2_weeks_ago} = 0 THEN 0
                  ELSE ${total_ad_impressions_difference_current_vs_2_weeks_ago}/${total_ad_impressions_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }



  measure: total_ad_impressions_4_weeks_ago {
    type: sum
    group_label: "Ad Impressions"
    label: "Total Ad Impressions 4 weeks ago"
    description: "Total impressions - number of times the ad was seen - same day 28 days ago"
    sql: ${ads_impressions_4_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  # Comparative metrics

  measure: total_ad_impressions_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "Ad Impressions"
    label: "Ad Impressions: Difference vs 4 Weeks Ago"
    description: "Total ad impression difference  (Current vs 4 Weeks Ago)"
    sql: ${total_ad_impressions}-${total_ad_impressions_4_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_ad_impressions_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "Ad Impressions"
    label: "Ad Impressions: % Difference vs 4 Weeks Ago"
    description: "Ad impressions, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ad_impressions_4_weeks_ago} = 0 THEN 0
                  ELSE ${total_ad_impressions_difference_current_vs_4_weeks_ago}/${total_ad_impressions_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ad_impressions_52_weeks_ago {
    type: sum
    group_label: "Ad Impressions"
    label: "Total Ad Impressions 52 weeks ago"
    description: "Total impressions - number of times the ad was seen - same day 52 weeks ago"
    sql: ${ads_impressions_52_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  # Comparative metrics

  measure: total_ad_impressions_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "Ad Impressions"
    label: "Ad Impressions: Difference vs 52 Weeks Ago"
    description: "Total ad impression difference (Current vs 52 Weeks Ago)"
    sql: ${total_ad_impressions}-${total_ad_impressions_52_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_ad_impressions_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "Ad Impressions"
    label: "Ad Impressions: % Difference vs 52 Weeks Ago"
    description: "Ad impressions, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ad_impressions_52_weeks_ago} = 0 THEN 0
                  ELSE ${total_ad_impressions_difference_current_vs_52_weeks_ago}/${total_ad_impressions_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }


# Dynamic Comparisons

  measure: total_ad_impressions_comparison_period {
    group_label: "Ad Impressions"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad Impressions 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad Impressions 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad Impressions 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad Impressions 52 weeks ago
    {% else %} Ad Impressions in Comparison Period
    {% endif %}"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ad_impressions_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ad_impressions_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ad_impressions_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ad_impressions_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ad_impressions_difference_vs_comparison_period {
    group_label: "Ad Impressions"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad Impressions: Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad Impressions: Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad Impressions: Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad Impressions: Difference vs 52 weeks ago
    {% else %} Ad Impressions: Difference vs Comparison Period
    {% endif %}"
    description: "Total ad impression difference (Current vs chosen prior period)"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ad_impressions_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ad_impressions_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ad_impressions_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ad_impressions_difference_current_vs_52_weeks_ago}
      {% else %} NULL
      {% endif %} ;;
  }

  measure: total_ad_impressions_pct_change_vs_comparison_period {
    group_label: "Ad Impressions"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad Impressions: % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad Impressions: % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad Impressions: % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad Impressions: % Difference vs 52 weeks ago
    {% else %} Ad Impressions: % Difference vs Comparison Period
    {% endif %}"
    description: "Ad impressions, percentage difference (Current vs chosen prior period)"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ad_impressions_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ad_impressions_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ad_impressions_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ad_impressions_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }

# ------------------------------------------------------------------------------------------------------------------------------------------------
# AD REVENUE GBP

  measure: total_ad_revenue_gbp {
    type: sum
    group_label: "Ad Revenue GBP"
    label: "Total Ad Revenue GBP"
    description: "Total advertising revenue converted to GBP using Netsuite exchange rate (or Fixer.io if Netsuite is not available) of the last day of the month - or latest daily rate if not yet at month end"
    sql: ${ads_revenue_gbp_daily};;
    value_format: "[>=1000000]\"£\"0.0,,\"M\";[>=1000]\"£\"0.0,\"K\";\"£\"0.0"
  }

  measure: total_ad_revenue_gbp_1_week_ago {
    type: sum
    group_label: "Ad Revenue GBP"
    label: "Total Ad Revenue GBP 1 week ago"
    description: "Total advertising revenue converted to GBP using Netsuite exchange rate (or Fixer.io if Netsuite is not available) of the last day of the month - or latest daily rate if not yet at month end - same day 7 days ago"
    sql: ${ads_revenue_gbp_daily_1_week_ago};;
    value_format_name: gbp
  }

  # Comparative metrics

  measure: total_ad_revenue_gbp_difference_current_vs_1_week_ago {
    type:  number
    group_label: "Ad Revenue GBP"
    label: "Ad Revenue GBP: Difference vs 1 Week Ago"
    description: "Ad revenue gbp, percentage difference (Current vs 1 Week Ago)"
    sql: ${total_ad_revenue_gbp}-${total_ad_revenue_gbp_1_week_ago} ;;
    value_format_name: gbp
  }

  measure: total_ad_revenue_gbp_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "Ad Revenue GBP"
    label: "Ad Revenue GBP: % Difference vs 1 Week Ago"
    description: "% Difference in Ad revenue GBP (Current vs 1 Week Ago)"
    sql:  CASE
                        WHEN ${total_ad_revenue_gbp_1_week_ago} = 0 THEN 0
                        ELSE ${total_ad_revenue_gbp_difference_current_vs_1_week_ago}/${total_ad_revenue_gbp_1_week_ago}
                      END;;
    value_format_name: percent_1
  }


  measure: total_ad_revenue_gbp_2_weeks_ago {
    type: sum
    group_label: "Ad Revenue GBP"
    label: "Total Ad Revenue GBP 2 weeks ago"
    description: "Total advertising revenue converted to GBP using Netsuite exchange rate (or Fixer.io if Netsuite is not available) of the last day of the month - or latest daily rate if not yet at month end - same day 14 days ago"
    sql: ${ads_revenue_gbp_daily_2_week_ago};;
    value_format_name: gbp
  }

  # Comparative metrics

  measure: total_ad_revenue_gbp_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "Ad Revenue GBP"
    label: "Ad Revenue GBP: Difference vs 2 Weeks Ago"
    description: "Ad revenue gbp, percentage difference (Current vs 2 Weeks Ago)"
    sql: ${total_ad_revenue_gbp}-${total_ad_revenue_gbp_2_weeks_ago} ;;
    value_format_name: gbp
  }

  measure: total_ad_revenue_gbp_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "Ad Revenue GBP"
    label: "Ad Revenue GBP: % Difference vs 2 Weeks Ago"
    description: "% Difference in Ad revenue GBP (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ad_revenue_gbp_2_weeks_ago} = 0 THEN 0
                  ELSE ${total_ad_revenue_gbp_difference_current_vs_2_weeks_ago}/${total_ad_revenue_gbp_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ad_revenue_gbp_4_weeks_ago {
    type: sum
    group_label: "Ad Revenue GBP"
    label: "Total Ad Revenue GBP 4 weeks ago"
    description: "Total advertising revenue converted to GBP using Netsuite exchange rate (or Fixer.io if Netsuite is not available) of the last day of the month - or latest daily rate if not yet at month end - same day 28 days ago"
    sql: ${ads_revenue_gbp_daily_4_week_ago};;
    value_format_name: gbp
  }

  # Comparative metrics

  measure: total_ad_revenue_gbp_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "Ad Revenue GBP"
    label: "Ad Revenue GBP: Difference vs 4 Weeks Ago"
    description: "Ad revenue gbp, percentage difference (Current vs 4 Weeks Ago)"
    sql: ${total_ad_revenue_gbp}-${total_ad_revenue_gbp_4_weeks_ago} ;;
    value_format_name: gbp
  }

  measure: total_ad_revenue_gbp_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "Ad Revenue GBP"
    label: "Ad Revenue GBP: % Difference vs 4 Weeks Ago"
    description: "% Difference in Ad revenue GBP (Current vs 4 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ad_revenue_gbp_4_weeks_ago} = 0 THEN 0
                  ELSE ${total_ad_revenue_gbp_difference_current_vs_4_weeks_ago}/${total_ad_revenue_gbp_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ad_revenue_gbp_52_weeks_ago {
    type: sum
    group_label: "Ad Revenue GBP"
    label: "Total Ad Revenue GBP 52 weeks ago"
    description: "Total advertising revenue converted to GBP using Netsuite exchange rate (or Fixer.io if Netsuite is not available) of the last day of the month - or latest daily rate if not yet at month end - same day 52 weeks ago"
    sql: ${ads_revenue_gbp_daily_52_week_ago};;
    value_format_name: gbp
  }

  # Comparative metrics

  measure: total_ad_revenue_gbp_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "Ad Revenue GBP"
    label: "Ad Revenue GBP: Difference vs 52 Weeks Ago"
    description: "Total ad revenue GBP, difference (Current vs 52 Weeks Ago)"
    sql: ${total_ad_revenue_gbp}-${total_ad_revenue_gbp_52_weeks_ago} ;;
    value_format_name: gbp
  }

  measure: total_ad_revenue_gbp_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "Ad Revenue GBP"
    label: "Ad Revenue GBP: % Difference vs 52 Weeks Ago"
    description: "Ad revenue gbp, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ad_revenue_gbp_52_weeks_ago} = 0 THEN 0
                  ELSE ${total_ad_revenue_gbp_difference_current_vs_52_weeks_ago}/${total_ad_revenue_gbp_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }


  measure: total_ad_revenue_gbp_comparison_period {
    group_label: "Ad Revenue GBP"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad revenue GBP 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad revenue GBP 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad revenue GBP 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad revenue GBP 52 weeks ago
    {% else %} Ad Revenue GBP in Comparison Period
    {% endif %}"
    value_format: "[>=1000000]\"£\"0.00,,\"M\";[>=1000]\"£\"0.00,\"K\";\"£\"0.00"
    description: "Ad revenue GBP in chosen comparison period."
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ad_revenue_gbp_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ad_revenue_gbp_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ad_revenue_gbp_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ad_revenue_gbp_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ad_revenue_gbp_difference_vs_comparison_period {
    group_label: "Ad Revenue GBP"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad Revenue GBP: Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad Revenue GBP: Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad Revenue GBP: Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad Revenue GBP: Difference vs 52 weeks ago
    {% else %} Ad Revenue GBP: Difference vs Comparison Period
    {% endif %}"
    description: "Ad revenue gbp, percentage difference (Current vs chosen comparison period)"
    value_format_name: gbp
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ad_revenue_gbp_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ad_revenue_gbp_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ad_revenue_gbp_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ad_revenue_gbp_difference_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ad_revenue_gbp_pct_change_vs_comparison_period {
    group_label: "Ad Revenue GBP"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad Revenue GBP: % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad Revenue GBP: % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad Revenue GBP: % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad Revenue GBP: % Difference vs 52 weeks ago
    {% else %} Ad Revenue GBP: % Difference vs Comparison Period
    {% endif %}"
    description: "Ad revenue GBP, percentage difference (Current vs chosen comparison period)"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ad_revenue_gbp_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ad_revenue_gbp_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ad_revenue_gbp_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ad_revenue_gbp_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }


# ------------------------------------------------------------------------------------------------------------------------------------------------
# AD REVENUE USD

  measure: total_ad_revenue_usd {
    type: sum
    group_label: "Ad Revenue USD"
    label: "Total Ad Revenue USD"
    description: "Total advertising revenue in USD generated that day"
    sql: ${ads_revenue_usd_daily};;
    value_format: "[>=1000000]$0.0,,\"M\";[>=1000]$0.0,\"K\";$0.0"
  }

  measure: total_ad_revenue_usd_1_week_ago {
    type: sum
    group_label: "Ad Revenue USD"
    label: "Total Ad Revenue USD 1 week ago"
    description: "Total advertising revenue in USD generated same day 7 days ago"
    sql: ${ads_revenue_usd_daily_1_week_ago};;
    value_format_name: usd
  }

  measure: total_ad_revenue_usd_difference_current_vs_1_week_ago {
    type:  number
    group_label: "Ad Revenue USD"
    label: "Ad Revenue USD: Difference vs 1 Week Ago"
    description: "Total ad revenue USD, difference (Current vs 1 Week Ago)"
    sql: ${total_ad_revenue_usd}-${total_ad_revenue_usd_1_week_ago} ;;
    value_format_name: usd
  }

  measure: total_ad_revenue_usd_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "Ad Revenue USD"
    label: "Ad Revenue USD: % Difference vs 1 Week Ago"
    description: "Ad revenue usd, percentage difference (Current vs 1 Week Ago)"
    sql:  CASE
                      WHEN ${total_ad_revenue_usd_1_week_ago} = 0 THEN 0
                      ELSE ${total_ad_revenue_usd_difference_current_vs_1_week_ago}/${total_ad_revenue_usd_1_week_ago}
                    END;;
    value_format_name: percent_1
  }

  measure: total_ad_revenue_usd_2_weeks_ago {
    type: sum
    group_label: "Ad Revenue USD"
    label: "Total Ad Revenue USD 2 weeks ago"
    description: "Total advertising revenue in USD generated same day 14 days ago"
    sql: ${ads_revenue_usd_daily_2_week_ago};;
    value_format_name: usd
  }

  # Comparative metrics

  measure: total_ad_revenue_usd_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "Ad Revenue USD"
    label: "Ad Revenue USD: Difference vs 2 Weeks Ago"
    description: "Total ad revenue USD, difference (Current vs 2 Weeks Ago)"
    sql: ${total_ad_revenue_usd}-${total_ad_revenue_usd_2_weeks_ago} ;;
    value_format_name: usd
  }

  measure: total_ad_revenue_usd_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "Ad Revenue USD"
    label: "Ad Revenue USD: % Difference vs 2 Weeks Ago"
    description: "Ad revenue usd, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                WHEN ${total_ad_revenue_usd_2_weeks_ago} = 0 THEN 0
                ELSE ${total_ad_revenue_usd_difference_current_vs_2_weeks_ago}/${total_ad_revenue_usd_2_weeks_ago}
              END;;
    value_format_name: percent_1
  }


  measure: total_ad_revenue_usd_4_weeks_ago {
    type: sum
    group_label: "Ad Revenue USD"
    label: "Total Ad Revenue USD 4 weeks ago"
    description: "Total advertising revenue in USD generated same day 28 days ago"
    sql: ${ads_revenue_usd_daily_4_week_ago};;
    value_format_name: usd
  }

  # Comparative metrics

  measure: total_ad_revenue_usd_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "Ad Revenue USD"
    label: "Ad Revenue USD: Difference vs 4 Weeks Ago"
    description: "Total ad revenue USD, difference (Current vs 4 Weeks Ago)"
    sql: ${total_ad_revenue_usd}-${total_ad_revenue_usd_4_weeks_ago} ;;
    value_format_name: usd
  }

  measure: total_ad_revenue_usd_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "Ad Revenue USD"
    label: "Ad Revenue USD: % Difference vs 4 Weeks Ago"
    description: "Ad revenue usd, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
                    WHEN ${total_ad_revenue_usd_4_weeks_ago} = 0 THEN 0
                    ELSE ${total_ad_revenue_usd_difference_current_vs_4_weeks_ago}/${total_ad_revenue_usd_4_weeks_ago}
                  END;;
    value_format_name: percent_1
  }

  measure: total_ad_revenue_usd_52_weeks_ago {
    type: sum
    group_label: "Ad Revenue USD"
    label: "Total Ad Revenue USD 52 weeks ago"
    description: "Total ad revenue in USD generated same day 52 weeks ago"
    sql: ${ads_revenue_usd_daily_52_week_ago};;
    value_format_name: usd
  }

  # Comparative metrics

  measure: total_ad_revenue_usd_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "Ad Revenue USD"
    label: "Ad Revenue USD: Difference vs 52 Weeks Ago"
    description: "Total ad revenue USD, difference (Current vs 52 Weeks Ago)"
    sql: ${total_ad_revenue_usd}-${total_ad_revenue_usd_52_weeks_ago} ;;
    value_format_name: usd
  }

  measure: total_ad_revenue_usd_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "Ad Revenue USD"
    label: "Ad Revenue USD: % Difference vs 52 Weeks Ago"
    description: "Ad revenue usd, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                    WHEN ${total_ad_revenue_usd_52_weeks_ago} = 0 THEN 0
                    ELSE ${total_ad_revenue_usd_difference_current_vs_52_weeks_ago}/${total_ad_revenue_usd_52_weeks_ago}
                  END;;
    value_format_name: percent_1
  }

  measure: total_ad_revenue_usd_comparison_period {
    group_label: "Ad Revenue USD"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad revenue USD 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad revenue USD 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad revenue USD 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad revenue USD 52 weeks ago
    {% else %} Ad Revenue USD in Comparison Period
    {% endif %}"
    description: "Ad Revenue USD in chosen comparison period"
    value_format_name:  usd
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ad_revenue_usd_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ad_revenue_usd_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ad_revenue_usd_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ad_revenue_usd_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ad_revenue_usd_difference_vs_comparison_period {
    group_label: "Ad Revenue USD"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad Revenue USD: Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad Revenue USD: Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad Revenue USD: Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad Revenue USD: Difference vs 52 weeks ago
    {% else %} Ad Revenue USD: Difference vs Comparison Period
    {% endif %}"
    description: " Ad Revenue USD: Difference vs chosen comparison period"
    value_format_name: usd
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ad_revenue_usd_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ad_revenue_usd_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ad_revenue_usd_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ad_revenue_usd_difference_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ad_revenue_usd_pct_change_vs_comparison_period {
    group_label: "Ad Revenue USD"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad Revenue USD: % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad Revenue USD: % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad Revenue USD: % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad Revenue USD: % Difference vs 52 weeks ago
    {% else %} Ad Revenue USD: % Difference vs Comparison Period
    {% endif %}"
    description: "Ad Revenue USD: % Difference vs chosen comparison period"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ad_revenue_usd_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ad_revenue_usd_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ad_revenue_usd_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ad_revenue_usd_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }

# ------------------------------------------------------------------------------------------------------------------------------------------------
# ECPM

  measure: total_ad_ecpm_usd {
    type:  number
    group_label: "Ad eCPM USD"
    label: "Ad eCPM USD"
    description: "Effective Cost Per Mille - Ad revenue (USD) per thousand impressions"
    sql: CASE WHEN IFNULL(${total_ad_impressions},0) = 0 THEN 0 ELSE (1.00*${total_ad_revenue_usd}/(${total_ad_impressions}/1000)) END;;
    value_format_name: usd
  }

  measure: total_ad_ecpm_usd_1_week_ago {
    type:  number
    group_label: "Ad eCPM USD"
    label: "Ad eCPM USD 1 Week Ago"
    description: "Effective Cost Per Mille - Ad revenue (USD) per thousand impressions, 1 week ago"
    sql: CASE
            WHEN IFNULL(${total_ad_impressions_1_week_ago},0) = 0 THEN 0
            ELSE 1.00*${total_ad_revenue_usd_1_week_ago}/(${total_ad_impressions_1_week_ago}/1000)
          END;;
    value_format_name: usd
  }

  measure: total_ad_ecpm_usd_difference_current_vs_1_week_ago {
    type:  number
    group_label: "Ad eCPM USD"
    label: "Ad eCPM USD: Difference vs 1 Week Ago"
    description: "Total eCPM USD, difference (Current vs 1 Week Ago)"
    sql: ${total_ad_ecpm_usd}-${total_ad_ecpm_usd_1_week_ago} ;;
    value_format_name: usd
  }

  measure: total_ad_ecpm_usd_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "Ad eCPM USD"
    label: "Ad eCPM USD: % Difference vs 1 Week Ago"
    description: "Ad eCPM USD, percentage difference (Current vs 1 Week Ago)"
    sql:  CASE
                  WHEN IFNULL(${total_ad_ecpm_usd_1_week_ago},0) = 0 THEN 0
                  ELSE ${total_ad_ecpm_usd_difference_current_vs_1_week_ago}/${total_ad_ecpm_usd_1_week_ago}
                END;;
    value_format_name: percent_1
  }


  measure: total_ad_ecpm_usd_2_weeks_ago {
    type:  number
    group_label: "Ad eCPM USD"
    label: "Ad eCPM USD 2 Weeks Ago"
    description: "Effective Cost Per Mille - Ad revenue (USD) per thousand impressions, 2 weeks ago"
    sql: CASE
            WHEN IFNULL(${total_ad_impressions_2_weeks_ago},0) = 0 THEN 0
            ELSE 1.00*${total_ad_revenue_usd_2_weeks_ago}/(${total_ad_impressions_2_weeks_ago}/1000)
          END;;
    value_format_name: usd
  }

  measure: total_ad_ecpm_usd_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "Ad eCPM USD"
    label: "Ad eCPM USD: Difference vs 2 Weeks Ago"
    description: "Total eCPM USD, difference (Current vs 2 Weeks Ago)"
    sql: ${total_ad_ecpm_usd}-${total_ad_ecpm_usd_2_weeks_ago} ;;
    value_format_name: usd
  }

  measure: total_ad_ecpm_usd_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "Ad eCPM USD"
    label: "Ad eCPM USD: % Difference vs 2 Weeks Ago"
    description: "Ad eCPM USD, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ad_ecpm_usd_2_weeks_ago} = 0 THEN 0
                  ELSE ${total_ad_ecpm_usd_difference_current_vs_2_weeks_ago}/${total_ad_ecpm_usd_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ad_ecpm_usd_4_weeks_ago {
    type:  number
    group_label: "Ad eCPM USD"
    label: "Ad eCPM USD 4 Weeks Ago"
    description: "Effective Cost Per Mille - Ad revenue (USD) per thousand impressions, 4 weeks ago"
    sql: CASE
            WHEN IFNULL(${total_ad_impressions_4_weeks_ago},0) = 0 THEN 0
            ELSE 1.00*${total_ad_revenue_usd_4_weeks_ago}/(${total_ad_impressions_4_weeks_ago}/1000)
          END;;
    value_format_name: usd
  }

  measure: total_ad_ecpm_usd_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "Ad eCPM USD"
    label: "Ad eCPM USD: Difference vs 4 Weeks Ago"
    description: "Total eCPM USD, difference (Current vs 4 Weeks Ago)"
    sql: ${total_ad_ecpm_usd}-${total_ad_ecpm_usd_4_weeks_ago} ;;
    value_format_name: usd
  }

  measure: total_ad_ecpm_usd_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "Ad eCPM USD"
    label: "Ad eCPM USD: % Difference vs 4 Weeks Ago"
    description: "Ad eCPM USD, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ad_ecpm_usd_4_weeks_ago} = 0 THEN 0
                  ELSE ${total_ad_ecpm_usd_difference_current_vs_4_weeks_ago}/${total_ad_ecpm_usd_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ad_ecpm_usd_52_weeks_ago {
    type:  number
    group_label: "Ad eCPM USD"
    label: "Ad eCPM USD 52 Weeks Ago"
    description: "Effective Cost Per Mille - Ad revenue (USD) per thousand impressions, 52 weeks ago"
    sql: CASE
            WHEN IFNULL(${total_ad_impressions_52_weeks_ago},0) = 0 THEN 0
            ELSE 1.00*${total_ad_revenue_usd_52_weeks_ago}/(${total_ad_impressions_52_weeks_ago}/1000)
          END;;
    value_format_name: usd
  }

  measure: total_ad_ecpm_usd_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "Ad eCPM USD"
    label: "Ad eCPM USD: Difference vs 52 Weeks Ago"
    description: "Total eCPM USD, difference (Current vs 52 Weeks Ago)"
    sql: ${total_ad_ecpm_usd}-${total_ad_ecpm_usd_52_weeks_ago} ;;
    value_format_name: usd
  }

  measure: total_ad_ecpm_usd_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "Ad eCPM USD"
    label: "Ad eCPM USD: % Difference vs 52 Weeks Ago"
    description: "Ad eCPM USD, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ad_ecpm_usd_52_weeks_ago} = 0 THEN 0
                  ELSE ${total_ad_ecpm_usd_difference_current_vs_52_weeks_ago}/${total_ad_ecpm_usd_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ad_ecpm_usd_comparison_period {
    group_label: "Ad eCPM USD"
    description: "Effective Cost Per Mille - Ad revenue (USD) per thousand impressions, in selected comparison period"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad eCPM USD 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad eCPM USD 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad eCPM USD 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad eCPM USD 52 weeks ago
    {% else %} Ad eCPM USD in Comparison Period
    {% endif %}"
    value_format_name: usd
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ad_ecpm_usd_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ad_ecpm_usd_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ad_ecpm_usd_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ad_ecpm_usd_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ad_ecpm_usd_difference_vs_comparison_period {
    group_label: "Ad eCPM USD"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad eCPM USD Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad eCPM USD Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad eCPM USD Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad eCPM USD Difference vs 52 weeks ago
    {% else %} Ad eCPM USD Difference vs Comparison Period
    {% endif %}"
    description: "Effective Cost Per Mille - Ad revenue (USD) per thousand impressions, difference vs selected comparison period"
    value_format_name: usd
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ad_ecpm_usd_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ad_ecpm_usd_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ad_ecpm_usd_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ad_ecpm_usd_difference_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ad_ecpm_usd_pct_change_vs_comparison_period {
    group_label: "Ad eCPM USD"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad eCPM USD % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad eCPM USD % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad eCPM USD % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad eCPM USD % Difference vs 52 weeks ago
    {% else %} Ad eCPM USD % Change vs Comparison Period
    {% endif %}"
    description: "Effective Cost Per Mille - Ad revenue (USD) per thousand impressions, % difference vs selected comparison period"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ad_ecpm_usd_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ad_ecpm_usd_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ad_ecpm_usd_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ad_ecpm_usd_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }



# ECPM

  measure: total_ad_ecpm_gbp {
    type:  number
    group_label: "Ad eCPM GBP"
    label: "Ad eCPM GBP"
    description: "Effective Cost Per Mille - Ad revenue (GBP) per thousand impressions"
    sql: CASE WHEN IFNULL(${total_ad_impressions},0) = 0 THEN 0 ELSE (1.00*${total_ad_revenue_gbp}/(${total_ad_impressions}/1000)) END;;
    value_format_name: gbp
  }

  measure: total_ad_ecpm_gbp_1_week_ago {
    type:  number
    group_label: "Ad eCPM GBP"
    label: "Ad eCPM GBP 1 Week Ago"
    description: "Effective Cost Per Mille - Ad revenue (GBP) per thousand impressions, 1 week ago"
    sql: CASE
            WHEN IFNULL(${total_ad_impressions_1_week_ago},0) = 0 THEN 0
            ELSE 1.00*${total_ad_revenue_gbp_1_week_ago}/(${total_ad_impressions_1_week_ago}/1000)
          END;;
    value_format_name: gbp
  }

  measure: total_ad_ecpm_gbp_difference_current_vs_1_week_ago {
    type:  number
    group_label: "Ad eCPM GBP"
    label: "Ad eCPM GBP: Difference vs 1 Week Ago"
    description: "Total eCPM GBP, difference (Current vs 1 Week Ago)"
    sql: ${total_ad_ecpm_gbp}-${total_ad_ecpm_gbp_1_week_ago} ;;
    value_format_name: gbp
  }

  measure: total_ad_ecpm_gbp_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "Ad eCPM GBP"
    label: "Ad eCPM GBP: % Difference vs 1 week Ago"
    description: "Ad eCPM GBP, percentage difference (Current vs 1 Week Ago)"
    sql:  CASE
            WHEN ${total_ad_ecpm_gbp_1_week_ago} = 0 THEN 0
            ELSE ${total_ad_ecpm_gbp_difference_current_vs_1_week_ago}/${total_ad_ecpm_gbp_1_week_ago}
          END;;
    value_format_name: percent_1
  }


  measure: total_ad_ecpm_gbp_2_weeks_ago {
    type:  number
    group_label: "Ad eCPM GBP"
    label: "Ad eCPM GBP 2 Weeks Ago"
    description: "Effective Cost Per Mille - Ad revenue (GBP) per thousand impressions, 2 weeks ago"
    sql: CASE
            WHEN IFNULL(${total_ad_impressions_2_weeks_ago},0) = 0 THEN 0
            ELSE 1.00*${total_ad_revenue_gbp_2_weeks_ago}/(${total_ad_impressions_2_weeks_ago}/1000)
          END;;
    value_format_name: gbp
  }

  measure: total_ad_ecpm_gbp_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "Ad eCPM GBP"
    label: "Ad eCPM GBP: Difference vs 2 Weeks Ago"
    description: "Total eCPM GBP, difference (Current vs 2 Weeks Ago)"
    sql: ${total_ad_ecpm_gbp}-${total_ad_ecpm_gbp_2_weeks_ago} ;;
    value_format_name: gbp
  }

  measure: total_ad_ecpm_gbp_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "Ad eCPM GBP"
    label: "Ad eCPM GBP: % Difference vs 2 Weeks Ago"
    description: "Ad eCPM GBP, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
            WHEN ${total_ad_ecpm_gbp_2_weeks_ago} = 0 THEN 0
            ELSE ${total_ad_ecpm_gbp_difference_current_vs_2_weeks_ago}/${total_ad_ecpm_gbp_2_weeks_ago}
          END;;
    value_format_name: percent_1
  }

  measure: total_ad_ecpm_gbp_4_weeks_ago {
    type:  number
    group_label: "Ad eCPM GBP"
    label: "Ad eCPM GBP 4 Weeks Ago"
    description: "Effective Cost Per Mille - Ad revenue (GBP) per thousand impressions, 4 weeks ago"
    sql: CASE
            WHEN IFNULL(${total_ad_impressions_4_weeks_ago},0) = 0 THEN 0
            ELSE 1.00*${total_ad_revenue_gbp_4_weeks_ago}/(${total_ad_impressions_4_weeks_ago}/1000)
          END;;
    value_format_name: gbp
  }

  measure: total_ad_ecpm_gbp_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "Ad eCPM GBP"
    label: "Ad eCPM GBP: Difference vs 4 Weeks Ago"
    description: "Total eCPM GBP, difference (Current vs 4 Weeks Ago)"
    sql: ${total_ad_ecpm_gbp}-${total_ad_ecpm_gbp_4_weeks_ago} ;;
    value_format_name: gbp
  }

  measure: total_ad_ecpm_gbp_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "Ad eCPM GBP"
    label: "Ad eCPM GBP: % Difference vs 4 Weeks Ago"
    description: "Ad eCPM GBP, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
            WHEN ${total_ad_ecpm_gbp_4_weeks_ago} = 0 THEN 0
            ELSE ${total_ad_ecpm_gbp_difference_current_vs_4_weeks_ago}/${total_ad_ecpm_gbp_4_weeks_ago}
          END;;
    value_format_name: percent_1
  }

  measure: total_ad_ecpm_gbp_52_weeks_ago {
    type:  number
    group_label: "Ad eCPM GBP"
    label: "Ad eCPM GBP 52 Weeks Ago"
    description: "Effective Cost Per Mille - Ad revenue (GBP) per thousand impressions, 52 weeks ago"
    sql: CASE
            WHEN IFNULL(${total_ad_impressions_52_weeks_ago},0) = 0 THEN 0
            ELSE 1.00*${total_ad_revenue_gbp_52_weeks_ago}/(${total_ad_impressions_52_weeks_ago}/1000)
          END;;
    value_format_name: gbp
  }

  measure: total_ad_ecpm_gbp_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "Ad eCPM GBP"
    label: "Ad eCPM GBP: Difference vs 52 Weeks Ago"
    description: "Total eCPM GBP, difference (Current vs 52 Weeks Ago)"
    sql: ${total_ad_ecpm_gbp}-${total_ad_ecpm_gbp_52_weeks_ago} ;;
    value_format_name: gbp
  }

  measure: total_ad_ecpm_gbp_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "Ad eCPM GBP"
    label: "Ad eCPM GBP: % Difference vs 52 Weeks Ago"
    description: "Ad eCPM GBP, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
            WHEN ${total_ad_ecpm_gbp_52_weeks_ago} = 0 THEN 0
            ELSE ${total_ad_ecpm_gbp_difference_current_vs_52_weeks_ago}/${total_ad_ecpm_gbp_52_weeks_ago}
          END;;
    value_format_name: percent_1
  }


  measure: total_ad_ecpm_gbp_comparison_period {
    group_label: "Ad eCPM GBP"
    description: "Effective Cost Per Mille - Ad revenue (GBP) per thousand impressions, in selected comparison period"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad eCPM GBP 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad eCPM GBP 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad eCPM GBP 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad eCPM GBP 52 weeks ago
    {% else %} Ad eCPM GBP in Comparison Period
    {% endif %}"
    value_format_name: gbp
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ad_ecpm_gbp_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ad_ecpm_gbp_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ad_ecpm_gbp_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ad_ecpm_gbp_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ad_ecpm_gbp_difference_vs_comparison_period {
    group_label: "Ad eCPM GBP"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad eCPM GBP Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad eCPM GBP Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad eCPM GBP Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad eCPM GBP Difference vs 52 weeks ago
    {% else %} Ad eCPM GBP Difference vs Comparison Period
    {% endif %}"
    description: "Effective Cost Per Mille - Ad revenue (GBP) per thousand impressions, difference vs selected comparison period"
    value_format_name: gbp
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ad_ecpm_gbp_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ad_ecpm_gbp_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ad_ecpm_gbp_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ad_ecpm_gbp_difference_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ad_ecpm_gbp_pct_change_vs_comparison_period {
    group_label: "Ad eCPM GBP"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad eCPM GBP % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad eCPM GBP % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad eCPM GBP % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad eCPM GBP % Difference vs 52 weeks ago
    {% else %} Ad eCPM GBP % Change vs Comparison Period
    {% endif %}"
    description: "Effective Cost Per Mille - Ad revenue (GBP) per thousand impressions, % difference vs selected comparison period"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ad_ecpm_gbp_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ad_ecpm_gbp_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ad_ecpm_gbp_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ad_ecpm_gbp_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }


#TOTAL AD REVENUE

  measure: total_ad_revenue {
    group_label: "Dynamic Selectors"
    label:
    "{% if currency_selector._parameter_value == 'usd' %} Ad Revenue ($)
    {% elsif currency_selector._parameter_value == 'gbp' %} Ad Revenue (£)
    {% else %} Ad Revenue
    {% endif %}"
    sql:
      {% if currency_selector._parameter_value == "usd" %} ${total_ad_revenue_usd}
      {% elsif currency_selector._parameter_value == "gbp" %} ${total_ad_revenue_gbp}
      {%else%} NULL
      {% endif %};;
    html:
      {% if currency_selector._parameter_value == "usd" %} {{total_ad_revenue_usd._rendered_value }}
      {% elsif currency_selector._parameter_value == "gbp" %} {{total_ad_revenue_gbp._rendered_value }}
      {% else %} NULL
      {% endif %} ;;
    type: number
  }

  measure: total_ad_revenue_in_comparison_period {
    group_label: "Dynamic Selectors"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' and currency_selector._parameter_value == 'usd' %} Ad revenue ($) : 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' and currency_selector._parameter_value == 'usd' %} Ad revenue ($) : 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' and currency_selector._parameter_value == 'usd' %} Ad revenue ($) : 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' and currency_selector._parameter_value == 'usd' %} Ad revenue ($) : 52 weeks ago
    {% elsif comparison_period._parameter_value == '7_days_ago' and currency_selector._parameter_value == 'gbp' %} Ad revenue (£) : 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' and currency_selector._parameter_value == 'gbp' %} Ad revenue (£) : 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' and currency_selector._parameter_value == 'gbp' %} Ad revenue (£) : 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' and currency_selector._parameter_value == 'gbp' %} Ad revenue (£) : 52 weeks ago
    {% else %} Ad revenue in comparison Period
    {% endif %}"
    description: "Ad revenue in selected comparison period"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_revenue_usd_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_revenue_usd_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_revenue_usd_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_revenue_usd_52_weeks_ago}
      {% elsif comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_revenue_gbp_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_revenue_gbp_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_revenue_gbp_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_revenue_gbp_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html:
      {% if comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "usd" %} {{total_ad_revenue_usd_1_week_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "usd" %} {{total_ad_revenue_usd_2_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "usd" %} {{total_ad_revenue_usd_4_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "usd" %} {{total_ad_revenue_usd_52_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "gbp" %} {{total_ad_revenue_gbp_1_week_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "gbp" %} {{total_ad_revenue_gbp_2_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "gbp" %} {{total_ad_revenue_gbp_4_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "gbp" %} {{total_ad_revenue_gbp_52_weeks_ago._rendered_value }}
      {% else %} NULL
      {% endif %} ;;
  }


  measure: total_ad_revenue_pct_change_vs_comparison_period {
    group_label: "Dynamic Selectors"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad revenue % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad revenue % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad revenue % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad revenue % Difference vs 52 weeks ago
    {% else %} Ad revenue % Difference vs Comparison Period
    {% endif %}"
    description: "Ad revenue % difference vs selected comparison period"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_revenue_usd_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_revenue_usd_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_revenue_usd_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_revenue_usd_pct_change_current_vs_52_weeks_ago}
      {% elsif comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_revenue_gbp_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_revenue_gbp_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_revenue_gbp_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_revenue_gbp_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
    value_format_name: "percent_1"
  }

  measure: total_ad_ecpm {
    group_label: "Dynamic Selectors"
    label:
    "{% if currency_selector._parameter_value == 'usd' %} Total Ad eCPM ($)
    {% elsif currency_selector._parameter_value == 'gbp' %} Total Ad eCPM (£)
    {% else %} Ad eCPM
    {% endif %}"
    type: number
    sql:
      {% if currency_selector._parameter_value == "usd" %} ${total_ad_ecpm_usd}
      {% elsif currency_selector._parameter_value == "gbp" %} ${total_ad_ecpm_gbp}
      {%else%} NULL
      {% endif %};;
    html:
      {% if currency_selector._parameter_value == "usd" %} {{total_ad_ecpm_usd._rendered_value }}
      {% elsif currency_selector._parameter_value == "gbp" %} {{total_ad_ecpm_gbp._rendered_value }}
      {% else %} NULL
      {% endif %} ;;
  }

  measure: total_ad_ecpm_in_comparison_period {
    group_label: "Dynamic Selectors"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' and currency_selector._parameter_value == 'usd' %} Ad eCPM ($) : 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' and currency_selector._parameter_value == 'usd' %} Ad eCPM ($) : 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' and currency_selector._parameter_value == 'usd' %} Ad eCPM ($) : 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' and currency_selector._parameter_value == 'usd' %} Ad eCPM ($) : 52 weeks ago
    {% elsif comparison_period._parameter_value == '7_days_ago' and currency_selector._parameter_value == 'gbp' %} Ad eCPM (£) : 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' and currency_selector._parameter_value == 'gbp' %} Ad eCPM (£) : 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' and currency_selector._parameter_value == 'gbp' %} Ad eCPM (£) : 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' and currency_selector._parameter_value == 'gbp' %} Ad eCPM (£) : 52 weeks ago
    {% else %} Ad eCPM in Comparison Period
    {% endif %}"
    description: "Ad eCPM in selected comparison period"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_ecpm_usd_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_ecpm_usd_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_ecpm_usd_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_ecpm_usd_52_weeks_ago}
      {% elsif comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_ecpm_gbp_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_ecpm_gbp_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_ecpm_gbp_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_ecpm_gbp_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html:
          {% if comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "usd" %} {{total_ad_ecpm_usd_1_week_ago._rendered_value }}
          {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "usd" %} {{total_ad_ecpm_usd_2_week_ago._rendered_value }}
          {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "usd" %} {{total_ad_ecpm_usd_4_week_ago._rendered_value }}
          {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "usd" %} {{total_ad_ecpm_usd_52_week_ago._rendered_value }}

      {% elsif comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "gbp" %} {{total_ad_ecpm_gbp_1_week_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "gbp" %} {{total_ad_ecpm_gbp_2_week_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "gbp" %} {{total_ad_ecpm_gbp_4_week_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "gbp" %} {{total_ad_ecpm_gbp_52_week_ago._rendered_value }}
      {% else %} NULL
      {% endif %} ;;
  }

  measure: total_ad_ecpm_pct_change_vs_comparison_period {
    group_label: "Dynamic Selectors"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Ad eCPM % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Ad eCPM % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Ad eCPM % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Ad eCPM % Difference vs 52 weeks ago
    {% else %} Ad eCPM % Difference vs Comparison Period
    {% endif %}"
    description: "Effective Cost Per Mille - Ad revenue per thousand impressions, difference vs selected comparison period"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_ecpm_usd_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_ecpm_usd_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_ecpm_usd_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "usd" %} ${total_ad_ecpm_usd_pct_change_current_vs_52_weeks_ago}
      {% elsif comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_ecpm_gbp_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_ecpm_gbp_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_ecpm_gbp_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "gbp" %} ${total_ad_ecpm_gbp_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
    value_format_name: "percent_1"
  }




# NEW ECOM REVENUE USD

  measure: total_ecommerce_revenue_usd_constant_budget_adj{
    group_label: "eCommerce Revenue USD"
    label: "Total eCommerce Revenue USD"
    description: "Total ecommerce revenue from all affiliates in USD. Values converted based on constant budget exchange rate, adjusted to account for pending transactions."
    type:  sum
    value_format_name: usd
    value_format: "[>=1000000]\"$\"0.0,,\"M\";[>=1000]\"$\"0.0,\"K\";\"$\"0.0"
    sql: ${ecommerce_revenue_usd_constant_budget_adj};;
  }


  measure: total_ecommerce_revenue_usd_constant_budget_adj_1_week_ago {
    group_label: "eCommerce Revenue USD"
    label: "eCommerce Revenue USD 1 week ago"
    description: "Total ecommerce revenue from all affiliates in USD, 7 days ago. Values converted based on constant budget exchange rate, adjusted to account for pending transactions."
    type:  sum
    value_format_name: usd
    sql: ${ecommerce_revenue_usd_constant_budget_adj_1_week_ago};;
  }


  measure: total_ecommerce_revenue_usd_constant_budget_adj_difference_current_vs_1_week_ago {
    type:  number
    group_label: "eCommerce Revenue USD"
    label: "eCommerce Revenue USD: Difference vs 1 Week Ago"
    description: "eCommerce Revenue USD, difference (Current vs 1 Week Ago)"
    sql: ${total_ecommerce_revenue_usd_constant_budget_adj}-${total_ecommerce_revenue_usd_constant_budget_adj_1_week_ago} ;;
    value_format_name: usd
  }

  measure: total_ecommerce_revenue_usd_constant_budget_adj_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "eCommerce Revenue USD"
    label: "eCommerce Revenue USD: % Difference vs 1 Week Ago"
    description: "eCommerce Revenue USD, percentage difference (Current vs 1 Week Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_revenue_usd_constant_budget_adj_1_week_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_revenue_usd_constant_budget_adj_difference_current_vs_1_week_ago}/${total_ecommerce_revenue_usd_constant_budget_adj_1_week_ago}
                END;;
    value_format_name: percent_1
  }



  measure: total_ecommerce_revenue_usd_constant_budget_adj_2_weeks_ago {
    type:  sum
    group_label: "eCommerce Revenue USD"
    label: "eCommerce Revenue USD 2 Weeks Ago"
    description: "Total ecommerce revenue from all affiliates in USD, 14 days ago."
    sql: ${ecommerce_revenue_usd_constant_budget_adj_2_week_ago};;
    value_format_name: usd
  }

  measure: total_ecommerce_revenue_usd_constant_budget_adj_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "eCommerce Revenue USD"
    label: "eCommerce Revenue USD: Difference vs 2 Weeks Ago"
    description: "eCommerce Revenue USD, difference (Current vs 2 Weeks Ago)"
    sql: ${total_ecommerce_revenue_usd_constant_budget_adj}-${total_ecommerce_revenue_usd_constant_budget_adj_2_weeks_ago} ;;
    value_format_name: usd
  }

  measure: total_ecommerce_revenue_usd_constant_budget_adj_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "eCommerce Revenue USD"
    label: "eCommerce Revenue USD: % Difference vs 2 Weeks Ago"
    description: "eCommerce Revenue USD, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_revenue_usd_constant_budget_adj_2_weeks_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_revenue_usd_constant_budget_adj_difference_current_vs_2_weeks_ago}/${total_ecommerce_revenue_usd_constant_budget_adj_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ecommerce_revenue_usd_constant_budget_adj_4_weeks_ago {
    type:  sum
    group_label: "eCommerce Revenue USD"
    label: "eCommerce Revenue USD 4 Weeks Ago"
    description: "Total ecommerce revenue from all affiliates in USD, 28 days ago"
    sql: ${ecommerce_revenue_usd_constant_budget_adj_4_week_ago};;
    value_format_name: usd
  }

  measure: total_ecommerce_revenue_usd_constant_budget_adj_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "eCommerce Revenue USD"
    label: "eCommerce Revenue USD: Difference vs 4 Weeks Ago"
    description: "eCommerce Revenue USD, difference (Current vs 4 Weeks Ago)"
    sql: ${total_ecommerce_revenue_usd_constant_budget_adj}-${total_ecommerce_revenue_usd_constant_budget_adj_4_weeks_ago} ;;
    value_format_name: usd
  }

  measure: total_ecommerce_revenue_usd_constant_budget_adj_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "eCommerce Revenue USD"
    label: "eCommerce Revenue USD: % Difference vs 4 Weeks Ago"
    description: "eCommerce Revenue USD, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_revenue_usd_constant_budget_adj_4_weeks_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_revenue_usd_constant_budget_adj_difference_current_vs_4_weeks_ago}/${total_ecommerce_revenue_usd_constant_budget_adj_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ecommerce_revenue_usd_constant_budget_adj_52_weeks_ago {
    type:  sum
    group_label: "eCommerce Revenue USD"
    label: "eCommerce Revenue USD 52 Weeks Ago"
    description: "Total ecommerce revenue from all affiliates in USD, 52 weeks ago"
    sql: ${ecommerce_revenue_usd_constant_budget_adj_52_week_ago};;

    value_format_name: usd
  }

  measure: total_ecommerce_revenue_usd_constant_budget_adj_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "eCommerce Revenue USD"
    label: "eCommerce Revenue USD: Difference vs 52 Weeks Ago"
    description: "eCommerce Revenue USD, difference (Current vs 52 Weeks Ago)"
    sql: ${total_ecommerce_revenue_usd_constant_budget_adj}-${total_ecommerce_revenue_usd_constant_budget_adj_52_weeks_ago} ;;
    value_format_name: usd
  }

  measure: total_ecommerce_revenue_usd_constant_budget_adj_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "eCommerce Revenue USD"
    label: "eCommerce Revenue USD: % Difference vs 52 Weeks Ago"
    description: "eCommerce Revenue USD, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_revenue_usd_constant_budget_adj_52_weeks_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_revenue_usd_constant_budget_adj_difference_current_vs_52_weeks_ago}/${total_ecommerce_revenue_usd_constant_budget_adj_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ecommerce_revenue_usd_constant_budget_adj_comparison_period {
    group_label: "eCommerce Revenue USD"
    description: "Total ecommerce revenue from all affiliates in USD, in selected comparison period"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} eCommerce Revenue USD 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} eCommerce Revenue USD 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} eCommerce Revenue USD 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} eCommerce Revenue USD 52 weeks ago
    {% else %} eCommerce Revenue USD in Comparison Period
    {% endif %}"
    value_format_name: usd
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ecommerce_revenue_usd_constant_budget_adj_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ecommerce_revenue_usd_constant_budget_adj_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ecommerce_revenue_usd_constant_budget_adj_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ecommerce_revenue_usd_constant_budget_adj_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ecommerce_revenue_usd_constant_budget_adj_difference_vs_comparison_period {
    group_label: "eCommerce Revenue USD"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} eCommerce Revenue USD Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} eCommerce Revenue USD Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} eCommerce Revenue USD Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} eCommerce Revenue USD Difference vs 52 weeks ago
    {% else %} eCommerce Revenue USD Difference vs Comparison Period
    {% endif %}"
    description: "Total ecommerce revenue from all affiliates in USD, difference vs selected comparison period"
    value_format_name: usd
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ecommerce_revenue_usd_constant_budget_adj_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ecommerce_revenue_usd_constant_budget_adj_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ecommerce_revenue_usd_constant_budget_adj_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ecommerce_revenue_usd_constant_budget_adj_difference_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ecommerce_revenue_usd_constant_budget_adj_pct_change_vs_comparison_period {
    group_label: "eCommerce Revenue USD"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} eCommerce Revenue USD % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} eCommerce Revenue USD % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} eCommerce Revenue USD % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} eCommerce Revenue USD % Difference vs 52 weeks ago
    {% else %} eCommerce Revenue USD % Change vs Comparison Period
    {% endif %}"
    description: "Total ecommerce revenue from all affiliates in USD, % difference vs selected comparison period"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ecommerce_revenue_usd_constant_budget_adj_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ecommerce_revenue_usd_constant_budget_adj_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ecommerce_revenue_usd_constant_budget_adj_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ecommerce_revenue_usd_constant_budget_adj_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }

# NEW ECOM REV GBP


  measure: total_ecommerce_revenue_gbp_constant_budget_adj{
    group_label: "eCommerce Revenue GBP"
    label: "Total eCommerce Revenue GBP"
    description: "Total ecommerce revenue from all affiliates in GBP. Values converted based on constant budget exchange rate, adjusted to account for pending transactions."
    type:  sum
    value_format_name: gbp
    value_format: "[>=1000000]\"£\"0.0,,\"M\";[>=1000]\"£\"0.0,\"K\";\"£\"0.0"
    sql: ${ecommerce_revenue_gbp_constant_budget_adj};;
  }


  measure: total_ecommerce_revenue_gbp_constant_budget_adj_1_week_ago {
    group_label: "eCommerce Revenue GBP"
    label: "Total eCommerce Revenue GBP 1 week ago"
    description: "Total ecommerce revenue from all affiliates in GBP, 7 days ago. Values converted based on constant budget exchange rate, adjusted to account for pending transactions."
    type:  sum
    value_format_name: gbp
    sql: ${ecommerce_revenue_gbp_constant_budget_adj_1_week_ago};;
  }


  measure: total_ecommerce_revenue_gbp_constant_budget_adj_difference_current_vs_1_week_ago {
    type:  number
    group_label: "eCommerce Revenue GBP"
    label: "eCommerce Revenue GBP: Difference vs 1 Week Ago"
    description: "eCommerce Revenue GBP, difference (Current vs 1 Week Ago)"
    sql: ${total_ecommerce_revenue_gbp_constant_budget_adj}-${total_ecommerce_revenue_gbp_constant_budget_adj_1_week_ago} ;;
    value_format_name: gbp
  }

  measure: total_ecommerce_revenue_gbp_constant_budget_adj_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "eCommerce Revenue GBP"
    label: "eCommerce Revenue GBP: % Difference vs 1 Week Ago"
    description: "eCommerce Revenue GBP, percentage difference (Current vs 1 Week Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_revenue_gbp_constant_budget_adj_1_week_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_revenue_gbp_constant_budget_adj_difference_current_vs_1_week_ago}/${total_ecommerce_revenue_gbp_constant_budget_adj_1_week_ago}
                END;;
    value_format_name: percent_1
  }



  measure: total_ecommerce_revenue_gbp_constant_budget_adj_2_weeks_ago {
    type:  sum
    group_label: "eCommerce Revenue GBP"
    label: "eCommerce Revenue GBP 2 Weeks Ago"
    description: "Total ecommerce revenue from all affiliates in GBP, 14 days ago."
    sql: (${ecommerce_revenue_gbp_constant_budget_adj_2_week_ago});;
    value_format_name: gbp
  }

  measure: total_ecommerce_revenue_gbp_constant_budget_adj_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "eCommerce Revenue GBP"
    label: "eCommerce Revenue GBP: Difference vs 2 Weeks Ago"
    description: "eCommerce Revenue GBP, difference (Current vs 2 Weeks Ago)"
    sql: ${total_ecommerce_revenue_gbp_constant_budget_adj}-${total_ecommerce_revenue_gbp_constant_budget_adj_2_weeks_ago} ;;
    value_format_name: gbp
  }

  measure: total_ecommerce_revenue_gbp_constant_budget_adj_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "eCommerce Revenue GBP"
    label: "eCommerce Revenue GBP: % Difference vs 2 Weeks Ago"
    description: "eCommerce Revenue GBP, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_revenue_gbp_constant_budget_adj_2_weeks_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_revenue_gbp_constant_budget_adj_difference_current_vs_2_weeks_ago}/${total_ecommerce_revenue_gbp_constant_budget_adj_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ecommerce_revenue_gbp_constant_budget_adj_4_weeks_ago {
    type:  sum
    group_label: "eCommerce Revenue GBP"
    label: "eCommerce Revenue GBP 4 Weeks Ago"
    description: "Total ecommerce revenue from all affiliates in GBP, 28 days ago"
    sql: ${ecommerce_revenue_gbp_constant_budget_adj_4_week_ago};;
    value_format_name: gbp
  }

  measure: total_ecommerce_revenue_gbp_constant_budget_adj_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "eCommerce Revenue GBP"
    label: "eCommerce Revenue GBP: Difference vs 4 Weeks Ago"
    description: "eCommerce Revenue GBP, difference (Current vs 4 Weeks Ago)"
    sql: ${total_ecommerce_revenue_gbp_constant_budget_adj}-${total_ecommerce_revenue_gbp_constant_budget_adj_4_weeks_ago} ;;
    value_format_name: gbp
  }

  measure: total_ecommerce_revenue_gbp_constant_budget_adj_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "eCommerce Revenue GBP"
    label: "eCommerce Revenue GBP: % Difference vs 4 Weeks Ago"
    description: "eCommerce Revenue GBP, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_revenue_gbp_constant_budget_adj_4_weeks_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_revenue_gbp_constant_budget_adj_difference_current_vs_4_weeks_ago}/${total_ecommerce_revenue_gbp_constant_budget_adj_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ecommerce_revenue_gbp_constant_budget_adj_52_weeks_ago {
    type:  sum
    group_label: "eCommerce Revenue GBP"
    label: "eCommerce Revenue GBP 52 Weeks Ago"
    description: "Total ecommerce revenue from all affiliates in GBP, 52 weeks ago"
    sql: ${ecommerce_revenue_gbp_constant_budget_adj_52_week_ago};;
    value_format_name: gbp
  }

  measure: total_ecommerce_revenue_gbp_constant_budget_adj_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "eCommerce Revenue GBP"
    label: "eCommerce Revenue GBP: Difference vs 52 Weeks Ago"
    description: "eCommerce Revenue GBP, difference (Current vs 52 Weeks Ago)"
    sql: ${total_ecommerce_revenue_gbp_constant_budget_adj}-${total_ecommerce_revenue_gbp_constant_budget_adj_52_weeks_ago} ;;
    value_format_name: gbp
  }

  measure: total_ecommerce_revenue_gbp_constant_budget_adj_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "eCommerce Revenue GBP"
    label: "eCommerce Revenue GBP: % Difference vs 52 Weeks Ago"
    description: "eCommerce Revenue GBP, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_revenue_gbp_constant_budget_adj_52_weeks_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_revenue_gbp_constant_budget_adj_difference_current_vs_52_weeks_ago}/${total_ecommerce_revenue_gbp_constant_budget_adj_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ecommerce_revenue_gbp_constant_budget_adj_comparison_period {
    group_label: "eCommerce Revenue GBP"
    description: "Total ecommerce revenue from all affiliates in GBP, in selected comparison period"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} eCommerce Revenue GBP 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} eCommerce Revenue GBP 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} eCommerce Revenue GBP 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} eCommerce Revenue GBP 52 weeks ago
    {% else %} eCommerce Revenue GBP in Comparison Period
    {% endif %}"
    value_format_name: gbp
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ecommerce_revenue_gbp_constant_budget_adj_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ecommerce_revenue_gbp_constant_budget_adj_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ecommerce_revenue_gbp_constant_budget_adj_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ecommerce_revenue_gbp_constant_budget_adj_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ecommerce_revenue_gbp_constant_budget_adj_difference_vs_comparison_period {
    group_label: "eCommerce Revenue GBP"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} eCommerce Revenue GBP Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} eCommerce Revenue GBP Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} eCommerce Revenue GBPDifference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} eCommerce Revenue GBP Difference vs 52 weeks ago
    {% else %} eCommerce Revenue GBP Difference vs Comparison Period
    {% endif %}"
    description: "Total ecommerce revenue from all affiliates in GBP, difference vs selected comparison period"
    value_format_name: gbp
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ecommerce_revenue_gbp_constant_budget_adj_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ecommerce_revenue_gbp_constant_budget_adj_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ecommerce_revenue_gbp_constant_budget_adj_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ecommerce_revenue_gbp_constant_budget_adj_difference_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ecommerce_revenue_gbp_constant_budget_adj_pct_change_vs_comparison_period {
    group_label: "eCommerce Revenue GBP"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} eCommerce Revenue GBP % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} eCommerce Revenue GBP % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} eCommerce Revenue GBP % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} eCommerce Revenue GBP % Difference vs 52 weeks ago
    {% else %} eCommerce Revenue GBP % Change vs Comparison Period
    {% endif %}"
    description: "Total ecommerce revenue from all affiliates in GBP, % difference vs selected comparison period"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ecommerce_revenue_gbp_constant_budget_adj_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ecommerce_revenue_gbp_constant_budget_adj_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ecommerce_revenue_gbp_constant_budget_adj_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ecommerce_revenue_gbp_constant_budget_adj_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }



#new ecom revenue dynamic


  measure: total_ecommerce_revenue_constant_budget_adj {
    group_label: "Dynamic Selectors"
    label:
    "{% if currency_selector._parameter_value == 'usd' %} eCom Revenue ($)
    {% elsif currency_selector._parameter_value == 'gbp' %} eCom Revenue (£)
    {% else %} eCom Revenue
    {% endif %}"
    sql:
      {% if currency_selector._parameter_value == "usd" %} ${total_ecommerce_revenue_usd_constant_budget_adj}
      {% elsif currency_selector._parameter_value == "gbp" %} ${total_ecommerce_revenue_gbp_constant_budget_adj}
      {%else%} NULL
      {% endif %};;
    html:
      {% if currency_selector._parameter_value == "usd" %} {{total_ecommerce_revenue_usd_constant_budget_adj._rendered_value }}
      {% elsif currency_selector._parameter_value == "gbp" %} {{total_ecommerce_revenue_gbp_constant_budget_adj._rendered_value }}
      {% else %} NULL
      {% endif %} ;;
    type: number
  }

  measure: total_ecommerce_revenue_constant_budget_adj_in_comparison_period {
    group_label: "Dynamic Selectors"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' and currency_selector._parameter_value == 'usd' %} eCom Revenue ($) : 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' and currency_selector._parameter_value == 'usd' %} eCom Revenue ($) : 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' and currency_selector._parameter_value == 'usd' %} eCom Revenue ($) : 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' and currency_selector._parameter_value == 'usd' %} eCom Revenue ($) : 52 weeks ago
    {% elsif comparison_period._parameter_value == '7_days_ago' and currency_selector._parameter_value == 'gbp' %} eCom Revenue (£) : 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' and currency_selector._parameter_value == 'gbp' %} eCom Revenue (£) : 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' and currency_selector._parameter_value == 'gbp' %} eCom Revenue (£) : 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' and currency_selector._parameter_value == 'gbp' %} eCom Revenue (£) : 52 weeks ago
    {% else %} eCom Revenue in comparison Period
    {% endif %}"
    description: "eCom Revenue in selected comparison period"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_revenue_usd_constant_budget_adj_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_revenue_usd_constant_budget_adj_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_revenue_usd_constant_budget_adj_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_revenue_usd_constant_budget_adj_52_weeks_ago}
      {% elsif comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_revenue_gbp_constant_budget_adj_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_revenue_gbp_constant_budget_adj_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_revenue_gbp_constant_budget_adj_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_revenue_gbp_constant_budget_adj_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html:
      {% if comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "usd" %} {{total_ecommerce_revenue_usd_constant_budget_adj_1_week_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "usd" %} {{total_ecommerce_revenue_usd_constant_budget_adj_2_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "usd" %} {{total_ecommerce_revenue_usd_constant_budget_adj_4_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "usd" %} {{total_ecommerce_revenue_usd_constant_budget_adj_52_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "gbp" %} {{total_ecommerce_revenue_gbp_constant_budget_adj_1_week_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "gbp" %} {{total_ecommerce_revenue_gbp_constant_budget_adj_2_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "gbp" %} {{total_ecommerce_revenue_gbp_constant_budget_adj_4_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "gbp" %} {{total_ecommerce_revenue_gbp_constant_budget_adj_52_weeks_ago._rendered_value }}
      {% else %} NULL
      {% endif %} ;;
  }


  measure: total_ecommerce_revenue_constant_budget_adj_pct_change_vs_comparison_period {
    group_label: "Dynamic Selectors"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} eCom Revenue % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} eCom Revenue % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} eCom Revenue % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} eCom Revenue % Difference vs 52 weeks ago
    {% else %} eCom Revenue % Difference vs Comparison Period
    {% endif %}"
    description: "eCom Revenue % difference vs selected comparison period"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_revenue_usd_constant_budget_adj_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_revenue_usd_constant_budget_adj_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_revenue_usd_constant_budget_adj_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_revenue_usd_constant_budget_adj_pct_change_current_vs_52_weeks_ago}
      {% elsif comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_revenue_gbp_constant_budget_adj_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_revenue_gbp_constant_budget_adj_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_revenue_gbp_constant_budget_adj_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_revenue_gbp_constant_budget_adj_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
    value_format_name: "percent_1"
  }


# NEW SOV
  measure: total_ecommerce_sales_order_value_usd_constant_budget_adj {
    group_label: "SOV USD"
    label: "SOV USD"
    description: "Total ecommerce sales order value from all affiliates in USD. Values converted based on constant budget exchange rate, adjusted to account for pending transactions."
    type: sum
    value_format_name: usd
    value_format: "[>=1000000]\"$\"0.0,,\"M\";[>=1000]\"$\"0.0,\"K\";\"$\"0.0"
    sql: ${ecommerce_sales_order_value_usd_constant_budget_adj} ;;
  }

  measure: total_ecommerce_sales_order_value_usd_constant_budget_adj_1_week_ago {
    group_label: "SOV USD"
    label: "SOV USD 1 week ago"
    description: "Total ecommerce sales order value from all affiliates in USD, 7 days ago. Values converted based on constant budget exchange rate, adjusted to account for pending transactions."
    type: sum
    value_format_name: usd
    sql: ${ecommerce_sales_order_value_usd_constant_budget_adj_1_week_ago};;
  }

  measure:total_ecommerce_sales_order_value_usd_constant_budget_adj_difference_current_vs_1_week_ago {
    type:  number
    group_label: "SOV USD"
    label: "SOV USD: Difference vs 1 Week Ago"
    description: "Total ecommerce sales order value from all affiliates in USD. Values converted based on constant budget exchange rate, adjusted to account for pending transactions, difference (Current vs 1 Week Ago)"
    sql: ${total_ecommerce_revenue_usd_constant_budget_adj}-${total_ecommerce_revenue_usd_constant_budget_adj_1_week_ago} ;;
    value_format_name: usd
  }

  measure: total_ecommerce_sales_order_value_usd_constant_budget_adj_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "SOV USD"
    label: "SOV USD: % Difference vs 1 Week Ago"
    description: "Total ecommerce sales order value from all affiliates in USD. Values converted based on constant budget exchange rate, adjusted to account for pending transactions, percentage difference (Current vs 1 Week Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_sales_order_value_usd_constant_budget_adj_1_week_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_sales_order_value_usd_constant_budget_adj_difference_current_vs_1_week_ago}/${total_ecommerce_sales_order_value_usd_constant_budget_adj_1_week_ago}
                END;;
    value_format_name: percent_1
  }



  measure: total_ecommerce_sales_order_value_usd_constant_budget_adj_2_weeks_ago {
    type:  sum
    group_label: "SOV USD"
    label: "SOV USD 2 Weeks Ago"
    description: "Total ecommerce sales order value from all affiliates in USD. Values converted based on constant budget exchange rate, adjusted to account for pending transactions, 14 days ago."
    sql: ${ecommerce_sales_order_value_usd_constant_budget_adj_2_week_ago};;

    value_format_name: usd
  }

  measure: total_ecommerce_sales_order_value_usd_constant_budget_adj_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "SOV USD"
    label: "SOV USD: Difference vs 2 Weeks Ago"
    description: "SOV USD, difference (Current vs 2 Weeks Ago)"
    sql: ${total_ecommerce_sales_order_value_usd_constant_budget_adj}-${total_ecommerce_sales_order_value_usd_constant_budget_adj_2_weeks_ago} ;;
    value_format_name: usd
  }

  measure: total_ecommerce_sales_order_value_usd_constant_budget_adj_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "SOV USD"
    label: "SOV USD: % Difference vs 2 Weeks Ago"
    description: "SOV USD, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_sales_order_value_usd_constant_budget_adj_2_weeks_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_sales_order_value_usd_constant_budget_adj_difference_current_vs_2_weeks_ago}/${total_ecommerce_sales_order_value_usd_constant_budget_adj_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ecommerce_sales_order_value_usd_constant_budget_adj_4_weeks_ago {
    type:  sum
    group_label: "SOV USD"
    label: "SOV USD 4 Weeks Ago"
    description: "Total ecommerce sales order value from all affiliates in USD. Values converted based on constant budget exchange rate, adjusted to account for pending transactions, 28 days ago"
    sql: ${ecommerce_sales_order_value_usd_constant_budget_adj_4_week_ago};;

    value_format_name: usd
  }

  measure: total_ecommerce_sales_order_value_usd_constant_budget_adj_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "SOV USD"
    label: "SOV USD: Difference vs 4 Weeks Ago"
    description: "SOV USD, difference (Current vs 4 Weeks Ago)"
    sql: ${total_ecommerce_sales_order_value_usd_constant_budget_adj}-${total_ecommerce_sales_order_value_usd_constant_budget_adj_4_weeks_ago} ;;
    value_format_name: usd
  }

  measure: total_ecommerce_sales_order_value_usd_constant_budget_adj_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "SOV USD"
    label: "SOV USD: % Difference vs 4 Weeks Ago"
    description: "SOV USD, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_sales_order_value_usd_constant_budget_adj_4_weeks_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_sales_order_value_usd_constant_budget_adj_difference_current_vs_4_weeks_ago}/${total_ecommerce_sales_order_value_usd_constant_budget_adj_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ecommerce_sales_order_value_usd_constant_budget_adj_52_weeks_ago {
    type:  sum
    group_label: "SOV USD"
    label: "SOV USD 52 Weeks Ago"
    description: "Total ecommerce sales order value from all affiliates in USD. Values converted based on constant budget exchange rate, adjusted to account for pending transactions, 52 weeks ago"
    sql: ${ecommerce_sales_order_value_usd_constant_budget_adj_52_week_ago};;

    value_format_name: usd
  }

  measure: total_ecommerce_sales_order_value_usd_constant_budget_adj_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "SOV USD"
    label: "SOV USD: Difference vs 52 Weeks Ago"
    description: "SOV USD, difference (Current vs 52 Weeks Ago)"
    sql: ${total_ecommerce_sales_order_value_usd_constant_budget_adj}-${total_ecommerce_sales_order_value_usd_constant_budget_adj_52_weeks_ago} ;;
    value_format_name: usd
  }

  measure: total_ecommerce_sales_order_value_usd_constant_budget_adj_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "SOV USD"
    label: "SOV USD: % Difference vs 52 Weeks Ago"
    description: "SOV USD, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_sales_order_value_usd_constant_budget_adj_52_weeks_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_sales_order_value_usd_constant_budget_adj_difference_current_vs_52_weeks_ago}/${total_ecommerce_sales_order_value_usd_constant_budget_adj_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ecommerce_sales_order_value_usd_constant_budget_adj_comparison_period {
    group_label: "SOV USD"
    description: "Total SOV from all affiliates in USD, in selected comparison period"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} SOV USD 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} SOV USD 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} SOV USD 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} SOV USD 52 weeks ago
    {% else %} SOV USD in Comparison Period
    {% endif %}"
    value_format_name: usd
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ecommerce_sales_order_value_usd_constant_budget_adj_difference_vs_comparison_period {
    group_label: "SOV USD"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} SOV USD Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} SOV USD Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} SOV USD Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} SOV USD Difference vs 52 weeks ago
    {% else %} SOV USD Difference vs Comparison Period
    {% endif %}"
    description: "Total SOV from all affiliates in USD, difference vs selected comparison period"
    value_format_name: usd
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_difference_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ecommerce_sales_order_value_usd_constant_budget_adj_pct_change_vs_comparison_period {
    group_label: "SOV USD"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} SOV USD % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} SOV USD % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} SOV USD % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} SOV USD % Difference vs 52 weeks ago
    {% else %} SOV USD % Change vs Comparison Period
    {% endif %}"
    description: "Total SOV from all affiliates in USD, % difference vs selected comparison period"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }

#NEW SOV GBP

  measure: total_ecommerce_sales_order_value_gbp_constant_budget_adj {
    group_label: "SOV GBP"
    label: "SOV GBP"
    description: "Total ecommerce sales order value from all affiliates in GBP. Values converted based on constant budget exchange rate, adjusted to account for pending transactions."
    type: sum
    value_format_name: gbp
    value_format: "[>=1000000]\"£\"0.00,,\"M\";[>=1000]\"£\"0.00,\"K\";\"£\"0.00"
    sql: ${ecommerce_sales_order_value_gbp_constant_budget_adj} ;;
  }

  measure: total_ecommerce_sales_order_value_gbp_constant_budget_adj_1_week_ago {
    group_label: "SOV GBP"
    label: "SOV GBP 1 week ago"
    description: "Total ecommerce sales order value from all affiliates in GBP, 7 days ago. Values converted based on constant budget exchange rate, adjusted to account for pending transactions."
    type: sum
    value_format_name: gbp
    sql: ${ecommerce_sales_order_value_gbp_constant_budget_adj_1_week_ago};;
  }

  measure:total_ecommerce_sales_order_value_gbp_constant_budget_adj_difference_current_vs_1_week_ago {
    type:  number
    group_label: "SOV GBP"
    label: "SOV GBP: Difference vs 1 Week Ago"
    description: "Total ecommerce sales order value from all affiliates in GBP. Values converted based on constant budget exchange rate, adjusted to account for pending transactions, difference (Current vs 1 Week Ago)"
    sql: ${total_ecommerce_revenue_gbp_constant_budget_adj}-${total_ecommerce_revenue_gbp_constant_budget_adj_1_week_ago} ;;
    value_format_name: gbp
  }

  measure: total_ecommerce_sales_order_value_gbp_constant_budget_adj_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "SOV GBP"
    label: "SOV GBP: % Difference vs 1 Week Ago"
    description: "Total ecommerce sales order value from all affiliates in GBP. Values converted based on constant budget exchange rate, adjusted to account for pending transactions, percentage difference (Current vs 1 Week Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_1_week_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_difference_current_vs_1_week_ago}/${total_ecommerce_sales_order_value_gbp_constant_budget_adj_1_week_ago}
                END;;
    value_format_name: percent_1
  }



  measure: total_ecommerce_sales_order_value_gbp_constant_budget_adj_2_weeks_ago {
    type:  sum
    group_label: "SOV GBP"
    label: "SOV GBP 2 Weeks Ago"
    description: "Total ecommerce sales order value from all affiliates in GBP. Values converted based on constant budget exchange rate, adjusted to account for pending transactions, 14 days ago."
    sql: ${ecommerce_sales_order_value_gbp_constant_budget_adj_2_week_ago};;
    value_format_name: gbp
  }

  measure: total_ecommerce_sales_order_value_gbp_constant_budget_adj_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "SOV GBP"
    label: "SOV GBP: Difference vs 2 Weeks Ago"
    description: "SOV GBP, difference (Current vs 2 Weeks Ago)"
    sql: ${total_ecommerce_sales_order_value_gbp_constant_budget_adj}-${total_ecommerce_sales_order_value_gbp_constant_budget_adj_2_weeks_ago} ;;
    value_format_name: gbp
  }

  measure: total_ecommerce_sales_order_value_gbp_constant_budget_adj_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "SOV GBP"
    label: "SOV GBP: % Difference vs 2 Weeks Ago"
    description: "SOV GBP, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_2_weeks_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_difference_current_vs_2_weeks_ago}/${total_ecommerce_sales_order_value_gbp_constant_budget_adj_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ecommerce_sales_order_value_gbp_constant_budget_adj_4_weeks_ago {
    type:  sum
    group_label: "SOV GBP"
    label: "SOV GBP 4 Weeks Ago"
    description: "Total ecommerce sales order value from all affiliates in GBP. Values converted based on constant budget exchange rate, adjusted to account for pending transactions, 28 days ago"
    sql: ${ecommerce_sales_order_value_gbp_constant_budget_adj_4_week_ago};;
    value_format_name: gbp
  }

  measure: total_ecommerce_sales_order_value_gbp_constant_budget_adj_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "SOV GBP"
    label: "SOV GBP: Difference vs 4 Weeks Ago"
    description: "SOV GBP, difference (Current vs 4 Weeks Ago)"
    sql: ${total_ecommerce_sales_order_value_gbp_constant_budget_adj}-${total_ecommerce_sales_order_value_gbp_constant_budget_adj_4_weeks_ago} ;;
    value_format_name: gbp
  }

  measure: total_ecommerce_sales_order_value_gbp_constant_budget_adj_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "SOV GBP"
    label: "SOV GBP: % Difference vs 4 Weeks Ago"
    description: "SOV GBP, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_4_weeks_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_difference_current_vs_4_weeks_ago}/${total_ecommerce_sales_order_value_gbp_constant_budget_adj_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ecommerce_sales_order_value_gbp_constant_budget_adj_52_weeks_ago {
    type:  sum
    group_label: "SOV GBP"
    label: "SOV GBP 52 Weeks Ago"
    description: "Total ecommerce sales order value from all affiliates in GBP. Values converted based on constant budget exchange rate, adjusted to account for pending transactions, 52 weeks ago"
    sql: ${ecommerce_sales_order_value_gbp_constant_budget_adj_52_week_ago};;

    value_format_name: gbp
  }

  measure: total_ecommerce_sales_order_value_gbp_constant_budget_adj_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "SOV GBP"
    label: "SOV GBP: Difference vs 52 Weeks Ago"
    description: "SOV GBP, difference (Current vs 52 Weeks Ago)"
    sql: ${total_ecommerce_sales_order_value_gbp_constant_budget_adj}-${total_ecommerce_sales_order_value_gbp_constant_budget_adj_52_weeks_ago} ;;
    value_format_name: gbp
  }

  measure: total_ecommerce_sales_order_value_gbp_constant_budget_adj_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "SOV GBP"
    label: "SOV GBP: % Difference vs 52 Weeks Ago"
    description: "SOV GBP, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_52_weeks_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_difference_current_vs_52_weeks_ago}/${total_ecommerce_sales_order_value_gbp_constant_budget_adj_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ecommerce_sales_order_value_gbp_constant_budget_adj_comparison_period {
    group_label: "SOV GBP"
    description: "Total SOV from all affiliates in GBP, in selected comparison period"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} SOV GBP 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} SOV GBP 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} SOV GBP 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} SOV GBP 52 weeks ago
    {% else %} SOV GBP in Comparison Period
    {% endif %}"
    value_format_name: gbp
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ecommerce_sales_order_value_gbp_constant_budget_adj_difference_vs_comparison_period {
    group_label: "SOV GBP"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} SOV GBP Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} SOV GBP Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} SOV GBPDifference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} SOV GBP Difference vs 52 weeks ago
    {% else %} SOV GBP Difference vs Comparison Period
    {% endif %}"
    description: "Total SOV from all affiliates in GBP, difference vs selected comparison period"
    value_format_name: gbp
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_difference_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ecommerce_sales_order_value_gbp_constant_budget_adj_pct_change_vs_comparison_period {
    group_label: "SOV GBP"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} SOV GBP % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} SOV GBP % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} SOV GBP % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} SOV GBP % Difference vs 52 weeks ago
    {% else %} SOV GBP % Change vs Comparison Period
    {% endif %}"
    description: "Total SOV from all affiliates in GBP, % difference vs selected comparison period"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }


#-----------------------------------------------------------------------------------------------------------------------------
#NEW DYNAMIC SOV



  measure: total_ecommerce_sales_order_value_constant_budget_adj {
    group_label: "Dynamic Selectors"
    label:
    "{% if currency_selector._parameter_value == 'usd' %} SOV ($)
    {% elsif currency_selector._parameter_value == 'gbp' %} SOV (£)
    {% else %} SOV
    {% endif %}"
    sql:
      {% if currency_selector._parameter_value == "usd" %} ${total_ecommerce_sales_order_value_usd_constant_budget_adj}
      {% elsif currency_selector._parameter_value == "gbp" %} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj}
      {%else%} NULL
      {% endif %};;
    html:
      {% if currency_selector._parameter_value == "usd" %} {{total_ecommerce_sales_order_value_usd_constant_budget_adj._rendered_value }}
      {% elsif currency_selector._parameter_value == "gbp" %} {{total_ecommerce_sales_order_value_gbp_constant_budget_adj._rendered_value }}
      {% else %} NULL
      {% endif %} ;;
    type: number
  }

  measure: total_ecommerce_sales_order_value_constant_budget_adj_in_comparison_period {
    group_label: "Dynamic Selectors"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' and currency_selector._parameter_value == 'usd' %} SOV ($) : 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' and currency_selector._parameter_value == 'usd' %} SOV ($) : 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' and currency_selector._parameter_value == 'usd' %} SOV ($) : 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' and currency_selector._parameter_value == 'usd' %} SOV ($) : 52 weeks ago
    {% elsif comparison_period._parameter_value == '7_days_ago' and currency_selector._parameter_value == 'gbp' %} SOV (£) : 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' and currency_selector._parameter_value == 'gbp' %} SOV (£) : 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' and currency_selector._parameter_value == 'gbp' %} SOV (£) : 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' and currency_selector._parameter_value == 'gbp' %} SOV (£) : 52 weeks ago
    {% else %} SOV in comparison Period
    {% endif %}"
    description: "SOV in selected comparison period"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_52_weeks_ago}
      {% elsif comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html:
      {% if comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "usd" %} {{total_ecommerce_sales_order_value_usd_constant_budget_adj_1_week_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "usd" %} {{total_ecommerce_sales_order_value_usd_constant_budget_adj_2_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "usd" %} {{total_ecommerce_sales_order_value_usd_constant_budget_adj_4_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "usd" %} {{total_ecommerce_sales_order_value_usd_constant_budget_adj_52_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "gbp" %} {{total_ecommerce_sales_order_value_gbp_constant_budget_adj_1_week_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "gbp" %} {{total_ecommerce_sales_order_value_gbp_constant_budget_adj_2_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "gbp" %} {{total_ecommerce_sales_order_value_gbp_constant_budget_adj_4_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "gbp" %} {{total_ecommerce_sales_order_value_gbp_constant_budget_adj_52_weeks_ago._rendered_value }}
      {% else %} NULL
      {% endif %} ;;
  }


  measure: total_ecommerce_sales_order_value_constant_budget_adj_pct_change_vs_comparison_period {
    group_label: "Dynamic Selectors"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} SOV % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} SOV % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} SOV % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} SOV % Difference vs 52 weeks ago
    {% else %} SOV % Difference vs Comparison Period
    {% endif %}"
    description: "SOV % difference vs selected comparison period"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "usd" %} ${total_ecommerce_sales_order_value_usd_constant_budget_adj_pct_change_current_vs_52_weeks_ago}
      {% elsif comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "gbp" %} ${total_ecommerce_sales_order_value_gbp_constant_budget_adj_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
    value_format_name: "percent_1"
  }



# NEW TRANSACTION

  measure: total_ecommerce_transactions {
    group_label: "Transactions"
    label: "Total Ecommerce Transactions"
    description: "Total ecommerce transactions from all affiliates. Adjusted to account for pending transactions."
    type: sum
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
    sql: ${ecommerce_transactions_adj} ;;
  }

  measure: total_ecommerce_transactions_1_week_ago {
    group_label: "Transactions"
    label: "Transactions 1 week ago"
    description: "Total ecommerce transactions from all affiliates, 7 days ago. Adjusted to account for pending transactions."
    type: sum
    value_format_name: decimal_0
    sql: ${ecommerce_transactions_adj_1_week_ago} ;;
  }

# Comparative metrics

  measure: total_ecommerce_transactions_difference_current_vs_1_week_ago {
    type:  number
    group_label: "Transactions"
    label: "Transactions: Difference vs 1 week Ago"
    description: "Transactions difference  (Current vs 1 week Ago)"
    sql: ${total_ecommerce_transactions}-${total_ecommerce_transactions_1_week_ago} ;;
    value_format: "#,###"
  }

  measure: total_ecommerce_transactions_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "Transactions"
    label: "Transactions: % Difference vs 1 week Ago"
    description: "Transactions, percentage difference (Current vs 1 week Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_transactions_1_week_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_transactions_difference_current_vs_1_week_ago}/${total_ecommerce_transactions_1_week_ago}
                END;;
    value_format_name: percent_1
  }


  measure: total_ecommerce_transactions_2_weeks_ago {
    type: sum
    group_label: "Transactions"
    label: "Transactions 2 weeks ago"
    description: "Transactions  - sum of Transactions - same day 14 days ago"
    sql: ${ecommerce_transactions_adj_2_week_ago};;
    value_format: "#,###"
  }

  # Comparative metrics

  measure: total_ecommerce_transactions_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "Transactions"
    label: "Transactions: Difference vs 2 Weeks Ago"
    description: "Transactions difference  (Current vs 2 Weeks Ago)"
    sql: ${total_ecommerce_transactions}-${total_ecommerce_transactions_2_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_ecommerce_transactions_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "Transactions"
    label: "Transactions: % Difference vs 2 Weeks Ago"
    description: "Transactions, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_transactions_2_weeks_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_transactions_difference_current_vs_2_weeks_ago}/${total_ecommerce_transactions_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }



  measure: total_ecommerce_transactions_4_weeks_ago {
    type: sum
    group_label: "Transactions"
    label: "Transactions 4 weeks ago"
    description: "Transactions- sum of Transactions - same day 28 days ago"
    sql: ${ecommerce_transactions_adj_4_week_ago};;
    value_format: "#,###"
  }

  # Comparative metrics

  measure: total_ecommerce_transactions_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "Transactions"
    label: "Transactions: Difference vs 4 Weeks Ago"
    description: "Transactions difference  (Current vs 4 Weeks Ago)"
    sql: ${total_ecommerce_transactions}-${total_ecommerce_transactions_4_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_ecommerce_transactions_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "Transactions"
    label: "Transactions: % Difference vs 4 Weeks Ago"
    description: "Transactions, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_transactions_4_weeks_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_transactions_difference_current_vs_4_weeks_ago}/${total_ecommerce_transactions_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_ecommerce_transactions_52_weeks_ago {
    type: sum
    group_label: "Transactions"
    label: "Transactions 52 weeks ago"
    description: "Transactions - sum of Transactions - same day 52 weeks ago"
    sql: ${ecommerce_transactions_adj_52_week_ago};;
    value_format: "#,###"
  }

  # Comparative metrics

  measure: total_ecommerce_transactions_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "Transactions"
    label: "Transactions: Difference vs 52 Weeks Ago"
    description: "Transactions difference (Current vs 52 Weeks Ago)"
    sql: ${total_ecommerce_transactions}-${total_ecommerce_transactions_52_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_ecommerce_transactions_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "Transactions"
    label: "Transactions: % Difference vs 52 Weeks Ago"
    description: "Transactions, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_ecommerce_transactions_52_weeks_ago} = 0 THEN 0
                  ELSE ${total_ecommerce_transactions_difference_current_vs_52_weeks_ago}/${total_ecommerce_transactions_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }


# Dynamic Comparisons

  measure: total_ecommerce_transactions_comparison_period {
    group_label: "Transactions"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Transactions 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Transactions 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Transactions 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Transactions 52 weeks ago
    {% else %} Transactions in Comparison Period
    {% endif %}"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ecommerce_transactions_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ecommerce_transactions_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ecommerce_transactions_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ecommerce_transactions_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_ecommerce_transactions_difference_vs_comparison_period {
    group_label: "Transactions"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Transactions: Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Transactions: Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Transactions: Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Transactions: Difference vs 52 weeks ago
    {% else %} Transactions: Difference vs Comparison Period
    {% endif %}"
    description: "Transactions difference (Current vs chosen prior period)"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ecommerce_transactions_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ecommerce_transactions_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ecommerce_transactions_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ecommerce_transactions_difference_current_vs_52_weeks_ago}
      {% else %} NULL
      {% endif %} ;;
  }

  measure: total_ecommerce_transactions_pct_change_vs_comparison_period {
    group_label: "Transactions"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Transactions: % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Transactions: % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Transactions: % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Transactions: % Difference vs 52 weeks ago
    {% else %} Transactions: % Difference vs Comparison Period
    {% endif %}"
    description: "Transactions, percentage difference (Current vs chosen prior period)"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_ecommerce_transactions_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_ecommerce_transactions_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_ecommerce_transactions_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_ecommerce_transactions_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }


# new users

  measure: avg_daily_users {
    type: sum
    group_label: "Users"
    label: "Avg daily users"
    description: "Avg daily users - unique number of users"
    sql: ${users};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  measure: avg_daily_users_1_week_ago {
    type: sum
    group_label: "Users"
    label: "Avg daily users 1 week ago"
    description: "Avg daily users - unique number of users - same day 7 days ago"
    sql: ${users_1_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

# Comparative metrics

  measure: avg_daily_users_difference_current_vs_1_week_ago {
    type:  number
    group_label: "Users"
    label: "Avg daily users: Difference vs 1 week Ago"
    description: "Avg daily users difference  (Current vs 1 week Ago)"
    sql: ${avg_daily_users}-${avg_daily_users_1_week_ago} ;;
    value_format: "#,###"
  }

  measure: avg_daily_users_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "Users"
    label: "Avg daily users: % Difference vs 1 week Ago"
    description: "Avg daily users, percentage difference (Current vs 1 week Ago)"
    sql:  CASE
                  WHEN ${avg_daily_users_1_week_ago} = 0 THEN 0
                  ELSE ${avg_daily_users_difference_current_vs_1_week_ago}/${avg_daily_users_1_week_ago}
                END;;
    value_format_name: percent_1
  }


  measure: avg_daily_users_2_weeks_ago {
    type: sum
    group_label: "Users"
    label: "Avg daily users 2 weeks ago"
    description: "Avg daily users  - unique number of users - same day 14 days ago"
    sql: ${users_2_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  # Comparative metrics

  measure: avg_daily_users_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "Users"
    label: "Avg daily users: Difference vs 2 Weeks Ago"
    description: "Avg daily users difference  (Current vs 2 Weeks Ago)"
    sql: ${avg_daily_users}-${avg_daily_users_2_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: avg_daily_users_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "Users"
    label: "Avg daily users: % Difference vs 2 Weeks Ago"
    description: "Avg daily users, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${avg_daily_users_2_weeks_ago} = 0 THEN 0
                  ELSE ${avg_daily_users_difference_current_vs_2_weeks_ago}/${avg_daily_users_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }



  measure: avg_daily_users_4_weeks_ago {
    type: sum
    group_label: "Users"
    label: "Avg daily users 4 weeks ago"
    description: "Avg daily users - unique number of users - same day 28 days ago"
    sql: ${users_4_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  # Comparative metrics

  measure: avg_daily_users_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "Users"
    label: "Avg daily users: Difference vs 4 Weeks Ago"
    description: "Avg daily users difference  (Current vs 4 Weeks Ago)"
    sql: ${avg_daily_users}-${avg_daily_users_4_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: avg_daily_users_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "Users"
    label: "Avg daily users: % Difference vs 4 Weeks Ago"
    description: "Avg daily users, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
                  WHEN ${avg_daily_users_4_weeks_ago} = 0 THEN 0
                  ELSE ${avg_daily_users_difference_current_vs_4_weeks_ago}/${avg_daily_users_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: avg_daily_users_52_weeks_ago {
    type: sum
    group_label: "Users"
    label: "Avg daily users 52 weeks ago"
    description: "Avg daily users - unique number of users - same day 52 weeks ago"
    sql: ${users_52_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  # Comparative metrics

  measure: avg_daily_users_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "Users"
    label: "Avg daily users: Difference vs 52 Weeks Ago"
    description: "Avg daily users difference (Current vs 52 Weeks Ago)"
    sql: ${avg_daily_users}-${avg_daily_users_52_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: avg_daily_users_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "Users"
    label: "Avg daily users: % Difference vs 52 Weeks Ago"
    description: "Avg daily users, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${avg_daily_users_52_weeks_ago} = 0 THEN 0
                  ELSE ${avg_daily_users_difference_current_vs_52_weeks_ago}/${avg_daily_users_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }


# Dynamic Comparisons

  measure: avg_daily_users_comparison_period {
    group_label: "Users"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Users 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Users 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Users 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Users 52 weeks ago
    {% else %} Users in Comparison Period
    {% endif %}"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${avg_daily_users_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${avg_daily_users_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${avg_daily_users_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${avg_daily_users_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: avg_daily_users_difference_vs_comparison_period {
    group_label: "Users"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Users: Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Users: Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Users: Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Users: Difference vs 52 weeks ago
    {% else %} Users: Difference vs Comparison Period
    {% endif %}"
    description: "Users difference (Current vs chosen prior period)"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${avg_daily_users_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${avg_daily_users_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${avg_daily_users_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${avg_daily_users_difference_current_vs_52_weeks_ago}
      {% else %} NULL
      {% endif %} ;;
  }

  measure: avg_daily_users_pct_change_vs_comparison_period {
    group_label: "Users"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Users: % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Users: % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Users: % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Users: % Difference vs 52 weeks ago
      {% else %} Users: % Difference vs Comparison Period
    {% endif %}"
    description: "Users, percentage difference (Current vs chosen prior period)"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${avg_daily_users_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${avg_daily_users_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${avg_daily_users_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${avg_daily_users_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }



# NONSUBSCRIBED_USERS

# new NONSUBSCRIBED_USERS

  measure: avg_daily_nonsubscribed_users {
    type: sum
    group_label: "Nonsubscribed Users"
    label: "Avg daily nonsubscribed users"
    description: "Avg daily nonsubscribed users - unique number of nonsubscribed users"
    sql: ${nonsubscribed_users};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  measure: avg_daily_nonsubscribed_users_1_week_ago {
    type: sum
    group_label: "Nonsubscribed Users"
    label: "Avg daily nonsubscribed users 1 week ago"
    description: "Avg daily nonsubscribed users - unique number of nonsubscribed users - same day 7 days ago"
    sql: ${nonsubscribed_users_1_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

# Comparative metrics

  measure: avg_daily_nonsubscribed_users_difference_current_vs_1_week_ago {
    type:  number
    group_label: "Nonsubscribed Users"
    label: "Avg daily nonsubscribed users: Difference vs 1 week Ago"
    description: "Avg daily nonsubscribed users difference  (Current vs 1 week Ago)"
    sql: ${avg_daily_nonsubscribed_users}-${avg_daily_nonsubscribed_users_1_week_ago} ;;
    value_format: "#,###"
  }

  measure: avg_daily_nonsubscribed_users_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "Nonsubscribed Users"
    label: "Avg daily nonsubscribed users: % Difference vs 1 week Ago"
    description: "Avg daily nonsubscribed users, percentage difference (Current vs 1 week Ago)"
    sql:  CASE
                  WHEN ${avg_daily_nonsubscribed_users_1_week_ago} = 0 THEN 0
                  ELSE ${avg_daily_nonsubscribed_users_difference_current_vs_1_week_ago}/${avg_daily_nonsubscribed_users_1_week_ago}
                END;;
    value_format_name: percent_1
  }


  measure: avg_daily_nonsubscribed_users_2_weeks_ago {
    type: sum
    group_label: "Nonsubscribed Users"
    label: "Avg daily nonsubscribed users 2 weeks ago"
    description: "Avg daily nonsubscribed users  - unique number of nonsubscribed users - same day 14 days ago"
    sql: ${nonsubscribed_users_2_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  # Comparative metrics

  measure: avg_daily_nonsubscribed_users_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "Nonsubscribed Users"
    label: "Avg daily nonsubscribed users: Difference vs 2 Weeks Ago"
    description: "Avg daily nonsubscribed users difference  (Current vs 2 Weeks Ago)"
    sql: ${avg_daily_nonsubscribed_users}-${avg_daily_nonsubscribed_users_2_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: avg_daily_nonsubscribed_users_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "Nonsubscribed Users"
    label: "Avg daily nonsubscribed users: % Difference vs 2 Weeks Ago"
    description: "Avg daily nonsubscribed users, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${avg_daily_nonsubscribed_users_2_weeks_ago} = 0 THEN 0
                  ELSE ${avg_daily_nonsubscribed_users_difference_current_vs_2_weeks_ago}/${avg_daily_nonsubscribed_users_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }



  measure: avg_daily_nonsubscribed_users_4_weeks_ago {
    type: sum
    group_label: "Nonsubscribed Users"
    label: "Avg daily nonsubscribed users 4 weeks ago"
    description: "Avg daily nonsubscribed users - unique number of nonsubscribed users - same day 28 days ago"
    sql: ${nonsubscribed_users_4_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  # Comparative metrics

  measure: avg_daily_nonsubscribed_users_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "Nonsubscribed Users"
    label: "Avg daily nonsubscribed users: Difference vs 4 Weeks Ago"
    description: "Avg daily nonsubscribed users difference  (Current vs 4 Weeks Ago)"
    sql: ${avg_daily_nonsubscribed_users}-${avg_daily_nonsubscribed_users_4_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: avg_daily_nonsubscribed_users_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "Nonsubscribed Users"
    label: "Avg daily nonsubscribed users: % Difference vs 4 Weeks Ago"
    description: "Avg daily nonsubscribed users, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
                  WHEN ${avg_daily_nonsubscribed_users_4_weeks_ago} = 0 THEN 0
                  ELSE ${avg_daily_nonsubscribed_users_difference_current_vs_4_weeks_ago}/${avg_daily_nonsubscribed_users_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: avg_daily_nonsubscribed_users_52_weeks_ago {
    type: sum
    group_label: "Nonsubscribed Users"
    label: "Avg daily nonsubscribed users 52 weeks ago"
    description: "Avg daily nonsubscribed users - unique number of nonsubscribed users - same day 52 weeks ago"
    sql: ${nonsubscribed_users_52_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  # Comparative metrics

  measure: avg_daily_nonsubscribed_users_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "Nonsubscribed Users"
    label: "Avg daily nonsubscribed users: Difference vs 52 Weeks Ago"
    description: "Avg daily nonsubscribed users difference (Current vs 52 Weeks Ago)"
    sql: ${avg_daily_nonsubscribed_users}-${avg_daily_nonsubscribed_users_52_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: avg_daily_nonsubscribed_users_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "Nonsubscribed Users"
    label: "Avg daily nonsubscribed users: % Difference vs 52 Weeks Ago"
    description: "Avg daily nonsubscribed users, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${avg_daily_nonsubscribed_users_52_weeks_ago} = 0 THEN 0
                  ELSE ${avg_daily_nonsubscribed_users_difference_current_vs_52_weeks_ago}/${avg_daily_nonsubscribed_users_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }


# Dynamic Comparisons

  measure: avg_daily_nonsubscribed_users_comparison_period {
    group_label: "Nonsubscribed Users"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Nonsubscribed Users 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Nonsubscribed Users 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Nonsubscribed Users 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Nonsubscribed Users 52 weeks ago
    {% else %} Nonsubscribed Users in Comparison Period
    {% endif %}"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${avg_daily_nonsubscribed_users_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${avg_daily_nonsubscribed_users_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${avg_daily_nonsubscribed_users_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${avg_daily_nonsubscribed_users_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: avg_daily_nonsubscribed_users_difference_vs_comparison_period {
    group_label: "Nonsubscribed Users"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Nonsubscribed Users: Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Nonsubscribed Users: Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Nonsubscribed Users: Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Nonsubscribed Users: Difference vs 52 weeks ago
    {% else %} Nonsubscribed Users: Difference vs Comparison Period
    {% endif %}"
    description: "Nonsubscribed Users difference (Current vs chosen prior period)"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${avg_daily_nonsubscribed_users_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${avg_daily_nonsubscribed_users_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${avg_daily_nonsubscribed_users_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${avg_daily_nonsubscribed_users_difference_current_vs_52_weeks_ago}
      {% else %} NULL
      {% endif %} ;;
  }

  measure: avg_daily_nonsubscribed_users_pct_change_vs_comparison_period {
    group_label: "Nonsubscribed Users"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Nonsubscribed Users: % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Nonsubscribed Users: % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Nonsubscribed Users: % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Nonsubscribed Users: % Difference vs 52 weeks ago
    {% else %} Nonsubscribed Users: % Difference vs Comparison Period
    {% endif %}"
    description: "Nonsubscribed Users, percentage difference (Current vs chosen prior period)"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${avg_daily_nonsubscribed_users_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${avg_daily_nonsubscribed_users_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${avg_daily_nonsubscribed_users_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${avg_daily_nonsubscribed_users_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }

# NEW SUBSCRIBED_USERS

  measure: avg_daily_subscribed_users {
    type: sum
    group_label: "subscribed Users"
    label: "Avg daily subscribed users"
    description: "Avg daily nonsubscribed users - unique number of subscribed users"
    sql: ${subscribed_users};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  measure: avg_daily_subscribed_users_1_week_ago {
    type: sum
    group_label: "subscribed Users"
    label: "Avg daily subscribed users 1 week ago"
    description: "Avg daily subscribed users - unique number of subscribed users - same day 7 days ago"
    sql: ${subscribed_users_1_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

# Comparative metrics

  measure: avg_daily_subscribed_users_difference_current_vs_1_week_ago {
    type:  number
    group_label: "subscribed Users"
    label: "Avg daily subscribed users: Difference vs 1 week Ago"
    description: "Avg daily subscribed users difference  (Current vs 1 week Ago)"
    sql: ${avg_daily_subscribed_users}-${avg_daily_subscribed_users_1_week_ago} ;;
    value_format: "#,###"
  }

  measure: avg_daily_subscribed_users_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "subscribed Users"
    label: "Avg daily subscribed users: % Difference vs 1 week Ago"
    description: "Avg daily subscribed users, percentage difference (Current vs 1 week Ago)"
    sql:  CASE
                  WHEN ${avg_daily_subscribed_users_1_week_ago} = 0 THEN 0
                  ELSE ${avg_daily_subscribed_users_difference_current_vs_1_week_ago}/${avg_daily_subscribed_users_1_week_ago}
                END;;
    value_format_name: percent_1
  }


  measure: avg_daily_subscribed_users_2_weeks_ago {
    type: sum
    group_label: "subscribed Users"
    label: "Avg daily subscribed users 2 weeks ago"
    description: "Avg daily subscribed users  - unique number of subscribed users - same day 14 days ago"
    sql: ${subscribed_users_2_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  # Comparative metrics

  measure: avg_daily_subscribed_users_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "subscribed Users"
    label: "Avg daily subscribed users: Difference vs 2 Weeks Ago"
    description: "Avg daily subscribed users difference  (Current vs 2 Weeks Ago)"
    sql: ${avg_daily_subscribed_users}-${avg_daily_subscribed_users_2_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: avg_daily_subscribed_users_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "subscribed Users"
    label: "Avg daily subscribed users: % Difference vs 2 Weeks Ago"
    description: "Avg daily subscribed users, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${avg_daily_subscribed_users_2_weeks_ago} = 0 THEN 0
                  ELSE ${avg_daily_subscribed_users_difference_current_vs_2_weeks_ago}/${avg_daily_subscribed_users_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }



  measure: avg_daily_subscribed_users_4_weeks_ago {
    type: sum
    group_label: "subscribed Users"
    label: "Avg daily subscribed users 4 weeks ago"
    description: "Avg daily subscribed users - unique number of subscribed users - same day 28 days ago"
    sql: ${subscribed_users_4_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  # Comparative metrics

  measure: avg_daily_subscribed_users_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "subscribed Users"
    label: "Avg daily subscribed users: Difference vs 4 Weeks Ago"
    description: "Avg daily subscribed users difference  (Current vs 4 Weeks Ago)"
    sql: ${avg_daily_subscribed_users}-${avg_daily_subscribed_users_4_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: avg_daily_subscribed_users_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "subscribed Users"
    label: "Avg daily subscribed users: % Difference vs 4 Weeks Ago"
    description: "Avg daily subscribed users, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
                  WHEN ${avg_daily_subscribed_users_4_weeks_ago} = 0 THEN 0
                  ELSE ${avg_daily_subscribed_users_difference_current_vs_4_weeks_ago}/${avg_daily_subscribed_users_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: avg_daily_subscribed_users_52_weeks_ago {
    type: sum
    group_label: "subscribed Users"
    label: "Avg daily subscribed users 52 weeks ago"
    description: "Avg daily subscribed users - unique number of subscribed users - same day 52 weeks ago"
    sql: ${nonsubscribed_users_52_week_ago};;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
  }

  # Comparative metrics

  measure: avg_daily_subscribed_users_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "subscribed Users"
    label: "Avg daily subscribed users: Difference vs 52 Weeks Ago"
    description: "Avg daily subscribed users difference (Current vs 52 Weeks Ago)"
    sql: ${avg_daily_subscribed_users}-${avg_daily_subscribed_users_52_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: avg_daily_subscribed_users_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "subscribed Users"
    label: "Avg daily subscribed users: % Difference vs 52 Weeks Ago"
    description: "Avg daily subscribed users, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${avg_daily_subscribed_users_52_weeks_ago} = 0 THEN 0
                  ELSE ${avg_daily_subscribed_users_difference_current_vs_52_weeks_ago}/${avg_daily_subscribed_users_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }


# Dynamic Comparisons

  measure: avg_daily_subscribed_users_comparison_period {
    group_label: "subscribed Users"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} subscribed Users 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} subscribed Users 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} subscribed Users 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} subscribed Users 52 weeks ago
    {% else %} subscribed Users in Comparison Period
    {% endif %}"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${avg_daily_subscribed_users_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${avg_daily_subscribed_users_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${avg_daily_subscribed_users_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${avg_daily_subscribed_users_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: avg_daily_subscribed_users_difference_vs_comparison_period {
    group_label: "subscribed Users"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} subscribed Users: Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} subscribed Users: Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} subscribed Users: Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} subscribed Users: Difference vs 52 weeks ago
    {% else %} subscribed Users: Difference vs Comparison Period
    {% endif %}"
    description: "subscribed Users difference (Current vs chosen prior period)"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${avg_daily_subscribed_users_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${avg_daily_subscribed_users_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${avg_daily_subscribed_users_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${avg_daily_subscribed_users_difference_current_vs_52_weeks_ago}
      {% else %} NULL
      {% endif %} ;;
  }

  measure: avg_daily_subscribed_users_pct_change_vs_comparison_period {
    group_label: "subscribed Users"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} subscribed Users: % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} subscribed Users: % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} subscribed Users: % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} subscribed Users: % Difference vs 52 weeks ago
    {% else %} subscribed Users: % Difference vs Comparison Period
    {% endif %}"
    description: "subscribed Users, percentage difference (Current vs chosen prior period)"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${avg_daily_subscribed_users_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${avg_daily_subscribed_users_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${avg_daily_subscribed_users_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${avg_daily_subscribed_users_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }

# NEW UNIQUE PAGEVIEWS

  measure: total_unique_pageviews {
    group_label: "Unique Pageviews"
    label: "Total Unique Pageviews"
    description: "Total unique pageviews."
    type: sum
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
    sql: ${unique_pageviews} ;;
  }


  measure: total_unique_pageviews_1_week_ago {
    type: sum
    group_label: "Unique Pageviews"
    label: "Total Unique Pageviews 1 week ago"
    description: "Total Unique Pageviews - unique number ofPageviews - same day 7 days ago"
    sql: ${unique_pageviews_1_week_ago};;
    value_format: "#,###"
  }

# Comparative metrics

  measure: total_unique_pageviews_difference_current_vs_1_week_ago {
    type:  number
    group_label: "Unique Pageviews"
    label: "Total Unique Pageviews: Difference vs 1 week Ago"
    description: "Total Unique Pageviews difference  (Current vs 1 week Ago)"
    sql: ${total_unique_pageviews}-${total_unique_pageviews_1_week_ago} ;;
    value_format: "#,###"
  }

  measure: total_unique_pageviews_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "Unique Pageviews"
    label: "Total Unique Pageviews: % Difference vs 1 week Ago"
    description: "Total Unique Pageviews, percentage difference (Current vs 1 week Ago)"
    sql:  CASE
                  WHEN ${total_unique_pageviews_1_week_ago} = 0 THEN 0
                  ELSE ${total_unique_pageviews_difference_current_vs_1_week_ago}/${total_unique_pageviews_1_week_ago}
                END;;
    value_format_name: percent_1
  }


  measure: total_unique_pageviews_2_weeks_ago {
    type: sum
    group_label: "Unique Pageviews"
    label: "Total Unique Pageviews users 2 weeks ago"
    description: "Total Unique Pageviews  - unique number of Pageviews - same day 14 days ago"
    sql: ${unique_pageviews_2_week_ago};;
    value_format: "#,###"
  }

  # Comparative metrics

  measure: total_unique_pageviews_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "Unique Pageviews"
    label: "Total Unique Pageviews: Difference vs 2 Weeks Ago"
    description: "Total Unique Pageviews difference  (Current vs 2 Weeks Ago)"
    sql: ${total_unique_pageviews}-${total_unique_pageviews_2_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_unique_pageviews_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "Unique Pageviews"
    label: "Total Unique Pageviews: % Difference vs 2 Weeks Ago"
    description: "Total Unique Pageviews, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_unique_pageviews_2_weeks_ago} = 0 THEN 0
                  ELSE ${total_unique_pageviews_difference_current_vs_2_weeks_ago}/${total_unique_pageviews_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }



  measure: total_unique_pageviews_4_weeks_ago {
    type: sum
    group_label: "Unique Pageviews"
    label: "Total Unique Pageviews 4 weeks ago"
    description: "Total Unique Pageviews- unique number of Pageviews - same day 28 days ago"
    sql: ${unique_pageviews_4_week_ago};;
    value_format: "#,###"
  }

  # Comparative metrics

  measure: total_unique_pageviews_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "Unique Pageviews"
    label: "Total Unique Pageviews: Difference vs 4 Weeks Ago"
    description: "Total Unique Pageviews difference  (Current vs 4 Weeks Ago)"
    sql: ${total_unique_pageviews}-${total_unique_pageviews_4_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_unique_pageviews_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "Unique Pageviews"
    label: "Total Unique Pageviews: % Difference vs 4 Weeks Ago"
    description: "Total Unique Pageviews, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_unique_pageviews_4_weeks_ago} = 0 THEN 0
                  ELSE ${total_unique_pageviews_difference_current_vs_4_weeks_ago}/${total_unique_pageviews_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_unique_pageviews_52_weeks_ago {
    type: sum
    group_label: "Unique Pageviews"
    label: "Total Unique Pageviews 52 weeks ago"
    description: "Total Unique Pageviews - unique number Pageviews - same day 52 weeks ago"
    sql: ${unique_pageviews_52_week_ago};;
    value_format: "#,###"
  }

  # Comparative metrics

  measure: total_unique_pageviews_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "Unique Pageviews"
    label: "Total Unique Pageviews: Difference vs 52 Weeks Ago"
    description: "Total Unique Pageviews difference (Current vs 52 Weeks Ago)"
    sql: ${total_unique_pageviews}-${total_unique_pageviews_52_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_unique_pageviews_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "Unique Pageviews"
    label: "Total Unique Pageviews: % Difference vs 52 Weeks Ago"
    description: "Total Unique Pageviews, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_unique_pageviews_52_weeks_ago} = 0 THEN 0
                  ELSE ${total_unique_pageviews_difference_current_vs_52_weeks_ago}/${total_unique_pageviews_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }


# Dynamic Comparisons

  measure: total_unique_pageviews_comparison_period {
    group_label: "Unique Pageviews"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Unique Pageviews 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Unique Pageviews 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Unique Pageviews 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Unique Pageviews 52 weeks ago
    {% else %} Unique Pageviews in Comparison Period
    {% endif %}"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_unique_pageviews_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_unique_pageviews_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_unique_pageviews_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_unique_pageviews_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_unique_pageviews_difference_vs_comparison_period {
    group_label: "Unique Pageviews"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Unique Pageviews: Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Unique Pageviews: Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Unique Pageviews: Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Unique Pageviews: Difference vs 52 weeks ago
    {% else %} Unique Pageviews: Difference vs Comparison Period
    {% endif %}"
    description: "Unique Pageviews difference (Current vs chosen prior period)"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_unique_pageviews_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_unique_pageviews_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_unique_pageviews_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_unique_pageviews_difference_current_vs_52_weeks_ago}
      {% else %} NULL
      {% endif %} ;;
  }

  measure: total_unique_pageviews_pct_change_vs_comparison_period {
    group_label: "Unique Pageviews"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Unique Pageviews: % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Unique Pageviews: % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Unique Pageviews: % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Unique Pageviews: % Difference vs 52 weeks ago
    {% else %} Unique Pageviews: % Difference vs Comparison Period
    {% endif %}"
    description: "Unique Pageviews, percentage difference (Current vs chosen prior period)"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_unique_pageviews_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_unique_pageviews_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_unique_pageviews_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_unique_pageviews_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }


# NEW PAGE VIEW

  measure: total_pageviews {
    group_label: "Pageviews"
    label: "Total Pageviews"
    description: "Total pageviews."
    type: sum
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
    sql: ${pageviews} ;;
  }


  measure: total_pageviews_1_week_ago {
    type: sum
    group_label: "Pageviews"
    label: "Total Pageviews 1 week ago"
    description: "Total Pageviews - number of Pageviews - same day 7 days ago"
    sql: ${pageviews_1_week_ago};;
    value_format: "#,###"
  }

# Comparative metrics

  measure: total_pageviews_difference_current_vs_1_week_ago {
    type:  number
    group_label: "Pageviews"
    label: "Total Pageviews: Difference vs 1 week Ago"
    description: "Total Pageviews difference  (Current vs 1 week Ago)"
    sql: ${total_pageviews}-${total_pageviews_1_week_ago} ;;
    value_format: "#,###"
  }

  measure: total_pageviews_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "Pageviews"
    label: "Total Pageviews: % Difference vs 1 week Ago"
    description: "Total Pageviews, percentage difference (Current vs 1 week Ago)"
    sql:  CASE
                  WHEN ${total_pageviews_1_week_ago} = 0 THEN 0
                  ELSE ${total_pageviews_difference_current_vs_1_week_ago}/${total_pageviews_1_week_ago}
                END;;
    value_format_name: percent_1
  }


  measure: total_pageviews_2_weeks_ago {
    type: sum
    group_label: "Unique Pageviews"
    label: "Total Unique Pageviews users 2 weeks ago"
    description: "Total Unique Pageviews  - unique number of Pageviews - same day 14 days ago"
    sql: ${pageviews_2_week_ago};;
    value_format: "#,###"
  }

  # Comparative metrics

  measure: total_pageviews_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "Pageviews"
    label: "Total Pageviews: Difference vs 2 Weeks Ago"
    description: "Total Pageviews difference  (Current vs 2 Weeks Ago)"
    sql: ${total_pageviews}-${total_pageviews_2_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_pageviews_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "Pageviews"
    label: "Total Pageviews: % Difference vs 2 Weeks Ago"
    description: "Total Pageviews, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_pageviews_2_weeks_ago} = 0 THEN 0
                  ELSE ${total_pageviews_difference_current_vs_2_weeks_ago}/${total_pageviews_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }



  measure: total_pageviews_4_weeks_ago {
    type: sum
    group_label: "Pageviews"
    label: "Total Pageviews 4 weeks ago"
    description: "Total Pageviews- number of Pageviews - same day 28 days ago"
    sql: ${pageviews_4_week_ago};;
    value_format: "#,###"
  }

  # Comparative metrics

  measure: total_pageviews_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "Pageviews"
    label: "Total Pageviews: Difference vs 4 Weeks Ago"
    description: "Total Pageviews difference  (Current vs 4 Weeks Ago)"
    sql: ${total_pageviews}-${total_pageviews_4_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_pageviews_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "Pageviews"
    label: "Total Pageviews: % Difference vs 4 Weeks Ago"
    description: "Total Pageviews, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_pageviews_4_weeks_ago} = 0 THEN 0
                  ELSE ${total_pageviews_difference_current_vs_4_weeks_ago}/${total_pageviews_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_pageviews_52_weeks_ago {
    type: sum
    group_label: "Pageviews"
    label: "Total Pageviews 52 weeks ago"
    description: "Total Pageviews - number of Pageviews - same day 52 weeks ago"
    sql: ${pageviews_52_week_ago};;
    value_format: "#,###"
  }

  # Comparative metrics

  measure: total_pageviews_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "Pageviews"
    label: "Total Pageviews: Difference vs 52 Weeks Ago"
    description: "Total Pageviews difference (Current vs 52 Weeks Ago)"
    sql: ${total_pageviews}-${total_pageviews_52_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_pageviews_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "Pageviews"
    label: "Total Pageviews: % Difference vs 52 Weeks Ago"
    description: "Total Pageviews, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_pageviews_52_weeks_ago} = 0 THEN 0
                  ELSE ${total_pageviews_difference_current_vs_52_weeks_ago}/${total_pageviews_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }


# Dynamic Comparisons

  measure: total_pageviews_comparison_period {
    group_label: "Pageviews"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Pageviews 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Pageviews 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Pageviews 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Pageviews 52 weeks ago
    {% else %} Pageviews in Comparison Period
    {% endif %}"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_pageviews_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_pageviews_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_pageviews_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_pageviews_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_pageviews_difference_vs_comparison_period {
    group_label: "Pageviews"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Pageviews: Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Pageviews: Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Pageviews: Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Pageviews: Difference vs 52 weeks ago
    {% else %} Pageviews: Difference vs Comparison Period
    {% endif %}"
    description: "Pageviews difference (Current vs chosen prior period)"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_pageviews_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_pageviews_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_pageviews_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_pageviews_difference_current_vs_52_weeks_ago}
      {% else %} NULL
      {% endif %} ;;
  }

  measure: total_pageviews_pct_change_vs_comparison_period {
    group_label: "Pageviews"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Pageviews: % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Pageviews: % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Pageviews: % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Pageviews: % Difference vs 52 weeks ago
    {% else %} Pageviews: % Difference vs Comparison Period
    {% endif %}"
    description: "Pageviews, percentage difference (Current vs chosen prior period)"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_pageviews_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_pageviews_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_pageviews_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_pageviews_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }

# new affiliate clicks


  measure: total_affiliate_clicks {
    group_label: "Affiliate Clicks"
    label: "Total Affiliate Clicks"
    description: "Total Affiliate Clicks."
    type: sum
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
    sql: ${affiliate_clicks} ;;
  }

  measure: total_affiliate_clicks_1_week_ago {
    group_label: "Affiliate Clicks"
    label: "Total Affiliate Clicks 1 week ago"
    description: "Total Affiliate Clicks, 7 days ago."
    type: sum
    value_format_name: decimal_0
    sql: ${affiliate_clicks_1_week_ago} ;;
  }


# Comparative metrics

  measure: total_affiliate_clicks_difference_current_vs_1_week_ago {
    type:  number
    group_label: "Affiliate Clicks"
    label: "Total Affiliate Clicks: Difference vs 1 week Ago"
    description: "Total Affiliate Clicks difference  (Current vs 1 week Ago)"
    sql: ${total_affiliate_clicks}-${total_affiliate_clicks_1_week_ago} ;;
    value_format: "#,###"
  }

  measure: total_affiliate_clicks_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "Affiliate Clicks"
    label: "Total Affiliate Clicks: % Difference vs 1 week Ago"
    description: "Total Affiliate Clicks, percentage difference (Current vs 1 week Ago)"
    sql:  CASE
                  WHEN ${total_affiliate_clicks_1_week_ago} = 0 THEN 0
                  ELSE ${total_affiliate_clicks_difference_current_vs_1_week_ago}/${total_affiliate_clicks_1_week_ago}
                END;;
    value_format_name: percent_1
  }


  measure: total_affiliate_clicks_2_weeks_ago {
    type: sum
    group_label: "Affiliate Clicks"
    label: "Total Affiliate Clicks 2 weeks ago"
    description: "Total Affiliate Clicks  - unique number of Affiliate Clicks - same day 14 days ago"
    sql: ${affiliate_clicks_2_week_ago};;
    value_format: "#,###"
  }

  # Comparative metrics

  measure: total_affiliate_clicks_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "Affiliate Clicks"
    label: "Total Affiliate Clicks: Difference vs 2 Weeks Ago"
    description: "Total Affiliate Clicks difference  (Current vs 2 Weeks Ago)"
    sql: ${total_affiliate_clicks}-${total_affiliate_clicks_2_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_affiliate_clicks_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "Affiliate Clicks"
    label: "Total Affiliate Clicks: % Difference vs 2 Weeks Ago"
    description: "Total Affiliate Clicks, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_affiliate_clicks_2_weeks_ago} = 0 THEN 0
                  ELSE ${total_affiliate_clicks_difference_current_vs_2_weeks_ago}/${total_affiliate_clicks_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }



  measure: total_affiliate_clicks_4_weeks_ago {
    type: sum
    group_label: "Affiliate Clicks"
    label: "Total Affiliate Clicks 4 weeks ago"
    description: "Total Affiliate Clicks- unique number of Affiliate Clicks - same day 28 days ago"
    sql: ${affiliate_clicks_4_week_ago};;
    value_format: "#,###"
  }

  # Comparative metrics

  measure: total_affiliate_clicks_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "Affiliate Clicks"
    label: "Total Affiliate Clicks: Difference vs 4 Weeks Ago"
    description: "Total Affiliate Clicks difference  (Current vs 4 Weeks Ago)"
    sql: ${total_affiliate_clicks}-${total_affiliate_clicks_4_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_affiliate_clicks_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "Affiliate Clicks"
    label: "Total Affiliate Clicks: % Difference vs 4 Weeks Ago"
    description: "Total Affiliate Clicks, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_affiliate_clicks_4_weeks_ago} = 0 THEN 0
                  ELSE ${total_affiliate_clicks_difference_current_vs_4_weeks_ago}/${total_unique_pageviews_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_affiliate_clicks_52_weeks_ago {
    type: sum
    group_label: "Affiliate Clicks"
    label: "Total Affiliate Clicks 52 weeks ago"
    description: "Total Affiliate Clicks - unique number Affiliate Clicks - same day 52 weeks ago"
    sql: ${affiliate_clicks_52_week_ago};;
    value_format: "#,###"
  }

  # Comparative metrics

  measure: total_affiliate_clicks_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "Affiliate Clicks"
    label: "Total Affiliate Clicks: Difference vs 52 Weeks Ago"
    description: "Total Affiliate Clicks difference (Current vs 52 Weeks Ago)"
    sql: ${total_affiliate_clicks}-${total_affiliate_clicks_52_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_affiliate_clicks_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "Affiliate Clicks"
    label: "Total Affiliate Clicks: % Difference vs 52 Weeks Ago"
    description: "Total Affiliate Clicks, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_affiliate_clicks_52_weeks_ago} = 0 THEN 0
                  ELSE ${total_affiliate_clicks_difference_current_vs_52_weeks_ago}/${total_affiliate_clicks_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }


# Dynamic Comparisons

  measure: total_affiliate_clicks_comparison_period {
    group_label: "Affiliate Clicks"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Affiliate Clicks 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Affiliate Clicks 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Affiliate Clicks 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Affiliate Clicks 52 weeks ago
    {% else %} Affiliate Clicks in Comparison Period
    {% endif %}"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_affiliate_clicks_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_affiliate_clicks_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_affiliate_clicks_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_affiliate_clicks_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_affiliate_clicks_difference_vs_comparison_period {
    group_label: "Affiliate Clicks"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Affiliate Clicks: Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Affiliate Clicks: Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Affiliate Clicks: Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Affiliate Clicks: Difference vs 52 weeks ago
    {% else %} Affiliate Clicks: Difference vs Comparison Period
    {% endif %}"
    description: "Affiliate Clicks difference (Current vs chosen prior period)"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_affiliate_clicks_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_affiliate_clicks_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_affiliate_clicks_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_affiliate_clicks_difference_current_vs_52_weeks_ago}
      {% else %} NULL
      {% endif %} ;;
  }

  measure: total_affiliate_clicks_pct_change_vs_comparison_period {
    group_label: "Affiliate Clicks"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Affiliate Clicks: % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Affiliate Clicks: % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Affiliate Clicks: % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Affiliate Clicks: % Difference vs 52 weeks ago
    {% else %} Affiliate Clicks: % Difference vs Comparison Period
    {% endif %}"
    description: "Affiliate Clicks, percentage difference (Current vs chosen prior period)"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_affiliate_clicks_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_affiliate_clicks_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_affiliate_clicks_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_affiliate_clicks_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }

# new total engaged time

  measure: sum_total_engaged_time {
    group_label: "Total Engaged Time"
    label: "Total Engaged Time"
    description: "Total Engaged Time."
    type: sum
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
    sql: ${total_engaged_time} ;;
  }

  measure: sum_total_engaged_time_1_week_ago {
    group_label: "Total Engaged Time"
    label: "Total Engaged Time 1 week ago"
    description: "Total Engaged Time, 7 days ago."
    type: sum
    value_format_name: decimal_0
    sql: ${total_engaged_time_1_week_ago} ;;
  }

# Comparative metrics

  measure: sum_total_engaged_time_difference_current_vs_1_week_ago {
    type:  number
    group_label: "Total Engaged Time"
    label: "Total Engaged Time: Difference vs 1 week Ago"
    description: "Total Engaged Time difference  (Current vs 1 week Ago)"
    sql: ${sum_total_engaged_time}-${sum_total_engaged_time_1_week_ago} ;;
    value_format: "#,###"
  }

  measure: sum_total_engaged_time_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "Total Engaged Time"
    label: "Total Engaged Time: % Difference vs 1 week Ago"
    description: "Total Engaged Time, percentage difference (Current vs 1 week Ago)"
    sql:  CASE
                  WHEN ${sum_total_engaged_time_1_week_ago} = 0 THEN 0
                  ELSE ${sum_total_engaged_time_difference_current_vs_1_week_ago}/${sum_total_engaged_time_1_week_ago}
                END;;
    value_format_name: percent_1
  }


  measure: sum_total_engaged_time_2_weeks_ago {
    type: sum
    group_label: "Total Engaged Time"
    label: "Total Engaged Time 2 weeks ago"
    description: "Total Engaged Time  - sum of Total Engaged Time - same day 14 days ago"
    sql: ${total_engaged_time_2_week_ago};;
    value_format: "#,###"
  }

  # Comparative metrics

  measure: sum_total_engaged_time_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "Total Engaged Time"
    label: "Total Engaged Time: Difference vs 2 Weeks Ago"
    description: "Total Engaged Time difference  (Current vs 2 Weeks Ago)"
    sql: ${sum_total_engaged_time}-${sum_total_engaged_time_2_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: sum_total_engaged_time_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "Total Engaged Time"
    label: "Total Engaged Time: % Difference vs 2 Weeks Ago"
    description: "Total Engaged Time, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${sum_total_engaged_time_2_weeks_ago} = 0 THEN 0
                  ELSE ${sum_total_engaged_time_difference_current_vs_2_weeks_ago}/${sum_total_engaged_time_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }



  measure: sum_total_engaged_time_4_weeks_ago {
    type: sum
    group_label: "Total Engaged Time"
    label: "Total Engaged Time 4 weeks ago"
    description: "Total Engaged Time- sum of Total Engaged Time - same day 28 days ago"
    sql: ${total_engaged_time_4_week_ago};;
    value_format: "#,###"
  }

  # Comparative metrics

  measure: sum_total_engaged_time_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "Total Engaged Time"
    label: "Total Engaged Time: Difference vs 4 Weeks Ago"
    description: "Total Engaged Time difference  (Current vs 4 Weeks Ago)"
    sql: ${sum_total_engaged_time}-${sum_total_engaged_time_4_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: sum_total_engaged_time_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "Total Engaged Time"
    label: "Total Engaged Time: % Difference vs 4 Weeks Ago"
    description: "Total Engaged Time, percentage difference (Current vs 4 Weeks Ago)"
    sql:  CASE
                  WHEN ${sum_total_engaged_time_4_weeks_ago} = 0 THEN 0
                  ELSE ${sum_total_engaged_time_difference_current_vs_4_weeks_ago}/${sum_total_engaged_time_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: sum_total_engaged_time_52_weeks_ago {
    type: sum
    group_label: "Total Engaged Time"
    label: "Total Engaged Time 52 weeks ago"
    description: "Total Engaged Time - sum of Total Engaged Time - same day 52 weeks ago"
    sql: ${total_engaged_time_52_week_ago};;
    value_format: "#,###"
  }

  # Comparative metrics

  measure: sum_total_engaged_time_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "Total Engaged Time"
    label: "Total Engaged Time: Difference vs 52 Weeks Ago"
    description: "Total Engaged Time difference (Current vs 52 Weeks Ago)"
    sql: ${sum_total_engaged_time}-${sum_total_engaged_time_52_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: sum_total_engaged_time_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "Total Engaged Time"
    label: "Total Engaged Time: % Difference vs 52 Weeks Ago"
    description: "Total Engaged Time, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${sum_total_engaged_time_52_weeks_ago} = 0 THEN 0
                  ELSE ${sum_total_engaged_time_difference_current_vs_52_weeks_ago}/${sum_total_engaged_time_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }


# Dynamic Comparisons

  measure: sum_total_engaged_time_comparison_period {
    group_label: "Total Engaged Time"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Total Engaged Time 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Total Engaged Time 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Total Engaged Time 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Total Engaged Time 52 weeks ago
    {% else %} Total Engaged Time in Comparison Period
    {% endif %}"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${sum_total_engaged_time_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${sum_total_engaged_time_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${sum_total_engaged_time_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${sum_total_engaged_time_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: sum_total_engaged_time_difference_vs_comparison_period {
    group_label: "Total Engaged Time"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Total Engaged Time: Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Total Engaged Time: Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Total Engaged Time: Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Total Engaged Time: Difference vs 52 weeks ago
    {% else %} Total Engaged Time: Difference vs Comparison Period
    {% endif %}"
    description: "Total Engaged Time difference (Current vs chosen prior period)"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${sum_total_engaged_time_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${sum_total_engaged_time_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${sum_total_engaged_time_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${sum_total_engaged_time_difference_current_vs_52_weeks_ago}
      {% else %} NULL
      {% endif %} ;;
  }

  measure: sum_total_engaged_time_pct_change_vs_comparison_period {
    group_label: "Total Engaged Time"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} Total Engaged Time: % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} Total Engaged Time: % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} Total Engaged Time: % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} Total Engaged Time: % Difference vs 52 weeks ago
    {% else %} Total Engaged Time: % Difference vs Comparison Period
    {% endif %}"
    description: "Total Engaged Time, percentage difference (Current vs chosen prior period)"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${sum_total_engaged_time_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${sum_total_engaged_time_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${sum_total_engaged_time_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${sum_total_engaged_time_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }



  # AFFILIATE CTR

  measure: total_affiliate_ctr {
    type: number
    group_label: "CTR"
    label: "Affiliate CTR"
    description: "Click through rate on affiliate link, calculated as Total Affiliate Clicks / Total Unique Pageviews"
    value_format_name: percent_1
    sql: SAFE_DIVIDE(${total_affiliate_clicks},${total_unique_pageviews}) ;;
  }


  measure: total_affiliate_ctr_1_week_ago {
    group_label: "CTR"
    label: "Affiliate CTR 1 week ago"
    description: "Click through rate on affiliate link, calculated as Total Affiliate Clicks / Total Unique Pageviews 7 days ago."
    type: number
    value_format_name: percent_1
    sql: SAFE_DIVIDE(${total_affiliate_clicks_1_week_ago},${total_unique_pageviews_1_week_ago})  ;;
  }

  measure: total_affiliate_ctr_difference_current_vs_1_week_ago {
    type:  number
    group_label: "CTR"
    label: "Affiliate CTR : Difference vs 1 Week Ago"
    description: "Affiliate CTR, difference (Current vs 1 Week Ago)"
    sql: ${total_affiliate_ctr}-${total_affiliate_ctr_1_week_ago} ;;
    value_format: "#,###"
  }

  measure: total_affiliate_ctr_pct_change_current_vs_1_week_ago {
    group_label: "CTR"
    description: "CTR (current vs 1 week ago)"
    type: number
    value_format_name: percent_1
    sql: CASE
         WHEN ${total_affiliate_ctr_1_week_ago} = 0 THEN NULL
         ELSE ((${total_affiliate_ctr_difference_current_vs_1_week_ago}) / ${total_affiliate_ctr_1_week_ago})
       END ;;
  }

  measure: total_affiliate_ctr_2_weeks_ago {
    group_label: "CTR"
    label: "Affiliate CTR 2 weeks ago"
    description: "Click through rate on affiliate link, calculated as Total Affiliate Clicks / Total Unique Pageviews 14 days ago."
    type: number
    value_format_name: percent_1
    sql: SAFE_DIVIDE(${total_affiliate_clicks_2_weeks_ago},${total_unique_pageviews_2_weeks_ago})  ;;
  }

  measure: total_affiliate_ctr_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "CTR"
    label: "Affiliate CTR : Difference vs 2 Week Ago"
    description: "Affiliate CTR, difference (Current vs 2 Week Ago)"
    sql: ${total_affiliate_ctr}-${total_affiliate_ctr_2_weeks_ago} ;;
    value_format: "#,###"
  }

  measure: total_affiliate_ctr_pct_change_current_vs_2_weeks_ago {
    group_label: "CTR"
    description: "CTR (current vs 2 weeks ago)"
    type: number
    value_format_name: percent_1
    sql: CASE
         WHEN ${total_affiliate_ctr_2_weeks_ago} = 0 THEN NULL
         ELSE ((${total_affiliate_ctr_difference_current_vs_2_weeks_ago}) / ${total_affiliate_ctr_2_weeks_ago})
       END ;;
  }



  measure: total_affiliate_ctr_4_weeks_ago {
    group_label: "CTR"
    label: "Affiliate CTR 4 weeks ago"
    description: "Click through rate on affiliate link, calculated as Total Affiliate Clicks / Total Unique Pageviews 28 days ago."
    type: number
    value_format_name: percent_1
    sql: SAFE_DIVIDE(${total_affiliate_clicks_4_weeks_ago},${total_unique_pageviews_4_weeks_ago})  ;;
  }

  measure: total_affiliate_ctr_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "CTR"
    label: "Affiliate CTR : Difference vs 4 Week Ago"
    description: "Affiliate CTR, difference (Current vs 4 Week Ago)"
    sql: ${total_affiliate_ctr}-${total_affiliate_ctr_4_weeks_ago} ;;
    value_format: "#,###"
  }


  measure: total_affiliate_ctr_pct_change_current_vs_4_weeks_ago {
    group_label: "CTR"
    description: "CTR (current vs 4 weeks ago)"
    type: number
    value_format_name: percent_1
    sql: CASE
         WHEN ${total_affiliate_ctr_4_weeks_ago} = 0 THEN NULL
         ELSE ((${total_affiliate_ctr_difference_current_vs_4_weeks_ago}) / ${total_affiliate_ctr_4_weeks_ago})
       END ;;
  }


  measure: total_affiliate_ctr_52_weeks_ago {
    group_label: "CTR"
    label: "Affiliate CTR 52 weeks ago"
    description: "Click through rate on affiliate link, calculated as Total Affiliate Clicks / Total Unique Pageviews 52 weeks ago."
    type: number
    value_format_name: percent_1
    sql: SAFE_DIVIDE(${total_affiliate_clicks_52_weeks_ago},${total_unique_pageviews_52_weeks_ago})  ;;
  }



  measure: total_affiliate_ctr_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "CTR"
    label: "Affiliate CTR : Difference vs 52 Week Ago"
    description: "Affiliate CTR, difference (Current vs 52 Week Ago)"
    sql: ${total_affiliate_ctr}-${total_affiliate_ctr_52_weeks_ago} ;;
    value_format: "#,###"
  }



  measure: total_affiliate_ctr_pct_change_current_vs_52_weeks_ago {
    group_label: "CTR"
    description: "CTR (current vs 52 weeks ago)"
    type: number
    value_format_name: percent_1
    sql: CASE
         WHEN ${total_affiliate_ctr_52_weeks_ago} = 0 THEN NULL
         ELSE ((${total_affiliate_ctr_difference_current_vs_52_weeks_ago}) / ${total_affiliate_ctr_52_weeks_ago})
       END ;;
  }


  # Dynamic Comparisons

  measure: total_affiliate_ctr_comparison_period {
    group_label: "CTR"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} CTR 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} CTR 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} CTR 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} CTR 52 weeks ago
    {% else %} CTR in Comparison Period
    {% endif %}"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_affiliate_ctr_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_affiliate_ctr_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_affiliate_ctr_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_affiliate_ctr_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_affiliate_ctr_difference_vs_comparison_period {
    group_label: "CTR"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} CTR: Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} CTR: Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} CTR: Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} CTR: Difference vs 52 weeks ago
    {% else %} CTR: Difference vs Comparison Period
    {% endif %}"
    description: "CTR difference (Current vs chosen prior period)"
    value_format: "#,###"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_affiliate_ctr_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_affiliate_ctr_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_affiliate_ctr_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_affiliate_ctr_difference_current_vs_52_weeks_ago}
      {% else %} NULL
      {% endif %} ;;
  }

  measure: total_affiliate_ctr_pct_change_vs_comparison_period {
    group_label: "CTR"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} CTR: % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} CTR: % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} CTR: % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} CTR: % Difference vs 52 weeks ago
    {% else %} CTR: % Difference vs Comparison Period
    {% endif %}"
    description: "CTR, percentage difference (Current vs chosen prior period)"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_affiliate_ctr_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_affiliate_ctr_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_affiliate_ctr_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_affiliate_ctr_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }



# EPM $


  measure: total_epm_usd {
    type:  number
    group_label: "ePM USD"
    label: "eCM USD"
    description: "commerce revenue USD per 1000 UPV's"
    sql: CASE
    WHEN IFNULL(${total_unique_pageviews}, 0) = 0 THEN 0
    WHEN IFNULL(${total_ecommerce_revenue_usd_constant_budget_adj}, 0) = 0 THEN 0
    ELSE (1.00 * ${total_ecommerce_revenue_usd_constant_budget_adj} / (${total_unique_pageviews} / 1000))
    END ;;


    value_format_name: usd
  }

  measure: total_epm_usd_1_week_ago {
    type:  number
    group_label: "ePM USD"
    label: "ePM USD 1 week ago"
    description: "commerce revenue USD per 1000 UPV's, 1 week ago"

    sql: CASE
    WHEN IFNULL(${total_unique_pageviews_1_week_ago}, 0) = 0 THEN 0
    WHEN IFNULL(${total_ecommerce_revenue_usd_constant_budget_adj_1_week_ago}, 0) = 0 THEN 0
    ELSE (1.00 * ${total_ecommerce_revenue_usd_constant_budget_adj_1_week_ago} / (${total_unique_pageviews_1_week_ago} / 1000))
    END ;;

    value_format_name: usd
  }

  measure: total_epm_usd_difference_current_vs_1_week_ago {
    type:  number
    group_label: "ePM USD"
    label: "ePM USD : Difference vs 1 Week Ago"
    description: "Total ePM USD, difference (Current vs 1 Week Ago)"
    sql: ${total_epm_usd}-${total_epm_usd_1_week_ago} ;;
    value_format_name: usd
  }

  measure: total_epm_usd_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "ePM USD"
    label: "ePM USD: % Difference vs 1 Week Ago"
    description: "ePM USD, percentage difference (Current vs 1 Week Ago)"
    sql:  CASE
                  WHEN ${total_epm_usd_1_week_ago} = 0 THEN 0
                  ELSE ${total_epm_usd_difference_current_vs_1_week_ago}/${total_epm_usd_1_week_ago}
                END;;
    value_format_name: percent_1
  }


  measure: total_epm_usd_2_weeks_ago {
    type:  number
    group_label: "ePM USD"
    label: "ePM USD 2 week ago"
    description: "commerce revenue USD per 1000 UPV's, 2 weeks ago"
    sql: CASE
    WHEN IFNULL(${total_unique_pageviews_2_weeks_ago}, 0) = 0 THEN 0
    WHEN IFNULL(${total_ecommerce_revenue_usd_constant_budget_adj_2_weeks_ago}, 0) = 0 THEN 0
    ELSE (1.00 * ${total_ecommerce_revenue_usd_constant_budget_adj_2_weeks_ago} / (${total_unique_pageviews_2_weeks_ago} / 1000))
    END ;;

    value_format_name: usd
  }

  measure: total_epm_usd_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "ePM USD"
    label: "ePM USD : Difference vs 2 Weeks Ago"
    description: "Total ePM USD, difference (Current vs 2 Weeks Ago)"
    sql: ${total_epm_usd}-${total_epm_usd_2_weeks_ago} ;;
    value_format_name: usd
  }

  measure: total_epm_usd_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "ePM USD"
    label: "ePM USD: % Difference vs 2 Weeks Ago"
    description: "ePM USD, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_epm_usd_2_weeks_ago} = 0 THEN 0
                  ELSE ${total_epm_usd_difference_current_vs_2_weeks_ago}/${total_epm_usd_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_epm_usd_4_weeks_ago {
    type:  number
    group_label: "ePM USD"
    label: "ePM USD 4 week ago"
    description: "commerce revenue USD per 1000 UPV's, 4 weeks ago"
    sql: CASE
    WHEN IFNULL(${total_unique_pageviews_4_weeks_ago}, 0) = 0 THEN 0
    WHEN IFNULL(${total_ecommerce_revenue_usd_constant_budget_adj_4_weeks_ago}, 0) = 0 THEN 0
    ELSE (1.00 * ${total_ecommerce_revenue_usd_constant_budget_adj_4_weeks_ago} / (${total_unique_pageviews_4_weeks_ago} / 1000))
    END ;;

    value_format_name: usd
  }

  measure: total_epm_usd_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "ePM USD"
    label: "ePM USD : Difference vs 4 Week Ago"
    description: "Total ePM USD, difference (Current vs 4 Weeks Ago)"
    sql: ${total_epm_usd}-${total_epm_usd_4_weeks_ago} ;;
    value_format_name: usd
  }

  measure: total_epm_usd_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "ePM USD"
    label: "ePM USD: % Difference vs 4 Weeks Ago"
    description: "ePM USD, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_epm_usd_4_weeks_ago} = 0 THEN 0
                  ELSE ${total_epm_usd_difference_current_vs_4_weeks_ago}/${total_epm_usd_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

    measure: total_epm_usd_52_weeks_ago {
      type:  number
      group_label: "ePM USD"
      label: "ePM USD 52 week ago"
      description: "commerce revenue USD per 1000 UPV's, 52 weeks ago"
      sql: CASE
      WHEN IFNULL(${total_unique_pageviews_52_weeks_ago}, 0) = 0 THEN 0
      WHEN IFNULL(${total_ecommerce_revenue_usd_constant_budget_adj_52_weeks_ago}, 0) = 0 THEN 0
      ELSE (1.00 * ${total_ecommerce_revenue_usd_constant_budget_adj_52_weeks_ago} / (${total_unique_pageviews_52_weeks_ago} / 1000))
      END ;;

      value_format_name: usd
    }

    measure: total_epm_usd_difference_current_vs_52_weeks_ago {
      type:  number
      group_label: "ePM USD"
      label: "ePM USD : Difference vs 52 Weeks Ago"
      description: "Total ePM USD, difference (Current vs 52 Weeks Ago)"
      sql: ${total_epm_usd}-${total_epm_usd_52_weeks_ago} ;;
      value_format_name: usd
    }

    measure: total_epm_usd_pct_change_current_vs_52_weeks_ago {
      type:  number
      group_label: "ePM USD"
      label: "ePM USD: % Difference vs 52 Weeks Ago"
      description: "ePM USD, percentage difference (Current vs 52 Weeks Ago)"
      sql:  CASE
                  WHEN ${total_epm_usd_52_weeks_ago} = 0 THEN 0
                  ELSE ${total_epm_usd_difference_current_vs_52_weeks_ago}/${total_epm_usd_52_weeks_ago}
                END;;
      value_format_name: percent_1
    }
  measure: total_epm_usd_comparison_period {
    group_label: "ePM USD"
    description: "SOV USD per 1000 UPV's, in selected comparison period"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} ePM USD 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} ePM USD 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} ePM USD 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} ePM USD 52 weeks ago
    {% else %} ePM USD in Comparison Period
    {% endif %}"
    value_format_name: usd
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_epm_usd_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_epm_usd_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_epm_usd_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_epm_usd_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_epm_usd_difference_vs_comparison_period {
    group_label: "ePM USD"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} ePM USD: Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} ePM USD: Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} ePM USD: Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} ePM USD: Difference vs 52 weeks ago
    {% else %} ePM USD: Difference vs Comparison Period
    {% endif %}"
    description: "ecommerce revenue USD per 1000 UPV's, difference vs selected comparison period"
    value_format_name: usd
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_epm_usd_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_epm_usd_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_epm_usd_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_epm_usd_difference_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_epm_usd_pct_change_vs_comparison_period {
    group_label: "ePM USD"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} ePM USD: % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} ePM USD: % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} ePM USD: % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} ePM USD: % Difference vs 52 weeks ago
    {% else %} ePM USD: % Change vs Comparison Period
    {% endif %}"
    description: "ecommerce revenue USD per 1000 UPV's, % difference vs selected comparison period"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_epm_usd_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_epm_usd_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_epm_usd_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_epm_usd_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }

# EPM £


  measure: total_epm_gbp {
    type:  number
    group_label: "ePM GBP"
    label: "ePM GBP"
    description: "commerce revenue GBP per 1000 UPV's"
    sql: CASE
    WHEN IFNULL(${total_unique_pageviews}, 0) = 0 THEN 0
    WHEN IFNULL(${total_ecommerce_revenue_gbp_constant_budget_adj}, 0) = 0 THEN 0
    ELSE (1.00 * ${total_ecommerce_revenue_gbp_constant_budget_adj} / (${total_unique_pageviews} / 1000))
    END ;;

    value_format_name: gbp
  }

  measure: total_epm_gbp_1_week_ago {
    type:  number
    group_label: "ePM GBP"
    label: "ePM GBP 1 week ago"
    description: "commerce revenue GBP per 1000 UPV's, 1 week ago"
    sql: CASE
    WHEN IFNULL(${total_unique_pageviews_1_week_ago}, 0) = 0 THEN 0
    WHEN IFNULL(${total_ecommerce_revenue_gbp_constant_budget_adj_1_week_ago}, 0) = 0 THEN 0
    ELSE (1.00 * ${total_ecommerce_revenue_gbp_constant_budget_adj_1_week_ago} / (${total_unique_pageviews_1_week_ago} / 1000))
    END ;;

    value_format_name: gbp
  }

  measure: total_epm_gbp_difference_current_vs_1_week_ago {
    type:  number
    group_label: "ePM GBP"
    label: "ePM GBP : Difference vs 1 Week Ago"
    description: "Total ePM GBP, difference (Current vs 1 Week Ago)"
    sql: ${total_epm_gbp}-${total_epm_gbp_1_week_ago} ;;
    value_format_name: gbp
  }

  measure: total_epm_gbp_pct_change_current_vs_1_week_ago {
    type:  number
    group_label: "ePM GBP"
    label: "ePM GBP: % Difference vs 1 Week Ago"
    description: "ePM GBP, percentage difference (Current vs 1 Week Ago)"
    sql:  CASE
                  WHEN ${total_epm_gbp_1_week_ago} = 0 THEN 0
                  ELSE ${total_epm_gbp_difference_current_vs_1_week_ago}/${total_epm_gbp_1_week_ago}
                END;;
    value_format_name: percent_1
  }


  measure: total_epm_gbp_2_weeks_ago {
    type:  number
    group_label: "ePM GBP"
    label: "ePM GBP 2 week ago"
    sql: CASE
    WHEN IFNULL(${total_unique_pageviews_2_weeks_ago}, 0) = 0 THEN 0
    WHEN IFNULL(${total_ecommerce_revenue_gbp_constant_budget_adj_2_weeks_ago}, 0) = 0 THEN 0
    ELSE (1.00 * ${total_ecommerce_revenue_gbp_constant_budget_adj_2_weeks_ago} / (${total_unique_pageviews_2_weeks_ago} / 1000))
    END ;;
    value_format_name: gbp

  }

  measure: total_epm_gbp_difference_current_vs_2_weeks_ago {
    type:  number
    group_label: "ePM GBP"
    label: "ePM GBP : Difference vs 2 Weeks Ago"
    description: "Total ePM GBP, difference (Current vs 2 Weeks Ago)"
    sql: ${total_epm_gbp}-${total_epm_gbp_2_weeks_ago} ;;
    value_format_name: gbp
  }

  measure: total_epm_gbp_pct_change_current_vs_2_weeks_ago {
    type:  number
    group_label: "ePM GBP"
    label: "ePM GBP: % Difference vs 2 Weeks Ago"
    description: "ePM GBP, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_epm_gbp_2_weeks_ago} = 0 THEN 0
                  ELSE ${total_epm_gbp_difference_current_vs_2_weeks_ago}/${total_epm_gbp_2_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_epm_gbp_4_weeks_ago {
    type:  number
    group_label: "ePM GBP"
    label: "ePM GBP 4 week ago"
    description: "commerce revenue GBP per 1000 UPV's, 4 weeks ago"
    sql: CASE
    WHEN IFNULL(${total_unique_pageviews_4_weeks_ago}, 0) = 0 THEN 0
    WHEN IFNULL(${total_ecommerce_revenue_gbp_constant_budget_adj_4_weeks_ago}, 0) = 0 THEN 0
    ELSE (1.00 * ${total_ecommerce_revenue_gbp_constant_budget_adj_4_weeks_ago} / (${total_unique_pageviews_4_weeks_ago} / 1000))
    END ;;
    value_format_name: gbp
  }

  measure: total_epm_gbp_difference_current_vs_4_weeks_ago {
    type:  number
    group_label: "ePM GBP"
    label: "ePM GBP : Difference vs 4 Week Ago"
    description: "Total ePM GBP, difference (Current vs 4 Weeks Ago)"
    sql: ${total_epm_gbp}-${total_epm_gbp_4_weeks_ago} ;;
    value_format_name: gbp
  }

  measure: total_epm_gbp_pct_change_current_vs_4_weeks_ago {
    type:  number
    group_label: "ePM GBP"
    label: "ePM GBP: % Difference vs 4 Weeks Ago"
    description: "ePM GBP, percentage difference (Current vs 2 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_epm_gbp_4_weeks_ago} = 0 THEN 0
                  ELSE ${total_epm_gbp_difference_current_vs_4_weeks_ago}/${total_epm_gbp_4_weeks_ago}
                END;;
    value_format_name: percent_1
  }

  measure: total_epm_gbp_52_weeks_ago {
    type:  number
    group_label: "ePM GBP"
    label: "ePM GBP 52 week ago"
    description: "commerce revenue GBP per 1000 UPV's, 52 weeks ago"
    sql: CASE
    WHEN IFNULL(${total_unique_pageviews_52_weeks_ago}, 0) = 0 THEN 0
    WHEN IFNULL(${total_ecommerce_revenue_gbp_constant_budget_adj_52_weeks_ago}, 0) = 0 THEN 0
    ELSE (1.00 * ${total_ecommerce_revenue_gbp_constant_budget_adj_52_weeks_ago} / (${total_unique_pageviews_52_weeks_ago} / 1000))
    END ;;
    value_format_name: gbp
  }

  measure: total_epm_gbp_difference_current_vs_52_weeks_ago {
    type:  number
    group_label: "ePM GBP"
    label: "ePM GBP : Difference vs 52 Weeks Ago"
    description: "Total ePM GBP, difference (Current vs 52 Weeks Ago)"
    sql: ${total_epm_gbp}-${total_epm_gbp_52_weeks_ago} ;;
    value_format_name: gbp
  }

  measure: total_epm_gbp_pct_change_current_vs_52_weeks_ago {
    type:  number
    group_label: "ePM GBP"
    label: "ePM GBP: % Difference vs 52 Weeks Ago"
    description: "ePM GBP, percentage difference (Current vs 52 Weeks Ago)"
    sql:  CASE
                  WHEN ${total_epm_gbp_52_weeks_ago} = 0 THEN 0
                  ELSE ${total_epm_gbp_difference_current_vs_52_weeks_ago}/${total_epm_gbp_52_weeks_ago}
                END;;
    value_format_name: percent_1
  }
  measure: total_epm_gbp_comparison_period {
    group_label: "ePM GBP"
    description: "ecommerce revenue GBP per 1000 UPV's, in selected comparison period"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} ePM GBP 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} ePM GBP 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} ePM GBP 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} ePM GBP 52 weeks ago
    {% else %} ePM GBP in Comparison Period
    {% endif %}"
    value_format_name: gbp
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_epm_gbp_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_epm_gbp_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_epm_gbp_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_epm_gbp_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_epm_gbp_difference_vs_comparison_period {
    group_label: "ePM GBP"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} ePM GBP Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} ePM GBP Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} ePM GBP Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} ePM GBP Difference vs 52 weeks ago
    {% else %} ePM GBP Difference vs Comparison Period
    {% endif %}"
    description: "ecommerce revenue GBP per 1000 UPV's, difference vs selected comparison period"
    value_format_name: gbp
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_epm_gbp_difference_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_epm_gbp_difference_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_epm_gbp_difference_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_epm_gbp_difference_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
  }

  measure: total_epm_gbp_pct_change_vs_comparison_period {
    group_label: "ePM GBP"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} ePM GBP % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} ePM GBP % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} ePM GBP % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} ePM GBP % Difference vs 52 weeks ago
    {% else %} ePM GBP % Change vs Comparison Period
    {% endif %}"
    description: "ecommerce revenue GBP per 1000 UPV's, % difference vs selected comparison period"
    value_format_name: percent_1
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago"%} ${total_epm_gbp_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago"%} ${total_epm_gbp_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago"%} ${total_epm_gbp_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago"%} ${total_epm_gbp_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
  }


  # EPM DYNAMIC SELECTOR

  measure: total_epm {
    group_label: "Dynamic Selectors"
    label:
    "{% if currency_selector._parameter_value == 'usd' %} Total ePM ($)
    {% elsif currency_selector._parameter_value == 'gbp' %} Total ePM (£)
    {% else %} ePM
    {% endif %}"
    type: number
    sql:
      {% if currency_selector._parameter_value == "usd" %} ${total_epm_usd}
      {% elsif currency_selector._parameter_value == "gbp" %} ${total_epm_gbp}
      {%else%} NULL
      {% endif %};;
    html:
      {% if currency_selector._parameter_value == "usd" %} {{ total_epm_usd._rendered_value }}
      {% elsif currency_selector._parameter_value == "gbp" %} {{ total_epm_gbp._rendered_value }}
      {% else %} NULL
      {% endif %} ;;
  }


  measure: total_epm_in_comparison_period {
    group_label: "Dynamic Selectors"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' and currency_selector._parameter_value == 'usd' %} ePM ($) : 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' and currency_selector._parameter_value == 'usd' %} ePM ($) : 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' and currency_selector._parameter_value == 'usd' %} ePM ($) : 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' and currency_selector._parameter_value == 'usd' %} ePM ($) : 52 weeks ago
    {% elsif comparison_period._parameter_value == '7_days_ago' and currency_selector._parameter_value == 'gbp' %} ePM (£) : 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' and currency_selector._parameter_value == 'gbp' %} ePM (£) : 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' and currency_selector._parameter_value == 'gbp' %} ePM (£) : 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' and currency_selector._parameter_value == 'gbp' %} ePM (£) : 52 weeks ago
    {% else %} ePM in Comparison Period
    {% endif %}"
    description: "ePM in selected comparison period"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "usd" %} ${total_epm_usd_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "usd" %} ${total_epm_usd_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "usd" %} ${total_epm_usd_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "usd" %} ${total_epm_usd_52_weeks_ago}
      {% elsif comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_epm_gbp_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_epm_gbp_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_epm_gbp_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "gbp" %} ${total_epm_gbp_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html:
          {% if comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "usd" %} {{total_epm_usd_1_week_ago._rendered_value }}
          {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "usd" %} {{total_epm_usd_2_weeks_ago._rendered_value }}
          {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "usd" %} {{total_epm_usd_4_weeks_ago._rendered_value }}
          {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "usd" %} {{total_epm_usd_52_weeks_ago._rendered_value }}

      {% elsif comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "gbp" %} {{total_epm_gbp_1_week_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "gbp" %} {{total_epm_gbp_2_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "gbp" %} {{total_epm_gbp_4_weeks_ago._rendered_value }}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "gbp" %} {{total_epm_gbp_52_weeks_ago._rendered_value }}
      {% else %} NULL
      {% endif %} ;;
  }

  measure: total_epm_pct_change_vs_comparison_period {
    group_label: "Dynamic Selectors"
    label:
    "{% if comparison_period._parameter_value == '7_days_ago' %} ePM % Difference vs 1 week ago
    {% elsif comparison_period._parameter_value == '14_days_ago' %} ePM % Difference vs 2 weeks ago
    {% elsif comparison_period._parameter_value == '28_days_ago' %} ePM % Difference vs 4 weeks ago
    {% elsif comparison_period._parameter_value == '52_weeks_ago' %} ePM % Difference vs 52 weeks ago
    {% else %} ePM % Difference vs Comparison Period
    {% endif %}"
    description: "ecommerce revenue per 1000 UPV's , % difference vs selected comparison period"
    type: number
    sql:
      {% if comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "usd" %} ${total_epm_usd_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "usd" %} ${total_epm_usd_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "usd" %} ${total_epm_usd_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "usd" %} ${total_epm_usd_pct_change_current_vs_52_weeks_ago}
      {% elsif comparison_period._parameter_value == "7_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_epm_gbp_pct_change_current_vs_1_week_ago}
      {% elsif comparison_period._parameter_value == "14_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_epm_gbp_pct_change_current_vs_2_weeks_ago}
      {% elsif comparison_period._parameter_value == "28_days_ago" and currency_selector._parameter_value == "gbp" %} ${total_epm_gbp_pct_change_current_vs_4_weeks_ago}
      {% elsif comparison_period._parameter_value == "52_weeks_ago" and currency_selector._parameter_value == "gbp" %} ${total_epm_gbp_pct_change_current_vs_52_weeks_ago}
      {%else%} NULL
      {% endif %} ;;
    html: {% if value > 0 %} <font color="#04b25a">{{ rendered_value }}</font>
          {% elsif value == 0 %} <font color="black">{{ rendered_value }}</font>
          {% else %} <font color="#ff1b3d">{{ rendered_value }}</font>
          {% endif %};;
    value_format_name: "percent_1"
  }

  # sr-332819

# Measure Selector
  parameter: measure_selector_1 {
    view_label: "Utility - Dynamic Dims, Measures & Selectors"
    group_label: "Measure Selectors"
    type: unquoted
    default_value: "total_ecom_revenue"
    allowed_value: {
      label: "eCom Revenue"
      value: "total_ecom_revenue"
    }
    allowed_value: {
      label: "Affiliate Clicks"
      value: "total_affiliate_clicks"
    }
    allowed_value: {
      label: "SOV"
      value: "SOV"
    }
    allowed_value: {
      label: "Transactions"
      value: "total_transactions"
    }

  }

  parameter: measure_selector_2 {
    view_label: "Utility - Dynamic Dims, Measures & Selectors"
    group_label: "Measure Selectors"
    type: unquoted
    default_value: "NULL"
    allowed_value: {
      label: "NULL"
      value: "NULL"
    }
    allowed_value: {
      label: "eCom Revenue"
      value: "total_ecom_revenue"
    }
    allowed_value: {
      label: "Affiliate Clicks"
      value: "total_affiliate_clicks"
    }
    allowed_value: {
      label: "SOV"
      value: "SOV"
    }
    allowed_value: {
      label: "Transactions"
      value: "total_transactions"
    }
  }



# #----------------------------------------------------------------------------------------------------------------------------------
# # Dynamic measures

  measure: dynamic_measure1_current {
    view_label: "Utility - Dynamic Dims, Measures & Selectors"
    group_label: "Measure Selectors"
    label_from_parameter: measure_selector_1
    type: number
    sql:
      {% if measure_selector_1._parameter_value == "SOV" %} ${total_ecommerce_sales_order_value_constant_budget_adj}
      {% elsif measure_selector_1._parameter_value == "total_affiliate_clicks" %} ${total_affiliate_clicks}
      {% elsif measure_selector_1._parameter_value == "total_ecom_revenue" %} ${total_ecommerce_revenue_constant_budget_adj}
      {% elsif measure_selector_1._parameter_value == "total_transactions" %} ${total_ecommerce_transactions}
      {%else%} NULL
      {% endif %};;
  }


  measure: dynamic_measure2_current {
    view_label: "Utility - Dynamic Dims, Measures & Selectors"
    group_label: "Measure Selectors"
    label_from_parameter: measure_selector_2
    type: number
    sql:
    {% if measure_selector_2._parameter_value == "SOV" %} ${total_ecommerce_sales_order_value_constant_budget_adj}
    {% elsif measure_selector_2._parameter_value == "total_affiliate_clicks" %} ${total_affiliate_clicks}
    {% elsif measure_selector_2._parameter_value == "total_ecom_revenue" %} ${total_ecommerce_revenue_constant_budget_adj}
    {% elsif measure_selector_2._parameter_value == "total_transactions" %} ${total_ecommerce_transactions}
    {%else%} NULL
    {% endif %};;
  }

}
