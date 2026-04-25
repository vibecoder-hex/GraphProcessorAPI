create type graphtype as enum ('Oriented', 'Non-oriented');

alter type graphtype owner to vibecoderhex;

create type accountrole as enum ('User', 'Admin');

alter type accountrole owner to vibecoderhex;

create type algorithm_type as enum ('Dijkstra', 'BFS', 'DFS');

alter type algorithm_type owner to vibecoderhex;

create table "user"
(
    user_id       serial
        constraint user_id_pk
            primary key,
    username      varchar(40)                 not null,
    first_name    varchar(20),
    last_name     varchar(20),
    created_at    date                        not null,
    email         varchar(80)                 not null,
    phone         varchar(20),
    password_hash char(64)                    not null,
    is_active     boolean                     not null,
    role          graph_processor.accountrole not null,
    constraint user_unq
        unique (username, email)
);

alter table "user"
    owner to vibecoderhex;

create table graph
(
    graph_id    serial
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
    processing_result_id serial
        constraint processing_result_id_pk
            primary key,
    graph_id             integer          not null
        constraint processing_result__fk
            references graph,
    algorithm            graph_processor.algorithm_type     not null,
    time_in_ns           double precision not null,
    start_vertex         varchar(40)      not null,
    target_vertex        varchar(40),
    shortest_path        varchar(40)[]    not null,
    total_distance       integer
);

alter table processing_result
    owner to vibecoderhex;

create index processing_result__fk_index
    on processing_result (graph_id);

create table node
(
    node_id     serial
        constraint node_id_pk
            primary key,
    value       varchar(40) not null,
    image       varchar(256),
    color       varchar(20),
    description varchar(80),
    graph_id    integer     not null
        constraint node_graph_id__fk
            references graph
);

alter table node
    owner to vibecoderhex;

create index node_fk_index
    on node (graph_id);

create table edge
(
    edge_id     serial
        constraint edge_id_pk
            primary key,
    value       varchar(40) not null,
    description varchar(80),
    weight      integer     not null,
    graph_id    integer     not null
        constraint edge_graph_id__fk
            references graph,
    from_node   integer     not null,
    to_node     integer     not null,
    constraint edge_pk
        unique (value, from_node, to_node)
);

alter table edge
    owner to vibecoderhex;

create index edge_fk_index
    on edge (graph_id);

