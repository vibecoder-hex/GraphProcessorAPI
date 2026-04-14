create type graphtype as enum ('Oreinted', 'Non-oreinted');

alter type graphtype owner to vibecoderhex;

create table "user"
(
    user_id       integer     not null
        constraint user_id_pk
            primary key,
    username      varchar(40) not null,
    first_name    varchar(20),
    last_name     varchar(20),
    created_at    date        not null,
    email         varchar(80) not null,
    phone         varchar(10),
    password_hash char(64)    not null,
    role          integer     not null,
    is_active     integer     not null,
    constraint user_unq
        unique (username, email)
);

alter table "user"
    owner to vibecoderhex;

create table graph
(
    graph_id    integer                   not null
        constraint graph_id_pk
            primary key,
    name        varchar(40)               not null
        constraint graph_unq
            unique,
    type        graph_processor.graphtype not null,
    description text,
    creationat  date                      not null,
    structure   json                      not null,
    user_id     integer                   not null
        constraint graph__fk
            references "user"
);

alter table graph
    owner to vibecoderhex;

create index graph__fk_index
    on graph (user_id);

create table processing_result
(
    processing_result_id integer          not null
        constraint processing_result_id_pk
            primary key,
    graph_id             integer          not null
        constraint processing_result__fk
            references graph,
    algorithm            varchar(20)      not null,
    time_in_ns           double precision not null,
    start_vertex         varchar(20)      not null,
    target_vertex        integer,
    shortest_path        char[]           not null,
    total_distance       integer
);

alter table processing_result
    owner to vibecoderhex;

create index processing_result__fk_index
    on processing_result (graph_id);

