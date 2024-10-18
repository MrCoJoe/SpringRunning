CREATE TABLE `S` (
                     `SNO` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'ѧ��',
                     `SNAME` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '����'
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='ѧ����ϵ';

CREATE TABLE `C` (
                     `CNO` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�γ̺�',
                     `CNAME` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '�γ���',
                     `CTEACHER` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '��ʦ'
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='�γ̹�ϵ';

CREATE TABLE `SC` (
                      `SNO` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'ѧ��',
                      `CNO` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '�γ̺�',
                      `SCORE` bigint(100) NOT NULL DEFAULT '0' COMMENT '�ɼ�'
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='ѡ�ι�ϵ';

INSERT INTO `SC` (`SNO`, `CNO`, `SCORE`)  VALUES   ( '2', '11', 120);
INSERT INTO `S` (`SNO`, `SNAME`)  VALUES  ('2', 'С��');
INSERT INTO `C` (`CNO`, `CNAME`, `CTEACHER`)  VALUES  ('11', 'С��', '������ʦ');

-- �ҳ�û��ѡ��С����ʦ��ѧ������
-- �г������ſγ̳ɼ�����90��ѧ���������γ�ƽ����

select com.SNAME from (select S.SNAME,SC.CNO from S left join SC on S.SNO = SC.SNO ) as com
                          left join C on com.CNO=C.CNO;