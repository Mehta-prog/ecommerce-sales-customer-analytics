-- MySQL dump 10.13  Distrib 8.0.46, for macos15 (arm64)
--
-- Host: localhost    Database: ecommerce_analytics
-- ------------------------------------------------------
-- Server version	9.7.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'f8409832-7d54-11f1-a1ba-8f9954d83eaf:1-341135';

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` varchar(50) DEFAULT NULL,
  `customer_unique_id` varchar(50) DEFAULT NULL,
  `customer_zip_code_prefix` int DEFAULT NULL,
  `customer_city` varchar(100) DEFAULT NULL,
  `customer_state` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_id` varchar(50) DEFAULT NULL,
  `order_item_id` int DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `seller_id` varchar(50) DEFAULT NULL,
  `shipping_limit_date` datetime DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `freight_value` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(50) DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `order_status` varchar(30) DEFAULT NULL,
  `order_purchase_timestamp` datetime DEFAULT NULL,
  `order_approved_at` datetime DEFAULT NULL,
  `order_delivered_carrier_date` datetime DEFAULT NULL,
  `order_delivered_customer_date` datetime DEFAULT NULL,
  `order_estimated_delivery_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` varchar(50) DEFAULT NULL,
  `product_category_name` varchar(100) DEFAULT NULL,
  `product_name_lenght` int DEFAULT NULL,
  `product_description_lenght` int DEFAULT NULL,
  `product_photos_qty` int DEFAULT NULL,
  `product_weight_g` decimal(10,2) DEFAULT NULL,
  `product_length_cm` decimal(10,2) DEFAULT NULL,
  `product_height_cm` decimal(10,2) DEFAULT NULL,
  `product_width_cm` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vw_category_performance`
--

DROP TABLE IF EXISTS `vw_category_performance`;
/*!50001 DROP VIEW IF EXISTS `vw_category_performance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_category_performance` AS SELECT 
 1 AS `product_category_name`,
 1 AS `total_revenue`,
 1 AS `total_customers`,
 1 AS `one_time_customers`,
 1 AS `repeat_customers`,
 1 AS `repeat_customer_revenue`,
 1 AS `average_customer_value`,
 1 AS `repeat_customer_aov`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_customer_rfm`
--

DROP TABLE IF EXISTS `vw_customer_rfm`;
/*!50001 DROP VIEW IF EXISTS `vw_customer_rfm`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_customer_rfm` AS SELECT 
 1 AS `customer_unique_id`,
 1 AS `recency`,
 1 AS `frequency`,
 1 AS `monetary`,
 1 AS `r_score`,
 1 AS `f_score`,
 1 AS `m_score`,
 1 AS `rfm_score`,
 1 AS `customer_segment`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_delivery_performance`
--

DROP TABLE IF EXISTS `vw_delivery_performance`;
/*!50001 DROP VIEW IF EXISTS `vw_delivery_performance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_delivery_performance` AS SELECT 
 1 AS `customer_state`,
 1 AS `total_delivered_orders`,
 1 AS `late_orders`,
 1 AS `late_delivery_rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_monthly_sales`
--

DROP TABLE IF EXISTS `vw_monthly_sales`;
/*!50001 DROP VIEW IF EXISTS `vw_monthly_sales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_monthly_sales` AS SELECT 
 1 AS `order_year`,
 1 AS `order_month`,
 1 AS `total_orders`,
 1 AS `revenue`,
 1 AS `average_item_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_category_performance`
--

/*!50001 DROP VIEW IF EXISTS `vw_category_performance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_category_performance` AS with `customer_orders` as (select `c`.`customer_unique_id` AS `customer_unique_id`,count(distinct `o`.`order_id`) AS `order_count` from (`customers` `c` join `orders` `o` on((`c`.`customer_id` = `o`.`customer_id`))) where (`o`.`order_status` = 'delivered') group by `c`.`customer_unique_id`), `category_customer` as (select `p`.`product_category_name` AS `product_category_name`,`c`.`customer_unique_id` AS `customer_unique_id`,sum(`oi`.`price`) AS `customer_category_revenue` from (((`customers` `c` join `orders` `o` on((`c`.`customer_id` = `o`.`customer_id`))) join `order_items` `oi` on((`o`.`order_id` = `oi`.`order_id`))) join `products` `p` on((`oi`.`product_id` = `p`.`product_id`))) where (`o`.`order_status` = 'delivered') group by `p`.`product_category_name`,`c`.`customer_unique_id`) select `cc`.`product_category_name` AS `product_category_name`,sum(`cc`.`customer_category_revenue`) AS `total_revenue`,count(distinct `cc`.`customer_unique_id`) AS `total_customers`,count(distinct (case when (`co`.`order_count` = 1) then `cc`.`customer_unique_id` end)) AS `one_time_customers`,count(distinct (case when (`co`.`order_count` > 1) then `cc`.`customer_unique_id` end)) AS `repeat_customers`,sum((case when (`co`.`order_count` > 1) then `cc`.`customer_category_revenue` else 0 end)) AS `repeat_customer_revenue`,round((sum(`cc`.`customer_category_revenue`) / nullif(count(distinct `cc`.`customer_unique_id`),0)),2) AS `average_customer_value`,round((sum((case when (`co`.`order_count` > 1) then `cc`.`customer_category_revenue` else 0 end)) / nullif(count(distinct (case when (`co`.`order_count` > 1) then `cc`.`customer_unique_id` end)),0)),2) AS `repeat_customer_aov` from (`category_customer` `cc` join `customer_orders` `co` on((`cc`.`customer_unique_id` = `co`.`customer_unique_id`))) group by `cc`.`product_category_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_customer_rfm`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer_rfm`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer_rfm` AS with `rfm` as (select `c`.`customer_unique_id` AS `customer_unique_id`,(to_days((select max(`o`.`order_purchase_timestamp`) from `orders` `o` where (`o`.`order_status` = 'delivered'))) - to_days(max(`o`.`order_purchase_timestamp`))) AS `recency`,count(distinct `o`.`order_id`) AS `frequency`,sum(`oi`.`price`) AS `monetary` from ((`customers` `c` join `orders` `o` on((`c`.`customer_id` = `o`.`customer_id`))) join `order_items` `oi` on((`o`.`order_id` = `oi`.`order_id`))) where (`o`.`order_status` = 'delivered') group by `c`.`customer_unique_id`), `rfm_scores` as (select `rfm`.`customer_unique_id` AS `customer_unique_id`,`rfm`.`recency` AS `recency`,`rfm`.`frequency` AS `frequency`,`rfm`.`monetary` AS `monetary`,(case when (`rfm`.`recency` <= 90) then 5 when (`rfm`.`recency` <= 180) then 4 when (`rfm`.`recency` <= 365) then 3 when (`rfm`.`recency` <= 540) then 2 else 1 end) AS `r_score`,(case when (`rfm`.`frequency` = 1) then 1 when (`rfm`.`frequency` = 2) then 2 when (`rfm`.`frequency` = 3) then 3 when (`rfm`.`frequency` = 4) then 4 else 5 end) AS `f_score`,ntile(5) OVER (ORDER BY `rfm`.`monetary` )  AS `m_score` from `rfm`) select `rfm_scores`.`customer_unique_id` AS `customer_unique_id`,`rfm_scores`.`recency` AS `recency`,`rfm_scores`.`frequency` AS `frequency`,`rfm_scores`.`monetary` AS `monetary`,`rfm_scores`.`r_score` AS `r_score`,`rfm_scores`.`f_score` AS `f_score`,`rfm_scores`.`m_score` AS `m_score`,concat(`rfm_scores`.`r_score`,`rfm_scores`.`f_score`,`rfm_scores`.`m_score`) AS `rfm_score`,(case when ((`rfm_scores`.`r_score` >= 4) and (`rfm_scores`.`f_score` >= 4)) then 'Champions' when ((`rfm_scores`.`r_score` >= 3) and (`rfm_scores`.`f_score` >= 3)) then 'Loyal Customers' when ((`rfm_scores`.`r_score` >= 4) and (`rfm_scores`.`f_score` = 2)) then 'Potential Loyalists' when ((`rfm_scores`.`r_score` >= 4) and (`rfm_scores`.`f_score` = 1)) then 'New Customers' when ((`rfm_scores`.`r_score` <= 2) and (`rfm_scores`.`f_score` >= 2)) then 'At Risk' when ((`rfm_scores`.`r_score` <= 2) and (`rfm_scores`.`f_score` = 1)) then 'Lost Customers' else 'Need Attention' end) AS `customer_segment` from `rfm_scores` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_delivery_performance`
--

/*!50001 DROP VIEW IF EXISTS `vw_delivery_performance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_delivery_performance` AS select `c`.`customer_state` AS `customer_state`,count(distinct `o`.`order_id`) AS `total_delivered_orders`,sum((case when (`o`.`order_delivered_customer_date` > `o`.`order_estimated_delivery_date`) then 1 else 0 end)) AS `late_orders`,round(((sum((case when (`o`.`order_delivered_customer_date` > `o`.`order_estimated_delivery_date`) then 1 else 0 end)) * 100.0) / count(distinct `o`.`order_id`)),2) AS `late_delivery_rate` from (`customers` `c` join `orders` `o` on((`c`.`customer_id` = `o`.`customer_id`))) where (`o`.`order_status` = 'delivered') group by `c`.`customer_state` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_monthly_sales`
--

/*!50001 DROP VIEW IF EXISTS `vw_monthly_sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_monthly_sales` AS select year(`o`.`order_purchase_timestamp`) AS `order_year`,month(`o`.`order_purchase_timestamp`) AS `order_month`,count(distinct `o`.`order_id`) AS `total_orders`,sum(`oi`.`price`) AS `revenue`,avg(`oi`.`price`) AS `average_item_price` from (`orders` `o` join `order_items` `oi` on((`o`.`order_id` = `oi`.`order_id`))) where (`o`.`order_status` = 'delivered') group by year(`o`.`order_purchase_timestamp`),month(`o`.`order_purchase_timestamp`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-23 11:10:11
