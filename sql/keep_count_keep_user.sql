create table keep_user
(
    id            int auto_increment comment '主键'
        primary key,
    user_name     varchar(100) null comment '用户名',
    openid        varchar(100) null comment '用户微信凭证',
    head_portrait varchar(200) null comment '用户头像',
    creat_time    int          null comment '创建时间',
    last_time     int          null comment '更新时间'
);

