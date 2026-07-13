from pyspark.sql.functions import sum

# Task 1: Daily Sales Report
daily_sales = sales.groupBy("sale_date") \
    .agg(sum("total_amount").alias("total_sales")) \
    .orderBy("sale_date")

daily_sales.show()


from pyspark.sql.functions import sum

# Task 2: City-wise Revenue
city_revenue = customers.join(
    sales,
    on="customer_id",
    how="inner"
).groupBy(
    "city"
).agg(
    sum("total_amount").alias("total_revenue")
).orderBy(
    "total_revenue",
    ascending=False
)

city_revenue.show()


from pyspark.sql.functions import sum

# Task 3: Top 5 Customers
top5 = customers.join(
    sales,
    on="customer_id",
    how="inner"
).groupBy(
    "customer_name"
).agg(
    sum("total_amount").alias("total_spend")
).orderBy(
    "total_spend",
    ascending=False
).limit(5)

top5.show()


from pyspark.sql.functions import count

# Task 4: Repeat Customers
repeat_customers = sales.groupBy("customer_id") \
    .agg(count("sale_id").alias("order_count")) \
    .filter("order_count > 1") \
    .orderBy("order_count", ascending=False)

repeat_customers.show()


from pyspark.sql.functions import sum, when, col

# Task 5: Customer Segmentation
customer_segment = customers.join(
    sales,
    on="customer_id",
    how="inner"
).groupBy(
    "customer_id",
    "customer_name"
).agg(
    sum("total_amount").alias("total_spend")
).withColumn(
    "segment",
    when(col("total_spend") > 10000, "Gold")
    .when((col("total_spend") >= 5000) & (col("total_spend") <= 10000), "Silver")
    .otherwise("Bronze")
).orderBy(
    "total_spend",
    ascending=False
)

customer_segment.show()


from pyspark.sql.functions import sum, count, when, col

# Task 6: Final Reporting Table
final_df = customers.join(
    sales,
    on="customer_id",
    how="inner"
).groupBy(
    "customer_id",
    "customer_name",
    "city"
).agg(
    sum("total_amount").alias("total_spend"),
    count("sale_id").alias("order_count")
).withColumn(
    "segment",
    when(col("total_spend") > 10000, "Gold")
    .when((col("total_spend") >= 5000) & (col("total_spend") <= 10000), "Silver")
    .otherwise("Bronze")
).select(
    "customer_name",
    "city",
    "total_spend",
    "order_count",
    "segment"
).orderBy(
    "total_spend",
    ascending=False
)

final_df.show()


# Task 7: Save Final Report
final_df.write \
    .mode("overwrite") \
    .saveAsTable("final_report")
