create table if not exists "ingredients" (
    "id" integer,
    "name" text not null,
    "price_per_unit" real not null,
    "unit" text not null,
    primary key ("id")
);

create table if not exists "donuts" (
    "name" text,
    "type" text not null,
    "price" real not null,
    "ingredient_name" text not null,
    primary key ("name", "ingredient_name")
);

create table if not exists "orders" (
    "number" integer not null,
    "donuts_name" text not null,
    "customer_id" integer not null,
    primary key ("number"),
    foreign key ("customer_id") references "customers" ("id")
);

create table if not exists "customers" (
    "id" integer,
    "first_name" text not null,
    "last_name" text not null,
    primary key ("id")
);
