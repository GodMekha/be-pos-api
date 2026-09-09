/*
  Warnings:

  - You are about to drop the `Category` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Customer` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `HistoryInInventory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `HistoryInProduct` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Inventory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Order` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `OrderDetail` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Package` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Part` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Purchase` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PurchaseDetail` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Sell` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SellDetail` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Supply` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `HistoryInInventory` DROP FOREIGN KEY `HistoryInInventory_inventoryId_fkey`;

-- DropForeignKey
ALTER TABLE `HistoryInProduct` DROP FOREIGN KEY `HistoryInProduct_productId_fkey`;

-- DropForeignKey
ALTER TABLE `Order` DROP FOREIGN KEY `Order_userId_fkey`;

-- DropForeignKey
ALTER TABLE `OrderDetail` DROP FOREIGN KEY `OrderDetail_orderId_fkey`;

-- DropForeignKey
ALTER TABLE `Product` DROP FOREIGN KEY `Product_categoryId_fkey`;

-- DropForeignKey
ALTER TABLE `Purchase` DROP FOREIGN KEY `Purchase_supplyId_fkey`;

-- DropForeignKey
ALTER TABLE `PurchaseDetail` DROP FOREIGN KEY `PurchaseDetail_purchaseId_fkey`;

-- DropForeignKey
ALTER TABLE `Sell` DROP FOREIGN KEY `Sell_customerId_fkey`;

-- DropForeignKey
ALTER TABLE `Sell` DROP FOREIGN KEY `Sell_packageId_fkey`;

-- DropForeignKey
ALTER TABLE `SellDetail` DROP FOREIGN KEY `SellDetail_partId_fkey`;

-- DropForeignKey
ALTER TABLE `SellDetail` DROP FOREIGN KEY `SellDetail_sellId_fkey`;

-- DropTable
DROP TABLE `Category`;

-- DropTable
DROP TABLE `Customer`;

-- DropTable
DROP TABLE `HistoryInInventory`;

-- DropTable
DROP TABLE `HistoryInProduct`;

-- DropTable
DROP TABLE `Inventory`;

-- DropTable
DROP TABLE `Order`;

-- DropTable
DROP TABLE `OrderDetail`;

-- DropTable
DROP TABLE `Package`;

-- DropTable
DROP TABLE `Part`;

-- DropTable
DROP TABLE `Product`;

-- DropTable
DROP TABLE `Purchase`;

-- DropTable
DROP TABLE `PurchaseDetail`;

-- DropTable
DROP TABLE `Sell`;

-- DropTable
DROP TABLE `SellDetail`;

-- DropTable
DROP TABLE `Supply`;

-- DropTable
DROP TABLE `User`;

-- CreateTable
CREATE TABLE `users` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(100) NOT NULL,
    `email` VARCHAR(255) NULL,
    `phone` VARCHAR(50) NULL,
    `password_hash` TEXT NULL,
    `user_type` VARCHAR(50) NOT NULL,
    `status` ENUM('ACTIVE', 'INACTIVE', 'LOCKED', 'SUSPENDED') NOT NULL DEFAULT 'ACTIVE',
    `last_login_at` DATETIME(6) NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `users_username_key`(`username`),
    UNIQUE INDEX `users_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `roles` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(100) NOT NULL,
    `name` VARCHAR(150) NOT NULL,
    `description` TEXT NULL,

    UNIQUE INDEX `roles_code_key`(`code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `permissions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(150) NOT NULL,
    `name` VARCHAR(200) NOT NULL,
    `description` TEXT NULL,

    UNIQUE INDEX `permissions_code_key`(`code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_roles` (
    `user_id` BIGINT NOT NULL,
    `role_id` BIGINT NOT NULL,

    PRIMARY KEY (`user_id`, `role_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `role_permissions` (
    `role_id` BIGINT NOT NULL,
    `permission_id` BIGINT NOT NULL,

    PRIMARY KEY (`role_id`, `permission_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `issuers` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `legal_name` VARCHAR(300) NOT NULL,
    `short_name` VARCHAR(150) NULL,
    `registration_no` VARCHAR(100) NULL,
    `business_type` VARCHAR(150) NULL,
    `country` VARCHAR(100) NULL,
    `address` TEXT NULL,
    `contact_email` VARCHAR(255) NULL,
    `phone` VARCHAR(50) NULL,
    `status` VARCHAR(50) NOT NULL DEFAULT 'ACTIVE',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `issuers_registration_no_key`(`registration_no`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `listing_applications` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `application_no` VARCHAR(100) NOT NULL,
    `issuer_id` BIGINT NOT NULL,
    `security_type` ENUM('EQUITY', 'BOND', 'ETF', 'FUND', 'OTHER') NOT NULL,
    `board_type` VARCHAR(100) NULL,
    `status` ENUM('DRAFT', 'SUBMITTED', 'UNDER_REVIEW', 'RETURNED', 'APPROVED', 'REJECTED', 'WITHDRAWN') NOT NULL DEFAULT 'DRAFT',
    `submitted_at` DATETIME(6) NULL,
    `approved_at` DATETIME(6) NULL,
    `rejected_at` DATETIME(6) NULL,
    `created_by` BIGINT NULL,
    `approved_by` BIGINT NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `listing_applications_application_no_key`(`application_no`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `application_reviews` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `application_id` BIGINT NOT NULL,
    `reviewer_id` BIGINT NOT NULL,
    `review_stage` VARCHAR(100) NOT NULL,
    `status` VARCHAR(50) NOT NULL,
    `comment` TEXT NULL,
    `reviewed_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `application_status_history` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `application_id` BIGINT NOT NULL,
    `from_status` ENUM('DRAFT', 'SUBMITTED', 'UNDER_REVIEW', 'RETURNED', 'APPROVED', 'REJECTED', 'WITHDRAWN') NULL,
    `to_status` ENUM('DRAFT', 'SUBMITTED', 'UNDER_REVIEW', 'RETURNED', 'APPROVED', 'REJECTED', 'WITHDRAWN') NOT NULL,
    `changed_by` BIGINT NULL,
    `reason` TEXT NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `documents` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `document_type` VARCHAR(100) NOT NULL,
    `file_name` VARCHAR(500) NOT NULL,
    `storage_key` TEXT NOT NULL,
    `mime_type` VARCHAR(150) NULL,
    `file_size` BIGINT NULL,
    `checksum` VARCHAR(255) NULL,
    `created_by` BIGINT NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `document_versions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `document_id` BIGINT NOT NULL,
    `version_no` INTEGER NOT NULL,
    `storage_key` TEXT NOT NULL,
    `checksum` VARCHAR(255) NULL,
    `uploaded_by` BIGINT NULL,
    `uploaded_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `document_versions_document_id_version_no_key`(`document_id`, `version_no`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `application_documents` (
    `application_id` BIGINT NOT NULL,
    `document_id` BIGINT NOT NULL,

    PRIMARY KEY (`application_id`, `document_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `boards` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(50) NOT NULL,
    `name` VARCHAR(150) NOT NULL,
    `description` TEXT NULL,

    UNIQUE INDEX `boards_code_key`(`code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `securities` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `issuer_id` BIGINT NOT NULL,
    `security_type` ENUM('EQUITY', 'BOND', 'ETF', 'FUND', 'OTHER') NOT NULL,
    `name` VARCHAR(300) NOT NULL,
    `ticker` VARCHAR(50) NOT NULL,
    `isin` VARCHAR(50) NULL,
    `cusip` VARCHAR(50) NULL,
    `currency` ENUM('LAK', 'USD', 'THB', 'CNY', 'OTHER') NOT NULL DEFAULT 'LAK',
    `face_value` DECIMAL(30, 10) NULL,
    `issue_size` DECIMAL(30, 10) NULL,
    `outstanding_quantity` DECIMAL(30, 10) NOT NULL DEFAULT 0,
    `listed_quantity` DECIMAL(30, 10) NOT NULL DEFAULT 0,
    `status` ENUM('DRAFT', 'ACTIVE', 'SUSPENDED', 'DELISTED', 'MATURED') NOT NULL DEFAULT 'DRAFT',
    `listing_date` DATE NULL,
    `trading_start_date` DATE NULL,
    `trading_end_date` DATE NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `securities_ticker_key`(`ticker`),
    UNIQUE INDEX `securities_isin_key`(`isin`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `security_versions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `security_id` BIGINT NOT NULL,
    `version_no` INTEGER NOT NULL,
    `data` JSON NOT NULL,
    `effective_from` DATETIME(6) NOT NULL,
    `effective_to` DATETIME(6) NULL,
    `created_by` BIGINT NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `security_versions_security_id_version_no_key`(`security_id`, `version_no`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `security_boards` (
    `security_id` BIGINT NOT NULL,
    `board_id` BIGINT NOT NULL,
    `effective_from` DATETIME(6) NOT NULL,
    `effective_to` DATETIME(6) NULL,

    PRIMARY KEY (`security_id`, `board_id`, `effective_from`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trading_rules` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `security_id` BIGINT NOT NULL,
    `reference_price` DECIMAL(30, 10) NULL,
    `price_ceiling` DECIMAL(30, 10) NULL,
    `price_floor` DECIMAL(30, 10) NULL,
    `board_lot` DECIMAL(30, 10) NOT NULL DEFAULT 1,
    `tick_size` DECIMAL(30, 10) NOT NULL,
    `trading_method` VARCHAR(50) NOT NULL,
    `effective_from` DATETIME(6) NOT NULL,
    `effective_to` DATETIME(6) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `bond_details` (
    `security_id` BIGINT NOT NULL,
    `coupon_rate` DECIMAL(20, 10) NULL,
    `coupon_frequency` VARCHAR(50) NULL,
    `day_count_convention` VARCHAR(50) NULL,
    `issue_date` DATE NULL,
    `maturity_date` DATE NULL,

    PRIMARY KEY (`security_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `members` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `member_code` VARCHAR(50) NOT NULL,
    `name` VARCHAR(300) NOT NULL,
    `member_type` ENUM('BROKER', 'DEALER', 'MARKET_MAKER', 'CLEARING_MEMBER', 'CUSTODIAN') NOT NULL,
    `license_no` VARCHAR(100) NULL,
    `status` VARCHAR(50) NOT NULL DEFAULT 'ACTIVE',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `members_member_code_key`(`member_code`),
    UNIQUE INDEX `members_license_no_key`(`license_no`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `member_users` (
    `member_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,

    PRIMARY KEY (`member_id`, `user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `member_accounts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `member_id` BIGINT NOT NULL,
    `account_no` VARCHAR(100) NOT NULL,
    `account_type` VARCHAR(100) NOT NULL,
    `status` ENUM('PENDING', 'ACTIVE', 'BLOCKED', 'CLOSED') NOT NULL DEFAULT 'ACTIVE',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `member_accounts_account_no_key`(`account_no`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `investors` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `investor_type` ENUM('INDIVIDUAL', 'CORPORATE', 'INSTITUTIONAL', 'FOREIGN') NOT NULL,
    `full_name` VARCHAR(300) NULL,
    `legal_name` VARCHAR(300) NULL,
    `nationality` VARCHAR(100) NULL,
    `country` VARCHAR(100) NULL,
    `date_of_birth` DATE NULL,
    `tax_id` VARCHAR(100) NULL,
    `status` VARCHAR(50) NOT NULL DEFAULT 'ACTIVE',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `investor_kyc` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `investor_id` BIGINT NOT NULL,
    `kyc_level` VARCHAR(50) NOT NULL,
    `risk_level` VARCHAR(50) NULL,
    `verification_status` VARCHAR(50) NOT NULL,
    `verified_at` DATETIME(6) NULL,
    `verified_by` BIGINT NULL,

    UNIQUE INDEX `investor_kyc_investor_id_key`(`investor_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trading_accounts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `investor_id` BIGINT NOT NULL,
    `member_id` BIGINT NOT NULL,
    `account_no` VARCHAR(100) NOT NULL,
    `account_type` VARCHAR(100) NOT NULL,
    `status` ENUM('PENDING', 'ACTIVE', 'BLOCKED', 'CLOSED') NOT NULL DEFAULT 'PENDING',
    `opened_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `trading_accounts_account_no_key`(`account_no`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cash_accounts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `trading_account_id` BIGINT NOT NULL,
    `currency` ENUM('LAK', 'USD', 'THB', 'CNY', 'OTHER') NOT NULL,
    `available_balance` DECIMAL(30, 10) NOT NULL DEFAULT 0,
    `blocked_balance` DECIMAL(30, 10) NOT NULL DEFAULT 0,
    `total_balance` DECIMAL(30, 10) NOT NULL DEFAULT 0,
    `status` ENUM('PENDING', 'ACTIVE', 'BLOCKED', 'CLOSED') NOT NULL DEFAULT 'ACTIVE',

    UNIQUE INDEX `cash_accounts_trading_account_id_currency_key`(`trading_account_id`, `currency`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `securities_accounts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `trading_account_id` BIGINT NOT NULL,
    `account_no` VARCHAR(100) NOT NULL,
    `status` ENUM('PENDING', 'ACTIVE', 'BLOCKED', 'CLOSED') NOT NULL DEFAULT 'ACTIVE',
    `opened_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `securities_accounts_account_no_key`(`account_no`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trading_sessions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `market_date` DATE NOT NULL,
    `board_id` BIGINT NOT NULL,
    `session_type` VARCHAR(50) NOT NULL,
    `start_time` DATETIME(6) NOT NULL,
    `end_time` DATETIME(6) NULL,
    `status` VARCHAR(50) NOT NULL DEFAULT 'OPEN',

    UNIQUE INDEX `trading_sessions_market_date_board_id_session_type_key`(`market_date`, `board_id`, `session_type`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trading_halts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `security_id` BIGINT NOT NULL,
    `session_id` BIGINT NULL,
    `reason` TEXT NOT NULL,
    `started_at` DATETIME(6) NOT NULL,
    `ended_at` DATETIME(6) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `orders` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `order_id` VARCHAR(100) NOT NULL,
    `client_order_id` VARCHAR(100) NULL,
    `trading_account_id` BIGINT NOT NULL,
    `member_id` BIGINT NOT NULL,
    `security_id` BIGINT NOT NULL,
    `session_id` BIGINT NULL,
    `side` ENUM('BUY', 'SELL') NOT NULL,
    `order_type` ENUM('MARKET', 'LIMIT', 'STOP', 'STOP_LIMIT') NOT NULL,
    `time_in_force` ENUM('DAY', 'GTC', 'IOC', 'FOK', 'GTD') NOT NULL DEFAULT 'DAY',
    `quantity` DECIMAL(30, 10) NOT NULL,
    `price` DECIMAL(30, 10) NULL,
    `stop_price` DECIMAL(30, 10) NULL,
    `display_quantity` DECIMAL(30, 10) NULL,
    `remaining_quantity` DECIMAL(30, 10) NOT NULL,
    `filled_quantity` DECIMAL(30, 10) NOT NULL DEFAULT 0,
    `status` ENUM('PENDING', 'VALIDATING', 'ACCEPTED', 'PARTIALLY_FILLED', 'FILLED', 'AMENDED', 'CANCEL_PENDING', 'CANCELLED', 'REJECTED', 'EXPIRED') NOT NULL DEFAULT 'PENDING',
    `received_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `accepted_at` DATETIME(6) NULL,
    `cancelled_at` DATETIME(6) NULL,
    `expires_at` DATETIME(6) NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `orders_order_id_key`(`order_id`),
    INDEX `idx_orders_security_status`(`security_id`, `status`),
    INDEX `idx_orders_account_created`(`trading_account_id`, `created_at`),
    INDEX `idx_orders_member_created`(`member_id`, `created_at`),
    INDEX `idx_orders_client_order_id`(`member_id`, `client_order_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_events` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `order_id` BIGINT NOT NULL,
    `event_type` VARCHAR(100) NOT NULL,
    `old_status` ENUM('PENDING', 'VALIDATING', 'ACCEPTED', 'PARTIALLY_FILLED', 'FILLED', 'AMENDED', 'CANCEL_PENDING', 'CANCELLED', 'REJECTED', 'EXPIRED') NULL,
    `new_status` ENUM('PENDING', 'VALIDATING', 'ACCEPTED', 'PARTIALLY_FILLED', 'FILLED', 'AMENDED', 'CANCEL_PENDING', 'CANCELLED', 'REJECTED', 'EXPIRED') NULL,
    `quantity` DECIMAL(30, 10) NULL,
    `price` DECIMAL(30, 10) NULL,
    `reason` TEXT NULL,
    `event_time` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `sequence_no` BIGINT NOT NULL,

    INDEX `idx_order_events_order_time`(`order_id`, `event_time`),
    UNIQUE INDEX `order_events_order_id_sequence_no_key`(`order_id`, `sequence_no`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_amendments` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `order_id` BIGINT NOT NULL,
    `original_quantity` DECIMAL(30, 10) NULL,
    `new_quantity` DECIMAL(30, 10) NULL,
    `original_price` DECIMAL(30, 10) NULL,
    `new_price` DECIMAL(30, 10) NULL,
    `reason` TEXT NULL,
    `created_by` BIGINT NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_books` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `security_id` BIGINT NOT NULL,
    `trading_session_id` BIGINT NOT NULL,
    `status` VARCHAR(50) NOT NULL DEFAULT 'OPEN',

    UNIQUE INDEX `order_books_security_id_trading_session_id_key`(`security_id`, `trading_session_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `executions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `execution_id` VARCHAR(100) NOT NULL,
    `buy_order_id` BIGINT NOT NULL,
    `sell_order_id` BIGINT NOT NULL,
    `security_id` BIGINT NOT NULL,
    `quantity` DECIMAL(30, 10) NOT NULL,
    `price` DECIMAL(30, 10) NOT NULL,
    `executed_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `match_sequence` BIGINT NOT NULL,
    `status` ENUM('NEW', 'EXECUTED', 'CANCELLED') NOT NULL DEFAULT 'EXECUTED',

    UNIQUE INDEX `executions_execution_id_key`(`execution_id`),
    INDEX `idx_executions_security_time`(`security_id`, `executed_at`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trades` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `trade_id` VARCHAR(100) NOT NULL,
    `execution_id` BIGINT NOT NULL,
    `buy_account_id` BIGINT NOT NULL,
    `sell_account_id` BIGINT NOT NULL,
    `security_id` BIGINT NOT NULL,
    `quantity` DECIMAL(30, 10) NOT NULL,
    `price` DECIMAL(30, 10) NOT NULL,
    `gross_amount` DECIMAL(30, 10) NOT NULL,
    `trade_date` DATE NOT NULL,
    `settlement_date` DATE NULL,
    `status` ENUM('NEW', 'CAPTURED', 'CLEARED', 'SETTLEMENT_PENDING', 'SETTLED', 'FAILED', 'CANCELLED') NOT NULL DEFAULT 'NEW',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `trades_trade_id_key`(`trade_id`),
    UNIQUE INDEX `trades_execution_id_key`(`execution_id`),
    INDEX `idx_trades_security_date`(`security_id`, `trade_date`),
    INDEX `idx_trades_settlement_date`(`settlement_date`, `status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trade_fees` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `trade_id` BIGINT NOT NULL,
    `fee_type` VARCHAR(100) NOT NULL,
    `rate` DECIMAL(20, 10) NULL,
    `amount` DECIMAL(30, 10) NOT NULL,
    `currency` ENUM('LAK', 'USD', 'THB', 'CNY', 'OTHER') NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `market_ticks` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `security_id` BIGINT NOT NULL,
    `trade_id` BIGINT NULL,
    `price` DECIMAL(30, 10) NOT NULL,
    `quantity` DECIMAL(30, 10) NOT NULL,
    `timestamp` DATETIME(6) NOT NULL,
    `sequence_no` BIGINT NOT NULL,

    INDEX `idx_market_ticks_security_time`(`security_id`, `timestamp`),
    PRIMARY KEY (`id`, `timestamp`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `market_ohlcv` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `security_id` BIGINT NOT NULL,
    `timeframe` VARCHAR(20) NOT NULL,
    `open` DECIMAL(30, 10) NOT NULL,
    `high` DECIMAL(30, 10) NOT NULL,
    `low` DECIMAL(30, 10) NOT NULL,
    `close` DECIMAL(30, 10) NOT NULL,
    `volume` DECIMAL(30, 10) NOT NULL DEFAULT 0,
    `trade_count` BIGINT NOT NULL DEFAULT 0,
    `candle_time` DATETIME(6) NOT NULL,

    INDEX `idx_market_ohlcv_security_time`(`security_id`, `timeframe`, `candle_time`),
    UNIQUE INDEX `market_ohlcv_security_id_timeframe_candle_time_key`(`security_id`, `timeframe`, `candle_time`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_book_snapshots` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `security_id` BIGINT NOT NULL,
    `timestamp` DATETIME(6) NOT NULL,
    `sequence_no` BIGINT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_book_levels` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `snapshot_id` BIGINT NOT NULL,
    `side` ENUM('BUY', 'SELL') NOT NULL,
    `price` DECIMAL(30, 10) NOT NULL,
    `quantity` DECIMAL(30, 10) NOT NULL,
    `order_count` INTEGER NOT NULL DEFAULT 0,
    `level_no` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `settlement_batches` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `settlement_date` DATE NOT NULL,
    `cycle` VARCHAR(50) NOT NULL,
    `status` ENUM('PENDING', 'PROCESSING', 'SETTLED', 'FAILED', 'CANCELLED') NOT NULL DEFAULT 'PENDING',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `settlement_batches_settlement_date_cycle_key`(`settlement_date`, `cycle`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `settlement_obligations` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `trade_id` BIGINT NOT NULL,
    `account_id` BIGINT NOT NULL,
    `security_id` BIGINT NOT NULL,
    `side` ENUM('BUY', 'SELL') NOT NULL,
    `quantity` DECIMAL(30, 10) NOT NULL,
    `cash_amount` DECIMAL(30, 10) NOT NULL,
    `currency` ENUM('LAK', 'USD', 'THB', 'CNY', 'OTHER') NOT NULL,
    `status` ENUM('PENDING', 'PROCESSING', 'SETTLED', 'FAILED', 'CANCELLED') NOT NULL DEFAULT 'PENDING',

    INDEX `idx_settlement_obligations_trade`(`trade_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `settlement_instructions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `obligation_id` BIGINT NOT NULL,
    `delivery_account_id` BIGINT NULL,
    `receive_account_id` BIGINT NULL,
    `delivery_quantity` DECIMAL(30, 10) NULL,
    `receive_quantity` DECIMAL(30, 10) NULL,
    `cash_amount` DECIMAL(30, 10) NULL,
    `status` ENUM('PENDING', 'PROCESSING', 'SETTLED', 'FAILED', 'CANCELLED') NOT NULL DEFAULT 'PENDING',
    `settled_at` DATETIME(6) NULL,

    INDEX `idx_settlement_instructions_status`(`status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `settlement_failures` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `instruction_id` BIGINT NOT NULL,
    `failure_code` VARCHAR(100) NULL,
    `reason` TEXT NULL,
    `retry_count` INTEGER NOT NULL DEFAULT 0,
    `resolved_at` DATETIME(6) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reconciliations` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `reconciliation_type` VARCHAR(100) NOT NULL,
    `business_date` DATE NOT NULL,
    `source_system` VARCHAR(100) NOT NULL,
    `target_system` VARCHAR(100) NOT NULL,
    `expected_value` DECIMAL(30, 10) NULL,
    `actual_value` DECIMAL(30, 10) NULL,
    `difference` DECIMAL(30, 10) NULL,
    `status` VARCHAR(50) NOT NULL,
    `resolved_at` DATETIME(6) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `securities_holdings` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `securities_account_id` BIGINT NOT NULL,
    `security_id` BIGINT NOT NULL,
    `quantity` DECIMAL(30, 10) NOT NULL DEFAULT 0,
    `available_quantity` DECIMAL(30, 10) NOT NULL DEFAULT 0,
    `blocked_quantity` DECIMAL(30, 10) NOT NULL DEFAULT 0,
    `pledged_quantity` DECIMAL(30, 10) NOT NULL DEFAULT 0,
    `as_of_date` DATE NOT NULL,

    INDEX `idx_holdings_account_security`(`securities_account_id`, `security_id`),
    UNIQUE INDEX `securities_holdings_securities_account_id_security_id_as_of__key`(`securities_account_id`, `security_id`, `as_of_date`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `securities_transactions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `securities_account_id` BIGINT NOT NULL,
    `security_id` BIGINT NOT NULL,
    `transaction_type` VARCHAR(100) NOT NULL,
    `quantity` DECIMAL(30, 10) NOT NULL,
    `reference_type` VARCHAR(100) NULL,
    `reference_id` BIGINT NULL,
    `transaction_date` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `status` ENUM('PENDING', 'POSTED', 'REVERSED', 'FAILED') NOT NULL DEFAULT 'POSTED',

    INDEX `idx_securities_transactions_account_time`(`securities_account_id`, `transaction_date`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `security_transfers` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `from_account_id` BIGINT NOT NULL,
    `to_account_id` BIGINT NOT NULL,
    `security_id` BIGINT NOT NULL,
    `quantity` DECIMAL(30, 10) NOT NULL,
    `reason` TEXT NULL,
    `status` ENUM('PENDING', 'POSTED', 'REVERSED', 'FAILED') NOT NULL DEFAULT 'PENDING',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `completed_at` DATETIME(6) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pledges` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `securities_account_id` BIGINT NOT NULL,
    `security_id` BIGINT NOT NULL,
    `quantity` DECIMAL(30, 10) NOT NULL,
    `pledgee` VARCHAR(300) NOT NULL,
    `status` ENUM('ACTIVE', 'RELEASED', 'CANCELLED') NOT NULL DEFAULT 'ACTIVE',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `released_at` DATETIME(6) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ledger_accounts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `account_code` VARCHAR(100) NOT NULL,
    `account_type` VARCHAR(100) NOT NULL,
    `owner_type` VARCHAR(100) NULL,
    `owner_id` BIGINT NULL,
    `currency` ENUM('LAK', 'USD', 'THB', 'CNY', 'OTHER') NULL,
    `status` ENUM('PENDING', 'ACTIVE', 'BLOCKED', 'CLOSED') NOT NULL DEFAULT 'ACTIVE',

    UNIQUE INDEX `ledger_accounts_account_code_key`(`account_code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `journal_entries` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `journal_no` VARCHAR(100) NOT NULL,
    `transaction_type` VARCHAR(100) NOT NULL,
    `reference_type` VARCHAR(100) NULL,
    `reference_id` BIGINT NULL,
    `business_date` DATE NOT NULL,
    `posted_at` DATETIME(6) NULL,
    `status` ENUM('DRAFT', 'POSTED', 'REVERSED') NOT NULL DEFAULT 'DRAFT',
    `created_by` BIGINT NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    UNIQUE INDEX `journal_entries_journal_no_key`(`journal_no`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `journal_lines` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `journal_entry_id` BIGINT NOT NULL,
    `ledger_account_id` BIGINT NOT NULL,
    `debit` DECIMAL(30, 10) NOT NULL DEFAULT 0,
    `credit` DECIMAL(30, 10) NOT NULL DEFAULT 0,
    `currency` ENUM('LAK', 'USD', 'THB', 'CNY', 'OTHER') NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `corporate_actions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `security_id` BIGINT NOT NULL,
    `action_type` VARCHAR(100) NOT NULL,
    `announcement_date` DATE NOT NULL,
    `record_date` DATE NULL,
    `ex_date` DATE NULL,
    `payment_date` DATE NULL,
    `status` ENUM('ANNOUNCED', 'OPEN', 'PROCESSED', 'PAID', 'CANCELLED') NOT NULL DEFAULT 'ANNOUNCED',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `corporate_action_entitlements` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `corporate_action_id` BIGINT NOT NULL,
    `securities_account_id` BIGINT NOT NULL,
    `eligible_quantity` DECIMAL(30, 10) NOT NULL,
    `entitlement_quantity` DECIMAL(30, 10) NULL,
    `cash_amount` DECIMAL(30, 10) NULL,
    `status` VARCHAR(50) NOT NULL DEFAULT 'PENDING',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `corporate_action_payments` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `entitlement_id` BIGINT NOT NULL,
    `payment_type` VARCHAR(100) NOT NULL,
    `amount` DECIMAL(30, 10) NULL,
    `currency` ENUM('LAK', 'USD', 'THB', 'CNY', 'OTHER') NULL,
    `paid_at` DATETIME(6) NULL,
    `status` ENUM('PENDING', 'POSTED', 'REVERSED', 'FAILED') NOT NULL DEFAULT 'PENDING',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `dividends` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `security_id` BIGINT NOT NULL,
    `record_date` DATE NOT NULL,
    `ex_date` DATE NULL,
    `payment_date` DATE NULL,
    `dividend_per_share` DECIMAL(30, 10) NOT NULL,
    `currency` ENUM('LAK', 'USD', 'THB', 'CNY', 'OTHER') NOT NULL,
    `status` ENUM('ANNOUNCED', 'OPEN', 'PROCESSED', 'PAID', 'CANCELLED') NOT NULL DEFAULT 'ANNOUNCED',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `indices` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(100) NOT NULL,
    `name` VARCHAR(300) NOT NULL,
    `base_currency` ENUM('LAK', 'USD', 'THB', 'CNY', 'OTHER') NULL,
    `status` VARCHAR(50) NOT NULL DEFAULT 'ACTIVE',

    UNIQUE INDEX `indices_code_key`(`code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `index_constituents` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `index_id` BIGINT NOT NULL,
    `security_id` BIGINT NOT NULL,
    `weight` DECIMAL(20, 10) NOT NULL,
    `shares` DECIMAL(30, 10) NULL,
    `effective_date` DATE NOT NULL,
    `end_date` DATE NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `index_values` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `index_id` BIGINT NOT NULL,
    `value` DECIMAL(30, 10) NOT NULL,
    `change` DECIMAL(30, 10) NULL,
    `change_percent` DECIMAL(30, 10) NULL,
    `timestamp` DATETIME(6) NOT NULL,

    UNIQUE INDEX `index_values_index_id_timestamp_key`(`index_id`, `timestamp`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `foreign_investors` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `investor_id` BIGINT NOT NULL,
    `country` VARCHAR(100) NOT NULL,
    `investor_category` VARCHAR(100) NULL,
    `license_no` VARCHAR(100) NULL,
    `status` VARCHAR(50) NOT NULL DEFAULT 'ACTIVE',

    UNIQUE INDEX `foreign_investors_investor_id_key`(`investor_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `foreign_limits` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `security_id` BIGINT NOT NULL,
    `country` VARCHAR(100) NULL,
    `max_percentage` DECIMAL(20, 10) NULL,
    `max_quantity` DECIMAL(30, 10) NULL,
    `effective_from` DATE NOT NULL,
    `effective_to` DATE NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `foreign_positions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `foreign_investor_id` BIGINT NOT NULL,
    `security_id` BIGINT NOT NULL,
    `quantity` DECIMAL(30, 10) NOT NULL,
    `as_of_date` DATE NOT NULL,

    UNIQUE INDEX `foreign_positions_foreign_investor_id_security_id_as_of_date_key`(`foreign_investor_id`, `security_id`, `as_of_date`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `disclosures` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `issuer_id` BIGINT NOT NULL,
    `security_id` BIGINT NULL,
    `disclosure_type` VARCHAR(100) NOT NULL,
    `title` VARCHAR(500) NOT NULL,
    `content` TEXT NULL,
    `announcement_date` DATE NOT NULL,
    `status` ENUM('DRAFT', 'SUBMITTED', 'APPROVED', 'PUBLISHED', 'REJECTED', 'WITHDRAWN') NOT NULL DEFAULT 'DRAFT',
    `published_at` DATETIME(6) NULL,
    `created_by` BIGINT NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `disclosure_documents` (
    `disclosure_id` BIGINT NOT NULL,
    `document_id` BIGINT NOT NULL,

    PRIMARY KEY (`disclosure_id`, `document_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `surveillance_rules` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `rule_code` VARCHAR(100) NOT NULL,
    `name` VARCHAR(300) NOT NULL,
    `rule_type` VARCHAR(100) NOT NULL,
    `parameters` JSON NOT NULL,
    `threshold` DECIMAL(30, 10) NULL,
    `status` VARCHAR(50) NOT NULL DEFAULT 'ACTIVE',

    UNIQUE INDEX `surveillance_rules_rule_code_key`(`rule_code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `surveillance_alerts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `rule_id` BIGINT NOT NULL,
    `security_id` BIGINT NULL,
    `account_id` BIGINT NULL,
    `trade_id` BIGINT NULL,
    `severity` ENUM('LOW', 'MEDIUM', 'HIGH', 'CRITICAL') NOT NULL,
    `score` DECIMAL(30, 10) NULL,
    `detected_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `status` ENUM('OPEN', 'REVIEWING', 'ESCALATED', 'CLOSED', 'FALSE_POSITIVE') NOT NULL DEFAULT 'OPEN',
    `description` TEXT NULL,

    INDEX `idx_surveillance_alerts_status`(`status`, `severity`),
    INDEX `idx_surveillance_alerts_security`(`security_id`, `detected_at`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `surveillance_cases` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `case_no` VARCHAR(100) NOT NULL,
    `alert_id` BIGINT NULL,
    `case_type` VARCHAR(100) NOT NULL,
    `priority` ENUM('LOW', 'MEDIUM', 'HIGH', 'CRITICAL') NOT NULL,
    `assigned_to` BIGINT NULL,
    `status` ENUM('OPEN', 'INVESTIGATING', 'ESCALATED', 'CLOSED') NOT NULL DEFAULT 'OPEN',
    `opened_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `closed_at` DATETIME(6) NULL,

    UNIQUE INDEX `surveillance_cases_case_no_key`(`case_no`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `case_actions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `case_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `action` VARCHAR(200) NOT NULL,
    `comment` TEXT NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `audit_logs` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `action` VARCHAR(100) NOT NULL,
    `entity_type` VARCHAR(100) NOT NULL,
    `entity_id` VARCHAR(100) NULL,
    `old_value` JSON NULL,
    `new_value` JSON NULL,
    `ip_address` VARCHAR(45) NULL,
    `user_agent` TEXT NULL,
    `request_id` VARCHAR(100) NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),

    INDEX `idx_audit_logs_entity`(`entity_type`, `entity_id`, `created_at`),
    INDEX `idx_audit_logs_user`(`user_id`, `created_at`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `api_idempotency_keys` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `idempotency_key` VARCHAR(255) NOT NULL,
    `endpoint` VARCHAR(500) NOT NULL,
    `request_hash` VARCHAR(255) NULL,
    `response_status` INTEGER NULL,
    `response_body` JSON NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `expires_at` DATETIME(6) NULL,

    UNIQUE INDEX `api_idempotency_keys_idempotency_key_key`(`idempotency_key`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `system_events` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `event_id` CHAR(36) NOT NULL,
    `event_type` VARCHAR(200) NOT NULL,
    `aggregate_type` VARCHAR(100) NULL,
    `aggregate_id` VARCHAR(100) NULL,
    `payload` JSON NOT NULL,
    `occurred_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `published_at` DATETIME(6) NULL,

    UNIQUE INDEX `system_events_event_id_key`(`event_id`),
    INDEX `idx_system_events_type_time`(`event_type`, `occurred_at`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `user_roles` ADD CONSTRAINT `user_roles_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `user_roles` ADD CONSTRAINT `user_roles_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `role_permissions` ADD CONSTRAINT `role_permissions_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `role_permissions` ADD CONSTRAINT `role_permissions_permission_id_fkey` FOREIGN KEY (`permission_id`) REFERENCES `permissions`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `listing_applications` ADD CONSTRAINT `listing_applications_issuer_id_fkey` FOREIGN KEY (`issuer_id`) REFERENCES `issuers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `listing_applications` ADD CONSTRAINT `listing_applications_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `listing_applications` ADD CONSTRAINT `listing_applications_approved_by_fkey` FOREIGN KEY (`approved_by`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `application_reviews` ADD CONSTRAINT `application_reviews_application_id_fkey` FOREIGN KEY (`application_id`) REFERENCES `listing_applications`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `application_reviews` ADD CONSTRAINT `application_reviews_reviewer_id_fkey` FOREIGN KEY (`reviewer_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `application_status_history` ADD CONSTRAINT `application_status_history_application_id_fkey` FOREIGN KEY (`application_id`) REFERENCES `listing_applications`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `application_status_history` ADD CONSTRAINT `application_status_history_changed_by_fkey` FOREIGN KEY (`changed_by`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `documents` ADD CONSTRAINT `documents_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `document_versions` ADD CONSTRAINT `document_versions_document_id_fkey` FOREIGN KEY (`document_id`) REFERENCES `documents`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `document_versions` ADD CONSTRAINT `document_versions_uploaded_by_fkey` FOREIGN KEY (`uploaded_by`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `application_documents` ADD CONSTRAINT `application_documents_application_id_fkey` FOREIGN KEY (`application_id`) REFERENCES `listing_applications`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `application_documents` ADD CONSTRAINT `application_documents_document_id_fkey` FOREIGN KEY (`document_id`) REFERENCES `documents`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `securities` ADD CONSTRAINT `securities_issuer_id_fkey` FOREIGN KEY (`issuer_id`) REFERENCES `issuers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `security_versions` ADD CONSTRAINT `security_versions_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `security_versions` ADD CONSTRAINT `security_versions_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `security_boards` ADD CONSTRAINT `security_boards_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `security_boards` ADD CONSTRAINT `security_boards_board_id_fkey` FOREIGN KEY (`board_id`) REFERENCES `boards`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `trading_rules` ADD CONSTRAINT `trading_rules_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `bond_details` ADD CONSTRAINT `bond_details_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `member_users` ADD CONSTRAINT `member_users_member_id_fkey` FOREIGN KEY (`member_id`) REFERENCES `members`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `member_users` ADD CONSTRAINT `member_users_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `member_accounts` ADD CONSTRAINT `member_accounts_member_id_fkey` FOREIGN KEY (`member_id`) REFERENCES `members`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `investor_kyc` ADD CONSTRAINT `investor_kyc_investor_id_fkey` FOREIGN KEY (`investor_id`) REFERENCES `investors`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `investor_kyc` ADD CONSTRAINT `investor_kyc_verified_by_fkey` FOREIGN KEY (`verified_by`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `trading_accounts` ADD CONSTRAINT `trading_accounts_investor_id_fkey` FOREIGN KEY (`investor_id`) REFERENCES `investors`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `trading_accounts` ADD CONSTRAINT `trading_accounts_member_id_fkey` FOREIGN KEY (`member_id`) REFERENCES `members`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cash_accounts` ADD CONSTRAINT `cash_accounts_trading_account_id_fkey` FOREIGN KEY (`trading_account_id`) REFERENCES `trading_accounts`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `securities_accounts` ADD CONSTRAINT `securities_accounts_trading_account_id_fkey` FOREIGN KEY (`trading_account_id`) REFERENCES `trading_accounts`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `trading_sessions` ADD CONSTRAINT `trading_sessions_board_id_fkey` FOREIGN KEY (`board_id`) REFERENCES `boards`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `trading_halts` ADD CONSTRAINT `trading_halts_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `trading_halts` ADD CONSTRAINT `trading_halts_session_id_fkey` FOREIGN KEY (`session_id`) REFERENCES `trading_sessions`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `orders_trading_account_id_fkey` FOREIGN KEY (`trading_account_id`) REFERENCES `trading_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `orders_member_id_fkey` FOREIGN KEY (`member_id`) REFERENCES `members`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `orders_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `orders_session_id_fkey` FOREIGN KEY (`session_id`) REFERENCES `trading_sessions`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `order_events` ADD CONSTRAINT `order_events_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `order_amendments` ADD CONSTRAINT `order_amendments_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `order_amendments` ADD CONSTRAINT `order_amendments_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `order_books` ADD CONSTRAINT `order_books_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `order_books` ADD CONSTRAINT `order_books_trading_session_id_fkey` FOREIGN KEY (`trading_session_id`) REFERENCES `trading_sessions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `executions` ADD CONSTRAINT `executions_buy_order_id_fkey` FOREIGN KEY (`buy_order_id`) REFERENCES `orders`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `executions` ADD CONSTRAINT `executions_sell_order_id_fkey` FOREIGN KEY (`sell_order_id`) REFERENCES `orders`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `executions` ADD CONSTRAINT `executions_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `trades` ADD CONSTRAINT `trades_execution_id_fkey` FOREIGN KEY (`execution_id`) REFERENCES `executions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `trades` ADD CONSTRAINT `trades_buy_account_id_fkey` FOREIGN KEY (`buy_account_id`) REFERENCES `trading_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `trades` ADD CONSTRAINT `trades_sell_account_id_fkey` FOREIGN KEY (`sell_account_id`) REFERENCES `trading_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `trades` ADD CONSTRAINT `trades_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `trade_fees` ADD CONSTRAINT `trade_fees_trade_id_fkey` FOREIGN KEY (`trade_id`) REFERENCES `trades`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `market_ticks` ADD CONSTRAINT `market_ticks_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `market_ticks` ADD CONSTRAINT `market_ticks_trade_id_fkey` FOREIGN KEY (`trade_id`) REFERENCES `trades`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `market_ohlcv` ADD CONSTRAINT `market_ohlcv_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `order_book_snapshots` ADD CONSTRAINT `order_book_snapshots_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `order_book_levels` ADD CONSTRAINT `order_book_levels_snapshot_id_fkey` FOREIGN KEY (`snapshot_id`) REFERENCES `order_book_snapshots`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `settlement_obligations` ADD CONSTRAINT `settlement_obligations_trade_id_fkey` FOREIGN KEY (`trade_id`) REFERENCES `trades`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `settlement_obligations` ADD CONSTRAINT `settlement_obligations_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `trading_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `settlement_obligations` ADD CONSTRAINT `settlement_obligations_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `settlement_instructions` ADD CONSTRAINT `settlement_instructions_obligation_id_fkey` FOREIGN KEY (`obligation_id`) REFERENCES `settlement_obligations`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `settlement_instructions` ADD CONSTRAINT `settlement_instructions_delivery_account_id_fkey` FOREIGN KEY (`delivery_account_id`) REFERENCES `securities_accounts`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `settlement_instructions` ADD CONSTRAINT `settlement_instructions_receive_account_id_fkey` FOREIGN KEY (`receive_account_id`) REFERENCES `securities_accounts`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `settlement_failures` ADD CONSTRAINT `settlement_failures_instruction_id_fkey` FOREIGN KEY (`instruction_id`) REFERENCES `settlement_instructions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `securities_holdings` ADD CONSTRAINT `securities_holdings_securities_account_id_fkey` FOREIGN KEY (`securities_account_id`) REFERENCES `securities_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `securities_holdings` ADD CONSTRAINT `securities_holdings_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `securities_transactions` ADD CONSTRAINT `securities_transactions_securities_account_id_fkey` FOREIGN KEY (`securities_account_id`) REFERENCES `securities_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `securities_transactions` ADD CONSTRAINT `securities_transactions_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `security_transfers` ADD CONSTRAINT `security_transfers_from_account_id_fkey` FOREIGN KEY (`from_account_id`) REFERENCES `securities_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `security_transfers` ADD CONSTRAINT `security_transfers_to_account_id_fkey` FOREIGN KEY (`to_account_id`) REFERENCES `securities_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `security_transfers` ADD CONSTRAINT `security_transfers_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pledges` ADD CONSTRAINT `pledges_securities_account_id_fkey` FOREIGN KEY (`securities_account_id`) REFERENCES `securities_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pledges` ADD CONSTRAINT `pledges_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `journal_entries` ADD CONSTRAINT `journal_entries_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `journal_lines` ADD CONSTRAINT `journal_lines_journal_entry_id_fkey` FOREIGN KEY (`journal_entry_id`) REFERENCES `journal_entries`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `journal_lines` ADD CONSTRAINT `journal_lines_ledger_account_id_fkey` FOREIGN KEY (`ledger_account_id`) REFERENCES `ledger_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `corporate_actions` ADD CONSTRAINT `corporate_actions_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `corporate_action_entitlements` ADD CONSTRAINT `corporate_action_entitlements_corporate_action_id_fkey` FOREIGN KEY (`corporate_action_id`) REFERENCES `corporate_actions`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `corporate_action_entitlements` ADD CONSTRAINT `corporate_action_entitlements_securities_account_id_fkey` FOREIGN KEY (`securities_account_id`) REFERENCES `securities_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `corporate_action_payments` ADD CONSTRAINT `corporate_action_payments_entitlement_id_fkey` FOREIGN KEY (`entitlement_id`) REFERENCES `corporate_action_entitlements`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `dividends` ADD CONSTRAINT `dividends_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `index_constituents` ADD CONSTRAINT `index_constituents_index_id_fkey` FOREIGN KEY (`index_id`) REFERENCES `indices`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `index_constituents` ADD CONSTRAINT `index_constituents_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `index_values` ADD CONSTRAINT `index_values_index_id_fkey` FOREIGN KEY (`index_id`) REFERENCES `indices`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `foreign_investors` ADD CONSTRAINT `foreign_investors_investor_id_fkey` FOREIGN KEY (`investor_id`) REFERENCES `investors`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `foreign_limits` ADD CONSTRAINT `foreign_limits_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `foreign_positions` ADD CONSTRAINT `foreign_positions_foreign_investor_id_fkey` FOREIGN KEY (`foreign_investor_id`) REFERENCES `foreign_investors`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `foreign_positions` ADD CONSTRAINT `foreign_positions_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `disclosures` ADD CONSTRAINT `disclosures_issuer_id_fkey` FOREIGN KEY (`issuer_id`) REFERENCES `issuers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `disclosures` ADD CONSTRAINT `disclosures_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `disclosures` ADD CONSTRAINT `disclosures_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `disclosure_documents` ADD CONSTRAINT `disclosure_documents_disclosure_id_fkey` FOREIGN KEY (`disclosure_id`) REFERENCES `disclosures`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `disclosure_documents` ADD CONSTRAINT `disclosure_documents_document_id_fkey` FOREIGN KEY (`document_id`) REFERENCES `documents`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `surveillance_alerts` ADD CONSTRAINT `surveillance_alerts_rule_id_fkey` FOREIGN KEY (`rule_id`) REFERENCES `surveillance_rules`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `surveillance_alerts` ADD CONSTRAINT `surveillance_alerts_security_id_fkey` FOREIGN KEY (`security_id`) REFERENCES `securities`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `surveillance_alerts` ADD CONSTRAINT `surveillance_alerts_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `trading_accounts`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `surveillance_alerts` ADD CONSTRAINT `surveillance_alerts_trade_id_fkey` FOREIGN KEY (`trade_id`) REFERENCES `trades`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `surveillance_cases` ADD CONSTRAINT `surveillance_cases_alert_id_fkey` FOREIGN KEY (`alert_id`) REFERENCES `surveillance_alerts`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `surveillance_cases` ADD CONSTRAINT `surveillance_cases_assigned_to_fkey` FOREIGN KEY (`assigned_to`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `case_actions` ADD CONSTRAINT `case_actions_case_id_fkey` FOREIGN KEY (`case_id`) REFERENCES `surveillance_cases`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `case_actions` ADD CONSTRAINT `case_actions_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `audit_logs` ADD CONSTRAINT `audit_logs_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
