/*
  Warnings:

  - Added the required column `exam_id` to the `Questionaire` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `questionaire` DROP FOREIGN KEY `Questionaire_postingId_fkey`;

-- AlterTable
ALTER TABLE `questionaire` ADD COLUMN `exam_id` VARCHAR(191) NOT NULL,
    MODIFY `postingId` VARCHAR(191) NULL;

-- CreateTable
CREATE TABLE `Exam` (
    `id` VARCHAR(191) NOT NULL,
    `exam_name` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Questionaire` ADD CONSTRAINT `Questionaire_exam_id_fkey` FOREIGN KEY (`exam_id`) REFERENCES `Exam`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Questionaire` ADD CONSTRAINT `Questionaire_postingId_fkey` FOREIGN KEY (`postingId`) REFERENCES `Subject`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
