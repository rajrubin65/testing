CREATE TABLE `Kafkaconfig` (
  `conf_id` integer PRIMARY KEY,
  `topic_name` varchar(255),
  `database_id` integer,
  `table_name` varchar(50),
  `merge_on_src` varchar(255),
  `merge_on_dest` varchar(255),
  `date_fields` varchar(255),
  `source_columns` varchar(255),
  `dest_columns` varchar(255),
  `process_id` integer
);

CREATE TABLE `databaseconfig` (
  `database_id` integer PRIMARY KEY,
  `database_type` varchar(255),
  `database_host` varchar(50),
  `database_port` varchar(50),
  `database_user` varchar(255),
  `database_pass` varchar(255),
  `database_name` varchar(255)
);

CREATE TABLE `processstatus` (
  `id` integer PRIMARY KEY,
  `process_id` integer,
  `active_status` varchar(1)
);

ALTER TABLE `Kafkaconfig` ADD FOREIGN KEY (`database_id`) REFERENCES `databaseconfig` (`database_id`);

ALTER TABLE `Kafkaconfig` ADD FOREIGN KEY (`process_id`) REFERENCES `processstatus` (`id`);
