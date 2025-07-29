view: apple_news_stats_daily {
  sql_table_name: `datamart-internal.audience_core.apple_news_stats_daily` ;;

  dimension: ads_impressions {
    type: number
    description: "Sum off impressions from unified_ads"
    sql: ${TABLE}.ads_impressions ;;
  }
  dimension: ads_impressions_1_week_ago {
    type: number
    description: "Sum off impressions from unified_ads 1 weeks ago."
    sql: ${TABLE}.ads_impressions_1_week_ago ;;
  }
  dimension: ads_impressions_2_week_ago {
    type: number
    description: "Sum off impressions from unified_ads 2 weeks ago."
    sql: ${TABLE}.ads_impressions_2_week_ago ;;
  }
  dimension: ads_impressions_4_week_ago {
    type: number
    description: "Sum off impressions from unified_ads 4 weeks ago."
    sql: ${TABLE}.ads_impressions_4_week_ago ;;
  }
  dimension: ads_impressions_52_week_ago {
    type: number
    description: "Sum off impressions from unified_ads 52 weeks ago."
    sql: ${TABLE}.ads_impressions_52_week_ago ;;
  }
  dimension: ads_revenue_gbp_daily {
    type: number
    description: "Sum of revenue converted into GBP. Using Netsuite exchange rates from unified_ads"
    sql: ${TABLE}.ads_revenue_gbp_daily ;;
  }
  dimension: ads_revenue_gbp_daily_1_week_ago {
    type: number
    description: "Sum of revenue converted into GBP. Using Netsuite exchange rates from unified_ads 1 weeks ago."
    sql: ${TABLE}.ads_revenue_gbp_daily_1_week_ago ;;
  }
  dimension: ads_revenue_gbp_daily_2_week_ago {
    type: number
    description: "Sum of revenue converted into GBP. Using Netsuite exchange rates from unified_ads 2 weeks ago."
    sql: ${TABLE}.ads_revenue_gbp_daily_2_week_ago ;;
  }
  dimension: ads_revenue_gbp_daily_4_week_ago {
    type: number
    description: "Sum of revenue converted into GBP. Using Netsuite exchange rates from unified_ads 4 weeks ago."
    sql: ${TABLE}.ads_revenue_gbp_daily_4_week_ago ;;
  }
  dimension: ads_revenue_gbp_daily_52_week_ago {
    type: number
    description: "Sum of revenue converted into GBP. Using Netsuite exchange rates from unified_ads 52 weeks ago."
    sql: ${TABLE}.ads_revenue_gbp_daily_52_week_ago ;;
  }
  dimension: ads_revenue_gbp_monthly {
    type: number
    description: "Same as above using exchange rate of the last day of the month from unified_ads"
    sql: ${TABLE}.ads_revenue_gbp_monthly ;;
  }
  dimension: ads_revenue_gbp_monthly_1_week_ago {
    type: number
    description: "Same as above using exchange rate of the last day of the month from unified_ads 1 weeks ago."
    sql: ${TABLE}.ads_revenue_gbp_monthly_1_week_ago ;;
  }
  dimension: ads_revenue_gbp_monthly_2_week_ago {
    type: number
    description: "Same as above using exchange rate of the last day of the month from unified_ads 2 weeks ago."
    sql: ${TABLE}.ads_revenue_gbp_monthly_2_week_ago ;;
  }
  dimension: ads_revenue_gbp_monthly_4_week_ago {
    type: number
    description: "Same as above using exchange rate of the last day of the month from unified_ads 4 weeks ago."
    sql: ${TABLE}.ads_revenue_gbp_monthly_4_week_ago ;;
  }
  dimension: ads_revenue_gbp_monthly_52_week_ago {
    type: number
    description: "Same as above using exchange rate of the last day of the month from unified_ads 52 weeks ago."
    sql: ${TABLE}.ads_revenue_gbp_monthly_52_week_ago ;;
  }
  dimension: ads_revenue_usd_daily {
    type: number
    description: "Sum of revenue from unified_ads"
    sql: ${TABLE}.ads_revenue_usd_daily ;;
  }
  dimension: ads_revenue_usd_daily_1_week_ago {
    type: number
    description: "Sum of revenue from unified_ads 1 weeks ago."
    sql: ${TABLE}.ads_revenue_usd_daily_1_week_ago ;;
  }
  dimension: ads_revenue_usd_daily_2_week_ago {
    type: number
    description: "Sum of revenue from unified_ads 2 weeks ago."
    sql: ${TABLE}.ads_revenue_usd_daily_2_week_ago ;;
  }
  dimension: ads_revenue_usd_daily_4_week_ago {
    type: number
    description: "Sum of revenue from unified_ads 4 weeks ago."
    sql: ${TABLE}.ads_revenue_usd_daily_4_week_ago ;;
  }
  dimension: ads_revenue_usd_daily_52_week_ago {
    type: number
    description: "Sum of revenue from unified_ads 52 weeks ago."
    sql: ${TABLE}.ads_revenue_usd_daily_52_week_ago ;;
  }
  dimension: affiliate_clicks {
    type: number
    description: "total number of clicks to affiliates, calculated as a count of 'ShoppingLinkTapEvents'."
    sql: ${TABLE}.affiliate_clicks ;;
  }
  dimension: affiliate_clicks_1_week_ago {
    type: number
    description: "total number of clicks to affiliates, calculated as a count of 'ShoppingLinkTapEvents', same day 1 weeks ago."
    sql: ${TABLE}.affiliate_clicks_1_week_ago ;;
  }
  dimension: affiliate_clicks_2_week_ago {
    type: number
    description: "total number of clicks to affiliates, calculated as a count of 'ShoppingLinkTapEvents', same day 2 weeks ago."
    sql: ${TABLE}.affiliate_clicks_2_week_ago ;;
  }
  dimension: affiliate_clicks_4_week_ago {
    type: number
    description: "total number of clicks to affiliates, calculated as a count of 'ShoppingLinkTapEvents', same day 4 weeks ago."
    sql: ${TABLE}.affiliate_clicks_4_week_ago ;;
  }
  dimension: affiliate_clicks_52_week_ago {
    type: number
    description: "total number of clicks to affiliates, calculated as a count of 'ShoppingLinkTapEvents',same day 52 weeks ago."
    sql: ${TABLE}.affiliate_clicks_52_week_ago ;;
  }
  dimension_group: date {
    type: time
    description: "day, format YYYY-MM-DD"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: ecommerce_revenue_gbp_constant_budget_adj {
    type: number
    description: "Affiliate commission converted to GBP based on the constant budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base"
    sql: ${TABLE}.ecommerce_revenue_gbp_constant_budget_adj ;;
  }
  dimension: ecommerce_revenue_gbp_constant_budget_adj_1_week_ago {
    type: number
    description: "Affiliate commission converted to GBP based on the constant budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 1 weeks ago."
    sql: ${TABLE}.ecommerce_revenue_gbp_constant_budget_adj_1_week_ago ;;
  }
  dimension: ecommerce_revenue_gbp_constant_budget_adj_2_week_ago {
    type: number
    description: "Affiliate commission converted to GBP based on the constant budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 2 weeks ago."
    sql: ${TABLE}.ecommerce_revenue_gbp_constant_budget_adj_2_week_ago ;;
  }
  dimension: ecommerce_revenue_gbp_constant_budget_adj_4_week_ago {
    type: number
    description: "Affiliate commission converted to GBP based on the constant budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 4 weeks ago."
    sql: ${TABLE}.ecommerce_revenue_gbp_constant_budget_adj_4_week_ago ;;
  }
  dimension: ecommerce_revenue_gbp_constant_budget_adj_52_week_ago {
    type: number
    description: "Affiliate commission converted to GBP based on the constant budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 52 weeks ago."
    sql: ${TABLE}.ecommerce_revenue_gbp_constant_budget_adj_52_week_ago ;;
  }
  dimension: ecommerce_revenue_usd_constant_budget_adj {
    type: number
    description: "Affiliate commission converted to USD based on the changing budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base"
    sql: ${TABLE}.ecommerce_revenue_usd_constant_budget_adj ;;
  }
  dimension: ecommerce_revenue_usd_constant_budget_adj_1_week_ago {
    type: number
    description: "Affiliate commission converted to USD based on the changing budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 1 weeks ago."
    sql: ${TABLE}.ecommerce_revenue_usd_constant_budget_adj_1_week_ago ;;
  }
  dimension: ecommerce_revenue_usd_constant_budget_adj_2_week_ago {
    type: number
    description: "Affiliate commission converted to USD based on the changing budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 2 weeks ago."
    sql: ${TABLE}.ecommerce_revenue_usd_constant_budget_adj_2_week_ago ;;
  }
  dimension: ecommerce_revenue_usd_constant_budget_adj_4_week_ago {
    type: number
    description: "Affiliate commission converted to USD based on the changing budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 4 weeks ago."
    sql: ${TABLE}.ecommerce_revenue_usd_constant_budget_adj_4_week_ago ;;
  }
  dimension: ecommerce_revenue_usd_constant_budget_adj_52_week_ago {
    type: number
    description: "Affiliate commission converted to USD based on the changing budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 52 weeks ago."
    sql: ${TABLE}.ecommerce_revenue_usd_constant_budget_adj_52_week_ago ;;
  }
  dimension: ecommerce_sales_order_value_gbp_constant_budget_adj {
    type: number
    description: "Sales order value converted to GBP based on the constant budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base"
    sql: ${TABLE}.ecommerce_sales_order_value_gbp_constant_budget_adj ;;
  }
  dimension: ecommerce_sales_order_value_gbp_constant_budget_adj_1_week_ago {
    type: number
    description: "Sales order value converted to GBP based on the constant budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 1 weeks ago."
    sql: ${TABLE}.ecommerce_sales_order_value_gbp_constant_budget_adj_1_week_ago ;;
  }
  dimension: ecommerce_sales_order_value_gbp_constant_budget_adj_2_week_ago {
    type: number
    description: "Sales order value converted to GBP based on the constant budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 2 weeks ago."
    sql: ${TABLE}.ecommerce_sales_order_value_gbp_constant_budget_adj_2_week_ago ;;
  }
  dimension: ecommerce_sales_order_value_gbp_constant_budget_adj_4_week_ago {
    type: number
    description: "Sales order value converted to GBP based on the constant budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 4 weeks ago."
    sql: ${TABLE}.ecommerce_sales_order_value_gbp_constant_budget_adj_4_week_ago ;;
  }
  dimension: ecommerce_sales_order_value_gbp_constant_budget_adj_52_week_ago {
    type: number
    description: "Sales order value converted to GBP based on the constant budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 52 weeks ago."
    sql: ${TABLE}.ecommerce_sales_order_value_gbp_constant_budget_adj_52_week_ago ;;
  }
  dimension: ecommerce_sales_order_value_usd_constant_budget_adj {
    type: number
    description: "Sales order value converted to USD based on the constant budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base"
    sql: ${TABLE}.ecommerce_sales_order_value_usd_constant_budget_adj ;;
  }
  dimension: ecommerce_sales_order_value_usd_constant_budget_adj_1_week_ago {
    type: number
    description: "Sales order value converted to USD based on the constant budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 1 weeks ago."
    sql: ${TABLE}.ecommerce_sales_order_value_usd_constant_budget_adj_1_week_ago ;;
  }
  dimension: ecommerce_sales_order_value_usd_constant_budget_adj_2_week_ago {
    type: number
    description: "Sales order value converted to USD based on the constant budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 2 weeks ago."
    sql: ${TABLE}.ecommerce_sales_order_value_usd_constant_budget_adj_2_week_ago ;;
  }
  dimension: ecommerce_sales_order_value_usd_constant_budget_adj_4_week_ago {
    type: number
    description: "Sales order value converted to USD based on the constant budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 4 weeks ago."
    sql: ${TABLE}.ecommerce_sales_order_value_usd_constant_budget_adj_4_week_ago ;;
  }
  dimension: ecommerce_sales_order_value_usd_constant_budget_adj_52_week_ago {
    type: number
    description: "Sales order value converted to USD based on the constant budget exchange rate, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base same day 52 weeks ago."
    sql: ${TABLE}.ecommerce_sales_order_value_usd_constant_budget_adj_52_week_ago ;;
  }
  dimension: ecommerce_transactions_adj {
    type: number
    description: "Site level count of the number of transactions, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base"
    sql: ${TABLE}.ecommerce_transactions_adj ;;
  }
  dimension: ecommerce_transactions_adj_1_week_ago {
    type: number
    description: "Site level count of the number of transactions, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base"
    sql: ${TABLE}.ecommerce_transactions_adj_1_week_ago ;;
  }
  dimension: ecommerce_transactions_adj_2_week_ago {
    type: number
    description: "Site level count of the number of transactions, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base  same day 2 weeks ago."
    sql: ${TABLE}.ecommerce_transactions_adj_2_week_ago ;;
  }
  dimension: ecommerce_transactions_adj_4_week_ago {
    type: number
    description: "Site level count of the number of transactions, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base  same day 4 weeks ago."
    sql: ${TABLE}.ecommerce_transactions_adj_4_week_ago ;;
  }
  dimension: ecommerce_transactions_adj_52_week_ago {
    type: number
    description: "Site level count of the number of transactions, adjusted based on the status of each transaction using safe rates associated with the merchant from ecommerce_revenue_base  same day 52 weeks ago."
    sql: ${TABLE}.ecommerce_transactions_adj_52_week_ago ;;
  }
  dimension: hash_key {
    type: string
    description: "combination of date , brand and sitedomain"
    sql: ${TABLE}.hash_key ;;
  }
  dimension: nonsubscribed_users {
    type: number
    description: "count of distinct userids where subscribertype = 'Non-Subscriber'"
    sql: ${TABLE}.nonsubscribed_users ;;
  }
  dimension: nonsubscribed_users_1_week_ago {
    type: number
    description: "count of distinct userids where subscribertype = 'Non-Subscriber', same day 1 weeks ago."
    sql: ${TABLE}.nonsubscribed_users_1_week_ago ;;
  }
  dimension: nonsubscribed_users_2_week_ago {
    type: number
    description: "count of distinct userids where subscribertype = 'Non-Subscriber', same day 2 weeks ago."
    sql: ${TABLE}.nonsubscribed_users_2_week_ago ;;
  }
  dimension: nonsubscribed_users_4_week_ago {
    type: number
    description: "count of distinct userids where subscribertype = 'Non-Subscriber', same day 4 weeks ago."
    sql: ${TABLE}.nonsubscribed_users_4_week_ago ;;
  }
  dimension: nonsubscribed_users_52_week_ago {
    type: number
    description: "count of distinct userids where subscribertype = 'Non-Subscriber',same day 52 weeks ago."
    sql: ${TABLE}.nonsubscribed_users_52_week_ago ;;
  }
  dimension: pageviews {
    type: number
    description: "added in to test the unique_pageviews"
    sql: ${TABLE}.pageviews ;;
  }
  dimension: pageviews_1_week_ago {
    type: number
    description: "added in to test the unique_pageviews, same day 1 weeks ago."
    sql: ${TABLE}.pageviews_1_week_ago ;;
  }
  dimension: pageviews_2_week_ago {
    type: number
    description: "added in to test the unique_pageviews, same day 2 weeks ago."
    sql: ${TABLE}.pageviews_2_week_ago ;;
  }
  dimension: pageviews_4_week_ago {
    type: number
    description: "added in to test the unique_pageviews, same day 4 weeks ago."
    sql: ${TABLE}.pageviews_4_week_ago ;;
  }
  dimension: pageviews_52_week_ago {
    type: number
    description: "added in to test the unique_pageviews ,same day 52 weeks ago."
    sql: ${TABLE}.pageviews_52_week_ago ;;
  }
  dimension: parent_brand {
    type: string
    description: "joined via the master_brand_brand_map"
    sql: ${TABLE}.parent_brand ;;
  }
  dimension: site_domain {
    type: string
    description: "Clean site without 'www' or '/'"
    sql: ${TABLE}.site_domain ;;
  }
  dimension: subscribed_users {
    type: number
    description: "count of distinct userids where subscribertype = 'Apple News+ Subscriber'"
    sql: ${TABLE}.subscribed_users ;;
  }
  dimension: subscribed_users_1_week_ago {
    type: number
    description: "count of distinct userids where subscribertype = 'Apple News+ Subscriber', same day 1 weeks ago."
    sql: ${TABLE}.subscribed_users_1_week_ago ;;
  }
  dimension: subscribed_users_2_week_ago {
    type: number
    description: "count of distinct userids where subscribertype = 'Apple News+ Subscriber', same day 2 weeks ago."
    sql: ${TABLE}.subscribed_users_2_week_ago ;;
  }
  dimension: subscribed_users_4_week_ago {
    type: number
    description: "count of distinct userids where subscribertype = 'Apple News+ Subscriber', same day 4 weeks ago."
    sql: ${TABLE}.subscribed_users_4_week_ago ;;
  }
  dimension: subscribed_users_52_week_ago {
    type: number
    description: "count of distinct userids where subscribertype = 'Apple News+ Subscriber',same day 52 weeks ago."
    sql: ${TABLE}.subscribed_users_52_week_ago ;;
  }
  dimension: total_engaged_time {
    type: number
    description: "total number of seconds during which the user was engaged with the article"
    sql: ${TABLE}.total_engaged_time ;;
  }
  dimension: total_engaged_time_1_week_ago {
    type: number
    description: "total number of seconds during which the user was engaged with the article, same day 1 weeks ago."
    sql: ${TABLE}.total_engaged_time_1_week_ago ;;
  }
  dimension: total_engaged_time_2_week_ago {
    type: number
    description: "total number of seconds during which the user was engaged with the article, same day 2 weeks ago."
    sql: ${TABLE}.total_engaged_time_2_week_ago ;;
  }
  dimension: total_engaged_time_4_week_ago {
    type: number
    description: "total number of seconds during which the user was engaged with the article, same day 4 weeks ago."
    sql: ${TABLE}.total_engaged_time_4_week_ago ;;
  }
  dimension: total_engaged_time_52_week_ago {
    type: number
    description: "total number of seconds during which the user was engaged with the article, same day 52 weeks ago."
    sql: ${TABLE}.total_engaged_time_52_week_ago ;;
  }
  dimension: unique_pageviews {
    type: number
    description: "count of distinct de-duped viewids where eventtype = ARTICLE_VIEW_EVENT"
    sql: ${TABLE}.unique_pageviews ;;
  }
  dimension: unique_pageviews_1_week_ago {
    type: number
    description: "count of distinct de-duped viewids where eventtype = ARTICLE_VIEW_EVENT, same day 1 weeks ago."
    sql: ${TABLE}.unique_pageviews_1_week_ago ;;
  }
  dimension: unique_pageviews_2_week_ago {
    type: number
    description: "count of distinct de-duped viewids where eventtype = ARTICLE_VIEW_EVENT, same day 2 weeks ago."
    sql: ${TABLE}.unique_pageviews_2_week_ago ;;
  }
  dimension: unique_pageviews_4_week_ago {
    type: number
    description: "count of distinct de-duped viewids where eventtype = ARTICLE_VIEW_EVENT, same day 4 weeks ago."
    sql: ${TABLE}.unique_pageviews_4_week_ago ;;
  }
  dimension: unique_pageviews_52_week_ago {
    type: number
    sql: ${TABLE}.unique_Pageviews_52_week_ago ;;
  }
  dimension: users {
    type: number
    description: "count of distinct userids"
    sql: ${TABLE}.users ;;
  }
  dimension: users_1_week_ago {
    type: number
    description: "count of distinct userids, same day 1 weeks ago."
    sql: ${TABLE}.users_1_week_ago ;;
  }
  dimension: users_2_week_ago {
    type: number
    description: "count of distinct userids, same day 2 weeks ago."
    sql: ${TABLE}.users_2_week_ago ;;
  }
  dimension: users_4_week_ago {
    type: number
    description: "count of distinct userids, same day 4 weeks ago."
    sql: ${TABLE}.users_4_week_ago ;;
  }
  dimension: users_52_week_ago {
    type: number
    description: "count of distinct userids, same day 52 weeks ago."
    sql: ${TABLE}.users_52_week_ago ;;
  }
  measure: count {
    type: count
  }
}
