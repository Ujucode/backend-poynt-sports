/*
  Warnings:

  - The primary key for the `BankAccountDetail` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `bank_account_id` on the `BankAccountDetail` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "BankAccountDetail" DROP CONSTRAINT "BankAccountDetail_pkey",
DROP COLUMN "bank_account_id";
