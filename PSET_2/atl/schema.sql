create table if not exists "passengers" (
    "id" integer,
    "first_name" text not null,
    "last_name" text not null,
    "age" integer not null,
    primary key("id")
);

create table if not exists "check_ins" (
    "passenger_id" integer,
    "date" numeric default CURRENT_TIMESTAMP,
    "flight_number" integer,
    foreign key("passenger_id") references "passengers"("id"),
    foreign key("flight_number") references "flight"("flight_number")
);

CREATE table if not exists "airlines" (
    "name" text not null,
    "concourse" text not null check("concourse" in('A','B','C','D','E','F','T'))
);

create table if not exists "flight" (
    "flight_number" integer not null,
    "airline_name" text,
    "from_airport" text not null,
    "to_airport" text not null,
    "departure_date" numeric not null ,
    "arrival_date" numeric not null,
    foreign key("airline_name") references "airlines"("airline_name")
);
