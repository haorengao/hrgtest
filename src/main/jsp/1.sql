SELECT * FROM `tbl_toll_order_archive_43_1801` o
LEFT JOIN db_author.`clr_organ_43` a ON o.`pay_station_id` = a.`stationId`;



SELECT
    managementId,
    managementName,
    SUM(total_fee) AS totalFee,
    organ_index
  FROM
    tbl_toll_order_archive_43_1801 a
    LEFT JOIN db_author.clr_organ_43 b
      ON a.pay_station_id = b.stationId
  WHERE pay_status = '2'
    AND finish_time >= '2017-09-01 00:00:00'
    AND finish_time <= '2018-08-22 23:59:59'
  GROUP BY managementId,
    managementName,
    organ_index;
    
    
    
SELECT  t.`roadType`,  CASE WHEN t.`roadType` = 1 THEN '经营性' ELSE '管理处' END organName, SUM(t.totalFee) AS totalFee FROM (    
    
SELECT b.`roadType`, SUM(total_fee) AS totalFee  FROM tbl_toll_order_archive_43_1801 a LEFT JOIN db_author.clr_organ_43 b  ON a.pay_station_id = b.stationId
  WHERE pay_status = '2'
    AND toll_date >= '20170901'
    AND toll_date <= '20180922'
  GROUP BY b.`roadType`
  UNION ALL
  SELECT
   b.`roadType`,   
    SUM(total_fee) AS totalFee
      FROM
    tbl_toll_order_archive_43_1801 a
    LEFT JOIN db_author.clr_organ_43 b
      ON a.pay_station_id = b.stationId
  WHERE pay_status = '2'
    AND toll_date >= '20170901'
    AND toll_date <= '20180922'
  GROUP BY b.`roadType`
  ) t GROUP BY t.roadType
  
  
  
  
  
  
SELECT    
    a.pay_channel,
    CASE WHEN a.pay_channel = 1 THEN '微信' WHEN a.pay_channel = 2 THEN '支付宝' WHEN a.pay_channel = 3 THEN '百度' WHEN a.pay_channel = 4 THEN '京东' WHEN a.pay_channel = 5 THEN '银联二维码' WHEN a.pay_channel = 6 THEN '银联NFC'
    WHEN a.pay_channel = 7 THEN '支付宝ITC代扣' WHEN a.pay_channel = 8 THEN '支付宝代扣' ELSE '' END payChannelName,
    SUM(total_fee) AS totalFeeSum
  FROM
    tbl_toll_order_archive_43_1807 a        
  WHERE pay_status = '2'
    AND toll_date >= '20180501'
    AND toll_date <= '20180822'    
  GROUP BY a.`pay_channel`
  
  
  SELECT
  t.vehicle_class vehicleClass,
  SUM(t.totalFeeSum) AS totalFeeSum
FROM
  (SELECT
    a.vehicle_class,
    SUM(total_fee) AS totalFeeSum
  FROM
    tbl_toll_order_archive_43_1805 a
  WHERE pay_status = '2'
    AND toll_date >= '20180501'
    AND toll_date <= '20180822'
  GROUP BY a.vehicle_class
  UNION
  ALL
  SELECT
    a.vehicle_class,
    SUM(total_fee) AS totalFeeSum
  FROM
    tbl_toll_order_archive_43_1806 a
  WHERE pay_status = '2'
    AND toll_date >= '20180501'
    AND toll_date <= '20180822'
  GROUP BY a.vehicle_class
  UNION
  ALL
  SELECT
    a.vehicle_class,
    SUM(total_fee) AS totalFeeSum
  FROM
    tbl_toll_order_archive_43_1807 a
  WHERE pay_status = '2'
    AND toll_date >= '20180501'
    AND toll_date <= '20180822'
  GROUP BY a.vehicle_class
  UNION
  ALL
  SELECT
    a.vehicle_class,
    SUM(total_fee) AS totalFeeSum
  FROM
    tbl_toll_order_archive_43_1808 a
  WHERE pay_status = '2'
    AND toll_date >= '20180501'
    AND toll_date <= '20180822'
  GROUP BY a.vehicle_class
  UNION
  ALL
  SELECT
    a.vehicle_class,
    SUM(total_fee) AS totalFeeSum
  FROM
    tbl_toll_order_archive_43_1809 a
  WHERE pay_status = '2'
    AND toll_date >= '20180501'
    AND toll_date <= '20180822'
  GROUP BY a.vehicle_class) t
GROUP BY t.vehicle_class
   
    
    


	