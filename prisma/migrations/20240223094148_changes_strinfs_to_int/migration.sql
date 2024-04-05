/*
  Warnings:

  - You are about to alter the column `hours` on the `time` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - You are about to alter the column `minutes` on the `time` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - You are about to alter the column `seconds` on the `time` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.

*/
-- AlterTable
ALTER TABLE `time` MODIFY `hours` INTEGER NOT NULL,
    MODIFY `minutes` INTEGER NOT NULL,
    MODIFY `seconds` INTEGER NOT NULL;
