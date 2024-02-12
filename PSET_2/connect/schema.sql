create table "users" (
    "first_name" text not null,
    "last_name" text not null,
    "user_name" text,
    "password" text,
    primary key ("user_name")
);

create table "schools" (
    "id" integer,
    "name" text,
    "type" text not null,
    "location" text not null,
    "year" integer,
    primary key ("id")
);

create table "companies" (
    "id" integer not null,
    "name" text not null,
    "industry" text not null,
    "location" text not null,
    primary key ("id")
);

create table "users_conn" (
    "user1_id" integer,
    "user2_id" integer,
    constraint "u_u" primary key ("user1_id", "user2_id")
    foreign key ("user1_id") references "users" ("id"),
    foreign key ("user2_id") references "users" ("id")
);

create table "schools_conn" (
    "user_id" integer,
    "school_id" integer,
    "start_date" numeric not null,
    "end_date" numeric not null,
    "degree_type" text not null,
    constraint "u_s" primary key ("user_id", "school_id"),
    foreign key ("user_id") references "users" ("id"),
    foreign key ("school_id") references "schools" ("id")
);

create table "comp_conn" (
    "user_id" integer,
    "comp_id" integer,
    "start_date" numeric not null,
    "end_date" numeric not null,
    "title" text not null,
    constraint "u_c" primary key ("user_id", "comp_id", "title"),
    foreign key ("user_id") references "users" ("id"),
    foreign key ("comp_id") references "companies" ("id")
);
