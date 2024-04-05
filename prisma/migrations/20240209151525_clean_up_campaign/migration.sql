/*
  Warnings:

  - You are about to drop the `applications` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `questionaire` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `questionaireanswers` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `exam_time` to the `Exam` table without a default value. This is not possible if the table is not empty.
  - Added the required column `subject_id` to the `Exam` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `applications` DROP FOREIGN KEY `Applications_applicantId_fkey`;

-- DropForeignKey
ALTER TABLE `applications` DROP FOREIGN KEY `Applications_postingId_fkey`;

-- DropForeignKey
ALTER TABLE `questionaire` DROP FOREIGN KEY `Questionaire_exam_id_fkey`;

-- DropForeignKey
ALTER TABLE `questionaire` DROP FOREIGN KEY `Questionaire_postingId_fkey`;

-- DropForeignKey
ALTER TABLE `questionaireanswers` DROP FOREIGN KEY `QuestionaireAnswers_postingId_fkey`;

-- AlterTable
ALTER TABLE `exam` ADD COLUMN `exam_time` DATETIME(3) NOT NULL,
    ADD COLUMN `subject_id` VARCHAR(191) NOT NULL;

-- DropTable
DROP TABLE `applications`;

-- DropTable
DROP TABLE `questionaire`;

-- DropTable
DROP TABLE `questionaireanswers`;

-- CreateTable
CREATE TABLE `Questions` (
    `id` VARCHAR(191) NOT NULL,
    `question_type` VARCHAR(191) NOT NULL,
    `options` JSON NULL,
    `score` INTEGER NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `created_by_name` VARCHAR(191) NULL,
    `created_by_id` INTEGER NULL,
    `boolean_answer` BOOLEAN NULL,
    `multichoice_answer` VARCHAR(191) NULL,
    `question` VARCHAR(10000) NOT NULL,
    `student_boolean_answer` BOOLEAN NULL,
    `student_multichoice_answer` VARCHAR(191) NULL,
    `student_unstructured_answer` VARCHAR(191) NULL,
    `exam_id` VARCHAR(191) NOT NULL,
    `correct` BOOLEAN NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `QuestionAnswers` (
    `id` VARCHAR(191) NOT NULL,
    `question` VARCHAR(10000) NOT NULL,
    `question_id` VARCHAR(191) NOT NULL,
    `question_type` VARCHAR(191) NOT NULL,
    `multichoice_answer` VARCHAR(191) NULL,
    `boolean_answer` BOOLEAN NULL,
    `options` JSON NULL,
    `score` INTEGER NULL,
    `student_boolean_answer` BOOLEAN NULL,
    `student_multichoice_answer` VARCHAR(191) NULL,
    `student_id` VARCHAR(191) NOT NULL,
    `student_unstructured_answer` VARCHAR(191) NULL,
    `correct` BOOLEAN NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `created_by_name` VARCHAR(191) NULL,
    `created_by_id` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Exam` ADD CONSTRAINT `Exam_subject_id_fkey` FOREIGN KEY (`subject_id`) REFERENCES `Subject`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Questions` ADD CONSTRAINT `Questions_exam_id_fkey` FOREIGN KEY (`exam_id`) REFERENCES `Exam`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QuestionAnswers` ADD CONSTRAINT `QuestionAnswers_question_id_fkey` FOREIGN KEY (`question_id`) REFERENCES `Questions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QuestionAnswers` ADD CONSTRAINT `QuestionAnswers_student_id_fkey` FOREIGN KEY (`student_id`) REFERENCES `Student`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
