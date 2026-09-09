/*
  Warnings:

  - You are about to drop the `api_idempotency_keys` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `application_documents` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `application_reviews` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `application_status_history` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `audit_logs` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `boards` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `bond_details` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `case_actions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cash_accounts` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `corporate_action_entitlements` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `corporate_action_payments` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `corporate_actions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `disclosure_documents` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `disclosures` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `dividends` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `document_versions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `documents` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `executions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `foreign_investors` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `foreign_limits` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `foreign_positions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `index_constituents` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `index_values` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `indices` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `investor_kyc` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `investors` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `issuers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `journal_entries` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `journal_lines` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ledger_accounts` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `listing_applications` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `market_ohlcv` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `market_ticks` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `member_accounts` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `member_users` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `members` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `order_amendments` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `order_book_levels` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `order_book_snapshots` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `order_books` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `order_events` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `orders` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `permissions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `pledges` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `reconciliations` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `role_permissions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `roles` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `securities` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `securities_accounts` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `securities_holdings` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `securities_transactions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `security_boards` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `security_transfers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `security_versions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `settlement_batches` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `settlement_failures` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `settlement_instructions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `settlement_obligations` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `surveillance_alerts` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `surveillance_cases` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `surveillance_rules` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `system_events` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `trade_fees` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `trades` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `trading_accounts` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `trading_halts` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `trading_rules` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `trading_sessions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user_roles` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `application_documents` DROP FOREIGN KEY `application_documents_application_id_fkey`;

-- DropForeignKey
ALTER TABLE `application_documents` DROP FOREIGN KEY `application_documents_document_id_fkey`;

-- DropForeignKey
ALTER TABLE `application_reviews` DROP FOREIGN KEY `application_reviews_application_id_fkey`;

-- DropForeignKey
ALTER TABLE `application_reviews` DROP FOREIGN KEY `application_reviews_reviewer_id_fkey`;

-- DropForeignKey
ALTER TABLE `application_status_history` DROP FOREIGN KEY `application_status_history_application_id_fkey`;

-- DropForeignKey
ALTER TABLE `application_status_history` DROP FOREIGN KEY `application_status_history_changed_by_fkey`;

-- DropForeignKey
ALTER TABLE `audit_logs` DROP FOREIGN KEY `audit_logs_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `bond_details` DROP FOREIGN KEY `bond_details_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `case_actions` DROP FOREIGN KEY `case_actions_case_id_fkey`;

-- DropForeignKey
ALTER TABLE `case_actions` DROP FOREIGN KEY `case_actions_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `cash_accounts` DROP FOREIGN KEY `cash_accounts_trading_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `corporate_action_entitlements` DROP FOREIGN KEY `corporate_action_entitlements_corporate_action_id_fkey`;

-- DropForeignKey
ALTER TABLE `corporate_action_entitlements` DROP FOREIGN KEY `corporate_action_entitlements_securities_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `corporate_action_payments` DROP FOREIGN KEY `corporate_action_payments_entitlement_id_fkey`;

-- DropForeignKey
ALTER TABLE `corporate_actions` DROP FOREIGN KEY `corporate_actions_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `disclosure_documents` DROP FOREIGN KEY `disclosure_documents_disclosure_id_fkey`;

-- DropForeignKey
ALTER TABLE `disclosure_documents` DROP FOREIGN KEY `disclosure_documents_document_id_fkey`;

-- DropForeignKey
ALTER TABLE `disclosures` DROP FOREIGN KEY `disclosures_created_by_fkey`;

-- DropForeignKey
ALTER TABLE `disclosures` DROP FOREIGN KEY `disclosures_issuer_id_fkey`;

-- DropForeignKey
ALTER TABLE `disclosures` DROP FOREIGN KEY `disclosures_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `dividends` DROP FOREIGN KEY `dividends_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `document_versions` DROP FOREIGN KEY `document_versions_document_id_fkey`;

-- DropForeignKey
ALTER TABLE `document_versions` DROP FOREIGN KEY `document_versions_uploaded_by_fkey`;

-- DropForeignKey
ALTER TABLE `documents` DROP FOREIGN KEY `documents_created_by_fkey`;

-- DropForeignKey
ALTER TABLE `executions` DROP FOREIGN KEY `executions_buy_order_id_fkey`;

-- DropForeignKey
ALTER TABLE `executions` DROP FOREIGN KEY `executions_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `executions` DROP FOREIGN KEY `executions_sell_order_id_fkey`;

-- DropForeignKey
ALTER TABLE `foreign_investors` DROP FOREIGN KEY `foreign_investors_investor_id_fkey`;

-- DropForeignKey
ALTER TABLE `foreign_limits` DROP FOREIGN KEY `foreign_limits_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `foreign_positions` DROP FOREIGN KEY `foreign_positions_foreign_investor_id_fkey`;

-- DropForeignKey
ALTER TABLE `foreign_positions` DROP FOREIGN KEY `foreign_positions_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `index_constituents` DROP FOREIGN KEY `index_constituents_index_id_fkey`;

-- DropForeignKey
ALTER TABLE `index_constituents` DROP FOREIGN KEY `index_constituents_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `index_values` DROP FOREIGN KEY `index_values_index_id_fkey`;

-- DropForeignKey
ALTER TABLE `investor_kyc` DROP FOREIGN KEY `investor_kyc_investor_id_fkey`;

-- DropForeignKey
ALTER TABLE `investor_kyc` DROP FOREIGN KEY `investor_kyc_verified_by_fkey`;

-- DropForeignKey
ALTER TABLE `journal_entries` DROP FOREIGN KEY `journal_entries_created_by_fkey`;

-- DropForeignKey
ALTER TABLE `journal_lines` DROP FOREIGN KEY `journal_lines_journal_entry_id_fkey`;

-- DropForeignKey
ALTER TABLE `journal_lines` DROP FOREIGN KEY `journal_lines_ledger_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `listing_applications` DROP FOREIGN KEY `listing_applications_approved_by_fkey`;

-- DropForeignKey
ALTER TABLE `listing_applications` DROP FOREIGN KEY `listing_applications_created_by_fkey`;

-- DropForeignKey
ALTER TABLE `listing_applications` DROP FOREIGN KEY `listing_applications_issuer_id_fkey`;

-- DropForeignKey
ALTER TABLE `market_ohlcv` DROP FOREIGN KEY `market_ohlcv_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `market_ticks` DROP FOREIGN KEY `market_ticks_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `market_ticks` DROP FOREIGN KEY `market_ticks_trade_id_fkey`;

-- DropForeignKey
ALTER TABLE `member_accounts` DROP FOREIGN KEY `member_accounts_member_id_fkey`;

-- DropForeignKey
ALTER TABLE `member_users` DROP FOREIGN KEY `member_users_member_id_fkey`;

-- DropForeignKey
ALTER TABLE `member_users` DROP FOREIGN KEY `member_users_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `order_amendments` DROP FOREIGN KEY `order_amendments_created_by_fkey`;

-- DropForeignKey
ALTER TABLE `order_amendments` DROP FOREIGN KEY `order_amendments_order_id_fkey`;

-- DropForeignKey
ALTER TABLE `order_book_levels` DROP FOREIGN KEY `order_book_levels_snapshot_id_fkey`;

-- DropForeignKey
ALTER TABLE `order_book_snapshots` DROP FOREIGN KEY `order_book_snapshots_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `order_books` DROP FOREIGN KEY `order_books_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `order_books` DROP FOREIGN KEY `order_books_trading_session_id_fkey`;

-- DropForeignKey
ALTER TABLE `order_events` DROP FOREIGN KEY `order_events_order_id_fkey`;

-- DropForeignKey
ALTER TABLE `orders` DROP FOREIGN KEY `orders_member_id_fkey`;

-- DropForeignKey
ALTER TABLE `orders` DROP FOREIGN KEY `orders_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `orders` DROP FOREIGN KEY `orders_session_id_fkey`;

-- DropForeignKey
ALTER TABLE `orders` DROP FOREIGN KEY `orders_trading_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `pledges` DROP FOREIGN KEY `pledges_securities_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `pledges` DROP FOREIGN KEY `pledges_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `role_permissions` DROP FOREIGN KEY `role_permissions_permission_id_fkey`;

-- DropForeignKey
ALTER TABLE `role_permissions` DROP FOREIGN KEY `role_permissions_role_id_fkey`;

-- DropForeignKey
ALTER TABLE `securities` DROP FOREIGN KEY `securities_issuer_id_fkey`;

-- DropForeignKey
ALTER TABLE `securities_accounts` DROP FOREIGN KEY `securities_accounts_trading_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `securities_holdings` DROP FOREIGN KEY `securities_holdings_securities_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `securities_holdings` DROP FOREIGN KEY `securities_holdings_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `securities_transactions` DROP FOREIGN KEY `securities_transactions_securities_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `securities_transactions` DROP FOREIGN KEY `securities_transactions_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `security_boards` DROP FOREIGN KEY `security_boards_board_id_fkey`;

-- DropForeignKey
ALTER TABLE `security_boards` DROP FOREIGN KEY `security_boards_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `security_transfers` DROP FOREIGN KEY `security_transfers_from_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `security_transfers` DROP FOREIGN KEY `security_transfers_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `security_transfers` DROP FOREIGN KEY `security_transfers_to_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `security_versions` DROP FOREIGN KEY `security_versions_created_by_fkey`;

-- DropForeignKey
ALTER TABLE `security_versions` DROP FOREIGN KEY `security_versions_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `settlement_failures` DROP FOREIGN KEY `settlement_failures_instruction_id_fkey`;

-- DropForeignKey
ALTER TABLE `settlement_instructions` DROP FOREIGN KEY `settlement_instructions_delivery_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `settlement_instructions` DROP FOREIGN KEY `settlement_instructions_obligation_id_fkey`;

-- DropForeignKey
ALTER TABLE `settlement_instructions` DROP FOREIGN KEY `settlement_instructions_receive_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `settlement_obligations` DROP FOREIGN KEY `settlement_obligations_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `settlement_obligations` DROP FOREIGN KEY `settlement_obligations_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `settlement_obligations` DROP FOREIGN KEY `settlement_obligations_trade_id_fkey`;

-- DropForeignKey
ALTER TABLE `surveillance_alerts` DROP FOREIGN KEY `surveillance_alerts_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `surveillance_alerts` DROP FOREIGN KEY `surveillance_alerts_rule_id_fkey`;

-- DropForeignKey
ALTER TABLE `surveillance_alerts` DROP FOREIGN KEY `surveillance_alerts_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `surveillance_alerts` DROP FOREIGN KEY `surveillance_alerts_trade_id_fkey`;

-- DropForeignKey
ALTER TABLE `surveillance_cases` DROP FOREIGN KEY `surveillance_cases_alert_id_fkey`;

-- DropForeignKey
ALTER TABLE `surveillance_cases` DROP FOREIGN KEY `surveillance_cases_assigned_to_fkey`;

-- DropForeignKey
ALTER TABLE `trade_fees` DROP FOREIGN KEY `trade_fees_trade_id_fkey`;

-- DropForeignKey
ALTER TABLE `trades` DROP FOREIGN KEY `trades_buy_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `trades` DROP FOREIGN KEY `trades_execution_id_fkey`;

-- DropForeignKey
ALTER TABLE `trades` DROP FOREIGN KEY `trades_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `trades` DROP FOREIGN KEY `trades_sell_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `trading_accounts` DROP FOREIGN KEY `trading_accounts_investor_id_fkey`;

-- DropForeignKey
ALTER TABLE `trading_accounts` DROP FOREIGN KEY `trading_accounts_member_id_fkey`;

-- DropForeignKey
ALTER TABLE `trading_halts` DROP FOREIGN KEY `trading_halts_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `trading_halts` DROP FOREIGN KEY `trading_halts_session_id_fkey`;

-- DropForeignKey
ALTER TABLE `trading_rules` DROP FOREIGN KEY `trading_rules_security_id_fkey`;

-- DropForeignKey
ALTER TABLE `trading_sessions` DROP FOREIGN KEY `trading_sessions_board_id_fkey`;

-- DropForeignKey
ALTER TABLE `user_roles` DROP FOREIGN KEY `user_roles_role_id_fkey`;

-- DropForeignKey
ALTER TABLE `user_roles` DROP FOREIGN KEY `user_roles_user_id_fkey`;

-- DropTable
DROP TABLE `api_idempotency_keys`;

-- DropTable
DROP TABLE `application_documents`;

-- DropTable
DROP TABLE `application_reviews`;

-- DropTable
DROP TABLE `application_status_history`;

-- DropTable
DROP TABLE `audit_logs`;

-- DropTable
DROP TABLE `boards`;

-- DropTable
DROP TABLE `bond_details`;

-- DropTable
DROP TABLE `case_actions`;

-- DropTable
DROP TABLE `cash_accounts`;

-- DropTable
DROP TABLE `corporate_action_entitlements`;

-- DropTable
DROP TABLE `corporate_action_payments`;

-- DropTable
DROP TABLE `corporate_actions`;

-- DropTable
DROP TABLE `disclosure_documents`;

-- DropTable
DROP TABLE `disclosures`;

-- DropTable
DROP TABLE `dividends`;

-- DropTable
DROP TABLE `document_versions`;

-- DropTable
DROP TABLE `documents`;

-- DropTable
DROP TABLE `executions`;

-- DropTable
DROP TABLE `foreign_investors`;

-- DropTable
DROP TABLE `foreign_limits`;

-- DropTable
DROP TABLE `foreign_positions`;

-- DropTable
DROP TABLE `index_constituents`;

-- DropTable
DROP TABLE `index_values`;

-- DropTable
DROP TABLE `indices`;

-- DropTable
DROP TABLE `investor_kyc`;

-- DropTable
DROP TABLE `investors`;

-- DropTable
DROP TABLE `issuers`;

-- DropTable
DROP TABLE `journal_entries`;

-- DropTable
DROP TABLE `journal_lines`;

-- DropTable
DROP TABLE `ledger_accounts`;

-- DropTable
DROP TABLE `listing_applications`;

-- DropTable
DROP TABLE `market_ohlcv`;

-- DropTable
DROP TABLE `market_ticks`;

-- DropTable
DROP TABLE `member_accounts`;

-- DropTable
DROP TABLE `member_users`;

-- DropTable
DROP TABLE `members`;

-- DropTable
DROP TABLE `order_amendments`;

-- DropTable
DROP TABLE `order_book_levels`;

-- DropTable
DROP TABLE `order_book_snapshots`;

-- DropTable
DROP TABLE `order_books`;

-- DropTable
DROP TABLE `order_events`;

-- DropTable
DROP TABLE `orders`;

-- DropTable
DROP TABLE `permissions`;

-- DropTable
DROP TABLE `pledges`;

-- DropTable
DROP TABLE `reconciliations`;

-- DropTable
DROP TABLE `role_permissions`;

-- DropTable
DROP TABLE `roles`;

-- DropTable
DROP TABLE `securities`;

-- DropTable
DROP TABLE `securities_accounts`;

-- DropTable
DROP TABLE `securities_holdings`;

-- DropTable
DROP TABLE `securities_transactions`;

-- DropTable
DROP TABLE `security_boards`;

-- DropTable
DROP TABLE `security_transfers`;

-- DropTable
DROP TABLE `security_versions`;

-- DropTable
DROP TABLE `settlement_batches`;

-- DropTable
DROP TABLE `settlement_failures`;

-- DropTable
DROP TABLE `settlement_instructions`;

-- DropTable
DROP TABLE `settlement_obligations`;

-- DropTable
DROP TABLE `surveillance_alerts`;

-- DropTable
DROP TABLE `surveillance_cases`;

-- DropTable
DROP TABLE `surveillance_rules`;

-- DropTable
DROP TABLE `system_events`;

-- DropTable
DROP TABLE `trade_fees`;

-- DropTable
DROP TABLE `trades`;

-- DropTable
DROP TABLE `trading_accounts`;

-- DropTable
DROP TABLE `trading_halts`;

-- DropTable
DROP TABLE `trading_rules`;

-- DropTable
DROP TABLE `trading_sessions`;

-- DropTable
DROP TABLE `user_roles`;

-- DropTable
DROP TABLE `users`;

-- CreateTable
CREATE TABLE `User` (
    `user_id` VARCHAR(36) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `phoneNumber` INTEGER NOT NULL,
    `profile` VARCHAR(191) NULL,
    `role` VARCHAR(191) NOT NULL DEFAULT 'general',
    `active` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Order` (
    `order_id` VARCHAR(36) NOT NULL,
    `userId` VARCHAR(36) NOT NULL,
    `totalPrice` INTEGER NOT NULL,
    `currency` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`order_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderDetail` (
    `ordrd_id` VARCHAR(36) NOT NULL,
    `orderId` VARCHAR(36) NOT NULL,
    `productId` VARCHAR(191) NOT NULL,
    `amount` INTEGER NOT NULL,
    `total` INTEGER NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`ordrd_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Category` (
    `category_id` VARCHAR(36) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `icon` VARCHAR(191) NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`category_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Product` (
    `product_id` VARCHAR(36) NOT NULL,
    `categoryId` VARCHAR(36) NOT NULL,
    `image` VARCHAR(191) NOT NULL,
    `productName` VARCHAR(191) NOT NULL,
    `productDetail` VARCHAR(191) NULL,
    `productQty` INTEGER NOT NULL,
    `productPrice` INTEGER NOT NULL,
    `barcode` VARCHAR(191) NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Product_barcode_key`(`barcode`),
    PRIMARY KEY (`product_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `HistoryInProduct` (
    `hip_id` VARCHAR(36) NOT NULL,
    `productId` VARCHAR(36) NOT NULL,
    `productName` VARCHAR(191) NOT NULL,
    `productDetail` VARCHAR(191) NULL,
    `productQty` INTEGER NOT NULL,
    `productPrice` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`hip_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Inventory` (
    `inventory_id` VARCHAR(36) NOT NULL,
    `list` VARCHAR(191) NOT NULL,
    `unit` VARCHAR(191) NOT NULL,
    `amount` INTEGER NOT NULL,
    `price` INTEGER NOT NULL,
    `totalPrice` INTEGER NOT NULL,
    `status` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`inventory_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `HistoryInInventory` (
    `id` VARCHAR(36) NOT NULL,
    `inventoryId` VARCHAR(36) NOT NULL,
    `list` VARCHAR(191) NOT NULL,
    `unit` VARCHAR(191) NOT NULL,
    `amount` INTEGER NOT NULL,
    `price` INTEGER NOT NULL,
    `totalPrice` INTEGER NOT NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Supply` (
    `supply_id` VARCHAR(36) NOT NULL,
    `company` VARCHAR(191) NOT NULL,
    `phone` INTEGER NOT NULL,
    `sellName` VARCHAR(191) NOT NULL,
    `position` VARCHAR(191) NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`supply_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Purchase` (
    `purchase_id` VARCHAR(36) NOT NULL,
    `supplyId` VARCHAR(36) NOT NULL,
    `currency` VARCHAR(191) NOT NULL,
    `expressName` VARCHAR(191) NULL,
    `expressPrice` INTEGER NOT NULL,
    `totalPrice` INTEGER NOT NULL,
    `status` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`purchase_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PurchaseDetail` (
    `pd_id` VARCHAR(36) NOT NULL,
    `purchaseId` VARCHAR(36) NOT NULL,
    `list` VARCHAR(191) NOT NULL,
    `unit` VARCHAR(191) NOT NULL,
    `amount` INTEGER NOT NULL,
    `price` INTEGER NOT NULL,
    `total` INTEGER NOT NULL,
    `status` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`pd_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Package` (
    `id` VARCHAR(36) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `timeline` VARCHAR(191) NOT NULL,
    `price` INTEGER NOT NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Customer` (
    `id` VARCHAR(36) NOT NULL,
    `fullname` VARCHAR(191) NOT NULL,
    `phone` INTEGER NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Sell` (
    `id` VARCHAR(36) NOT NULL,
    `customerId` VARCHAR(36) NOT NULL,
    `packageId` VARCHAR(36) NOT NULL,
    `discount` DOUBLE NOT NULL,
    `totalPrice` INTEGER NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SellDetail` (
    `id` VARCHAR(36) NOT NULL,
    `sellId` VARCHAR(36) NOT NULL,
    `partId` VARCHAR(36) NOT NULL,
    `amount` INTEGER NOT NULL,
    `total` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Part` (
    `id` VARCHAR(36) NOT NULL,
    `list` VARCHAR(191) NOT NULL,
    `amount` INTEGER NOT NULL,
    `price` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderDetail` ADD CONSTRAINT `OrderDetail_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Order`(`order_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Category`(`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HistoryInProduct` ADD CONSTRAINT `HistoryInProduct_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`product_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HistoryInInventory` ADD CONSTRAINT `HistoryInInventory_inventoryId_fkey` FOREIGN KEY (`inventoryId`) REFERENCES `Inventory`(`inventory_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Purchase` ADD CONSTRAINT `Purchase_supplyId_fkey` FOREIGN KEY (`supplyId`) REFERENCES `Supply`(`supply_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PurchaseDetail` ADD CONSTRAINT `PurchaseDetail_purchaseId_fkey` FOREIGN KEY (`purchaseId`) REFERENCES `Purchase`(`purchase_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Sell` ADD CONSTRAINT `Sell_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Sell` ADD CONSTRAINT `Sell_packageId_fkey` FOREIGN KEY (`packageId`) REFERENCES `Package`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SellDetail` ADD CONSTRAINT `SellDetail_sellId_fkey` FOREIGN KEY (`sellId`) REFERENCES `Sell`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SellDetail` ADD CONSTRAINT `SellDetail_partId_fkey` FOREIGN KEY (`partId`) REFERENCES `Part`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
