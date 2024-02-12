CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education'),
    `location` VARCHAR(32) NOT NULL,
    `year` INT NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `Companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `industry` ENUM('Technology', 'Education', 'Business'),
    `location` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `peopleConnections` (
    `user_id` INT,
    `following_id` INT,
    PRIMARY KEY (`user_id`, `following_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`following_id`) REFERENCES `users`(`id`),
);

CREATE TABLE `schoolConnections` (
    `user_id` INT,
    `school_id` INT,
    `start_date` DATE,
    `end_date` DATE,
    `degree_type` VARCHAR(8),
    PRIMARY KEY (`user_id`, `school_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`),
);

CREATE TABLE `companyConnections` (
    `user_id` INT,
    `company_id` INT,
    `start_date` DATE,
    `end_date` DATE,
    `title` VARCHAR(32),
    PRIMARY KEY (`user_id`, `company_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`),
);
