/*
  Warnings:

  - You are about to drop the column `exam_taken` on the `subject` table. All the data in the column will be lost.
  - You are about to drop the column `views` on the `subject` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `subject` DROP COLUMN `exam_taken`,
    DROP COLUMN `views`;
