/*
  Warnings:

  - You are about to drop the column `exam_time` on the `exam` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `exam` DROP COLUMN `exam_time`,
    ADD COLUMN `exam_hours` INTEGER NOT NULL DEFAULT 0,
    ADD COLUMN `exam_minutes` INTEGER NOT NULL DEFAULT 59;
