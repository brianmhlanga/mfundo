/*
  Warnings:

  - Added the required column `exam_id` to the `QuestionAnswers` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `questionanswers` ADD COLUMN `exam_id` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `QuestionAnswers` ADD CONSTRAINT `QuestionAnswers_exam_id_fkey` FOREIGN KEY (`exam_id`) REFERENCES `Exam`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
