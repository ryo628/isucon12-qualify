CREATE TABLE `competition` (
  `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `title` TEXT NOT NULL,
  `finished_at` DATETIME NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL
);

CREATE TABLE `competitor` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `identifier` VARCHAR(191) NOT NULL UNIQUE,
  `name` VARCHAR(191) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL
);

CREATE TABLE `competitor_score` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `competitor_id` INTEGER NOT NULL,
  `competition_id` INTEGER NOT NULL,
  `score` INTEGER NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL
);
