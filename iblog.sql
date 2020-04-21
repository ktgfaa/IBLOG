create table iblog_member (
    id varchar2(100) not null PRIMARY key,
    pwd varchar2(100) not null,
    username varchar2(100) not null,
    email varchar2(200) not null,
    enabled number not null,
    authority varchar2(20) not null
    );