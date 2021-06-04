create table keep_type_directory
(
    id            int auto_increment comment '主键'
        primary key,
    type_id       int           null comment '类型id',
    type_dir_name varchar(50)   null comment '类型目录名称',
    type_dir_icon varchar(50)   null comment '类型目录icon',
    type_dir_user int default 0 null comment '所属用户',
    create_time   int           null comment '创建时间',
    last_time     int           null comment '更新时间',
    constraint keep_type_directory_ibfk_1
        foreign key (type_id) references keep_tally_type (id)
);

create index type_id
    on keep_type_directory (type_id);

INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (1, 1, '人情', 'icon-renqing', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (2, 1, '生意', 'icon-shengyie', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (3, 1, '退款', 'icon-tuikuan', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (4, 1, '工资', 'icon-gongzi', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (5, 1, '奖金', 'icon-jiangjin', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (6, 1, '其他', 'icon-qita', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (7, 1, '红包', 'icon-hongbao', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (8, 1, '转账', 'icon-zhuanzhang', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (9, 2, '服饰美容', 'icon-fushi', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (10, 2, '餐饮', 'icon-canyin', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (11, 2, '交通', 'icon-jiaotong', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (12, 2, '住房缴费', 'icon-zhufang', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (13, 2, '购物', 'icon-mall-normal', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (14, 2, '生活服务', 'icon-shenghuofuwu', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (15, 2, '学习', 'icon-icon-test', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (16, 2, '娱乐', 'icon-yule', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (17, 2, '运动', 'icon-yundong', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (18, 2, '旅游', 'icon-lvyou', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (19, 2, '酒店', 'icon-jiudian', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (20, 2, '亲子', 'icon-qinzi', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (21, 2, '宠物', 'icon-chongwu', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (22, 2, '医疗', 'icon-yiliao', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (23, 2, '人情', 'icon-renqingwanglai', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (24, 2, '其他', 'icon-qita1', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (25, 2, '红包', 'icon-hongbao', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (26, 2, '转账', 'icon-zhuanzhang1', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (27, 2, '亲属卡', 'icon-qinshuka', 0, 1622770805, 1622770805);
INSERT INTO keep_count.keep_type_directory (id, type_id, type_dir_name, type_dir_icon, type_dir_user, create_time, last_time) VALUES (28, 2, '爱情', 'icon-qinshuka', 0, 1622770805, 1622770805);