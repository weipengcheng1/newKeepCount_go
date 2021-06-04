create table keep_tally_type
(
    id        int auto_increment comment '主键'
        primary key,
    type_name varchar(50) null comment '类型名称',
    type_en   varchar(50) null comment '类型英文名称'
);

INSERT INTO keep_count.keep_tally_type (id, type_name, type_en) VALUES (1, '收入', 'income');
INSERT INTO keep_count.keep_tally_type (id, type_name, type_en) VALUES (2, '支出', 'pay');