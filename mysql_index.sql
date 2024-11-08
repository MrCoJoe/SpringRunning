# ************************************************************
# Sequel Ace SQL dump
# �汾�ţ� 20050
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# ����: localhost (MySQL 8.0.32)
# ���ݿ�: road_map
# ����ʱ��: 2023-08-12 07:19:03 +0000
# ************************************************************
CREATE TABLE articles (
                          id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
                          title VARCHAR(200),
                          body TEXT,
                          FULLTEXT (body));


INSERT INTO articles VALUES
                         (NULL,'MySQL Tutorial', 'DBMS stands for DataBase ...'),
                         (NULL,'How To Use MySQL Efficiently', 'After you went through a ...'),
                         (NULL,'Optimising MySQL','In this tutorial we will show ...'),
                         (NULL,'1001 MySQL Tricks','1. Never run mysqld as root. 2. ...'),
                         (NULL,'MySQL vs. YourSQL', 'In the following database comparison ...'),
                         (NULL,'MySQL Security', 'When configured properly, MySQL ...');


explain SELECT * FROM articles WHERE MATCH (body) AGAINST ('mysql');
explain SELECT * FROM articles WHERE body like '%database%';

show engines;

SHOW VARIABLES LIKE '%storage_engine%';




/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# ת���� user_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_order`;

CREATE TABLE `user_order` (
                              `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '����ID�������뱣������ID����Ҫ��һЩ��������Ե��ֶ�ֵ���Ϊ����������order_id���ᵼ��innodb�ڲ�page���Ѻʹ������I/O�������½���int ��Լ21�����ң������ᱨ��bigint ��Լ9ǧ�����ҡ�',
                              `user_name` varchar(64) NOT NULL COMMENT '�û�������',
                              `user_id` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '�û���ţ�',
                              `user_mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '�û��绰��ʹ��varchar(20)�洢�ֻ��ţ���Ҫʹ�����͡��ֻ��Ų�������ѧ���㡢�漰�����Ż��߹��Ҵ��ţ����ܳ���+-()��֧��ģ����ѯ�����磺like��135%��',
                              `sku` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '��Ʒ���',
                              `sku_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '��Ʒ����',
                              `order_id` varchar(64) NOT NULL COMMENT '����ID',
                              `quantity` int NOT NULL DEFAULT '1' COMMENT '��Ʒ���������ζ����в���ʾ�涨��ʾ���ȣ�����ʹ�� INT������ʹ�� INT(4)',
                              `unit_price` decimal(10,2) NOT NULL COMMENT '��Ʒ�۸�С������Ϊ decimal����ֹʹ�� float��double',
                              `discount_amount` decimal(10,2) NOT NULL COMMENT '�ۿ۽�',
                              `tax` decimal(4,2) NOT NULL COMMENT '���ʽ�',
                              `total_amount` decimal(10,2) NOT NULL COMMENT '֧����(��Ʒ���ܽ�� - �ۿ�) * (1 - ����)',
                              `order_date` datetime NOT NULL COMMENT '�������ڣ�timestamp��ʱ�䷶Χ��1970-01-01 00:00:01��2038-01-01 00:00:00֮��',
                              `order_status` tinyint(1) NOT NULL COMMENT '����״̬��0 ������1��ɡ�2������3�ص� ����Ҫʹ�� enum Ҫʹ�� tinyint �����0-80 ��Χ��������ʹ�� tinyint��',
                              `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�߼�ɾ����0δɾ����1��ɾ�� ������Ƿ������ֶα���ʹ��is_��',
                              `uuid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Ψһ�������ֲ�ʽ��ȫ��Ψһ������binlog ͬ�� ES ����ʹ��',
                              `ipv4` int unsigned NOT NULL DEFAULT '2130706433' COMMENT '�豸��ַ���洢IPV4��ַ��ͨ��MySQL ����ת����inet_ntoa��inet_aton ʾ����SELECT INET_ATON(��209.207.224.40��); 3520061480 SELECT INET_NTOA(3520061480); 209.207.224.40�����ֶζ���ΪNOT NULL��������Ĭ��ֵ����Ϊnullֵ���ֶλᵼ��ÿһ�ж�ռ�ö���洢�ռ�\\n����Ǩ�����׳����ھۺϺ���������ƫ���count�����׼������null����ʹ����/����ͳ��/ֵ�Ƚ϶����Ӹ��ӣ�MySQL�ڲ���Ҫ�������⴦�������н϶���ֶε�ʱ�����ݿ������½����ء�������nullֻ�ܲ���is null��is not null�����������ܲ���=��in��<��<>��!=��not in��Щ�������š��磺where name!=��abc�����������nameΪnullֵ�ļ�¼����ѯ����Ͳ������nameΪnullֵ�ļ�¼',
                              `ipv6` varbinary(16) NOT NULL COMMENT '�豸��ַ���洢IPV6��ַ��VARBINARY(16)  ���룺INET6_ATON(''2001:0db8:85a3:0000:0000:8a2e:0370:7334'') ��ѯ��SELECT INET6_NTOA(ip_address) ',
                              `ext_data` json NOT NULL COMMENT '��չ���ݣ���¼�µ�ʱ�û����豸��������Ϣ(����ҵ���ֶΣ�Ҫ�������)����select user_name, ext_data, ext_data->>''$.device'', ext_data->>''$.device.machine'' from `user_order`;��',
                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
                              PRIMARY KEY (`id`),
                              UNIQUE KEY `uq_orderid` (`order_id`),
                              UNIQUE KEY `uq_uuid` (`uuid`),
                              KEY `idx_order_date` (`order_date`),
                              KEY `idx_sku_unit_price_total_amount` (`sku`,`unit_price`,`total_amount`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `user_order` WRITE;
/*!40000 ALTER TABLE `user_order` DISABLE KEYS */;

INSERT INTO `user_order` (`id`, `user_name`, `user_id`, `user_mobile`, `sku`, `sku_name`, `order_id`, `quantity`, `unit_price`, `discount_amount`, `tax`, `total_amount`, `order_date`, `order_status`, `is_delete`, `uuid`, `ipv4`, `ipv6`, `ext_data`, `update_time`, `create_time`)
VALUES
    (1,'С����','U001','13512345678','SKU001','Mac Pro M2 ��Ĥ','ORD001',2,10.99,2.00,0.50,19.48,'2023-08-12 10:00:00',0,0,'uuid001',2130706433,X'20010DB885A3000000008A2E03707334','{\"device\": {\"machine\": \"IPhone 14 Pro\", \"location\": \"shanghai\"}}','2023-08-12 10:00:00','2023-08-12 10:00:00'),
    (2,'��»��','U002','13698765432','SKU002','IPad mini4 ����','ORD002',1,25.99,0.00,1.50,24.49,'2023-08-12 11:30:00',1,0,'uuid002',2130706433,X'20010DB885A3000000008A2E03707334','{\"device\": {\"machine\": \"PC Windows\", \"location\": \"BeiJing\"}}','2023-08-12 11:30:00','2023-08-12 11:30:00'),
    (3,'��ư��','U003','13755555555','SKU003','������','ORD003',3,9.99,1.50,0.00,26.97,'2023-08-12 13:45:00',0,0,'uuid003',2130706433,X'20010DB885A3000000008A2E03707334','{\"device\": {\"machine\": \"PC Windows\", \"location\": \"BeiJing\"}}','2023-08-12 13:45:00','2023-08-12 13:45:00'),
    (4,'Ѭ5null','U004','13812345678','SKU004','U��','ORD004',1,15.99,0.00,0.75,15.24,'2023-08-12 14:20:00',1,0,'uuid004',2130706433,X'20010DB885A3000000008A2E03707334','{\"device\": {\"machine\": \"PC Windows\", \"location\": \"BeiJing\"}}','2023-08-12 14:20:00','2023-08-12 14:20:00'),
    (5,'����һ��','U005','13999999999','SKU005','����','ORD005',2,12.50,1.25,0.25,23.75,'2023-08-12 15:55:00',0,0,'uuid005',2130706433,X'20010DB885A3000000008A2E03707334','{\"device\": {\"machine\": \"PC Windows\", \"location\": \"BeiJing\"}}','2023-08-12 15:55:00','2023-08-12 15:55:00');

/*!40000 ALTER TABLE `user_order` ENABLE KEYS */;
UNLOCK TABLES;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT INTO `user_order` (`id`, `user_name`, `user_id`, `user_mobile`, `sku`, `sku_name`, `order_id`, `quantity`, `unit_price`, `discount_amount`, `tax`, `total_amount`, `order_date`, `order_status`, `is_delete`, `uuid`, `ipv4`, `ipv6`, `ext_data`, `update_time`, `create_time`)
VALUES
    (9,'С����','U001','13512345678','SKU001','Mac Pro M2 ��Ĥ','ORD0101',2,10.99,2.00,0.50,19.48,'2023-08-12 10:00:00',0,0,'uuid010',INET_ATON('127.0.0.1'),INET6_ATON('2001:0db8:85a3:0000:0000:8a2e:0370:7334'),'{\"device\": {\"machine\": \"IPhone 14 Pro\", \"location\": \"shanghai\"}}','2023-08-12 10:00:00','2023-08-12 10:00:00');

select user_name, sku, INET_NTOA(ipv4), INET6_NTOA(ipv6) from `user_order`;

# MySQL8.0�ṩ��json����������֧��
select user_name, ext_data, ext_data->>'$.device', ext_data->>'$.device.machine' from `user_order`;

# ʹ�� order_id Ψһ����
EXPLAIN select user_name, sku, INET_NTOA(ipv4), INET6_NTOA(ipv6) from `user_order` where order_id = 'ORD002';

# ʹ���������
EXPLAIN select sku,total_amount,order_date from `user_order` where total_amount > 10 and order_date between '2023-08-09 00:00:00' and '2023-08-09 23:59:59';

# ��Ҫʹ�����������߳��������count(*)
select count(*) from `user_order`;

START TRANSACTION;

SELECT user_name, sku, total_amount, order_date, order_status FROM `user_order` WHERE order_id = 'ORD002' FOR UPDATE;

-- ������ִ�����������������Ự�޷��޸� order_id Ϊ ORD002 �Ķ�����Ϣ

COMMIT;

# �м���
UPDATE `user_order` SET order_status = 0 WHERE order_id = 'ORD002' AND order_status = 3 FOR UPDATE ;

SHOW PROCESSLIST; #������������ʾ��ǰ�������е�����MySQL���ӺͲ�ѯ��������ʾÿ�����ӵ�ID���û������������ݿ⡢ִ��ʱ��͵�ǰִ�еĲ�ѯ��

SHOW STATUS; # ������������ʾMySQL�������ĸ���״̬��Ϣ���������������߳�״̬����ѯ���������ʵȡ�

SHOW ENGINE INNODB STATUS; #������������ʾInnoDB�洢�������ϸ״̬��Ϣ������������Ϣ��������Ϣ�ͻ����״̬�ȡ�


SHOW VARIABLES LIKE 'max_connections'; # ��ʾMySQL��������ǰ���õ������������