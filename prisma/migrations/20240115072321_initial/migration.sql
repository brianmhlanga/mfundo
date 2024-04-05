-- CreateTable
CREATE TABLE `user` (
    `id` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NULL,
    `title` VARCHAR(191) NULL,
    `surname` VARCHAR(191) NULL,
    `phone` VARCHAR(191) NULL,
    `age` INTEGER NULL,
    `gender` ENUM('MALE', 'FEMALE') NOT NULL,
    `profile` ENUM('ADMIN', 'STUDENT') NOT NULL DEFAULT 'ADMIN',
    `password` VARCHAR(191) NOT NULL,
    `salt` VARCHAR(191) NOT NULL,
    `current_logged_in_at` DATETIME(3) NOT NULL,
    `last_logged_in_at` DATETIME(3) NOT NULL,
    `account_status` ENUM('ACTIVE', 'INACTIVE') NOT NULL DEFAULT 'INACTIVE',
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `user_email_key`(`email`),
    UNIQUE INDEX `user_username_key`(`username`),
    UNIQUE INDEX `user_phone_key`(`phone`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Student` (
    `id` VARCHAR(191) NOT NULL,
    `portal_id` INTEGER NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(191) NULL,
    `last_name` VARCHAR(191) NULL,
    `email` VARCHAR(191) NULL,
    `phone` VARCHAR(191) NULL,
    `nationality` JSON NULL,
    `date_of_birth` DATETIME(3) NULL,
    `school` VARCHAR(191) NULL,
    `grade` VARCHAR(191) NULL,
    `profile` ENUM('ADMIN', 'STUDENT') NOT NULL DEFAULT 'STUDENT',
    `password` VARCHAR(191) NULL,
    `salt` VARCHAR(191) NULL,
    `current_logged_in_at` DATETIME(3) NULL,
    `last_logged_in_at` DATETIME(3) NULL,

    UNIQUE INDEX `Student_id_key`(`id`),
    UNIQUE INDEX `Student_portal_id_key`(`portal_id`),
    UNIQUE INDEX `Student_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Applications` (
    `id` VARCHAR(191) NOT NULL,
    `exam_status` BOOLEAN NULL DEFAULT false,
    `postingId` VARCHAR(191) NULL,
    `applicantId` VARCHAR(191) NULL,
    `status` ENUM('NOT_TAKEN', 'PASS', 'FAILED') NOT NULL DEFAULT 'NOT_TAKEN',

    UNIQUE INDEX `Applications_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Subject` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NULL,
    `description` VARCHAR(10000) NULL,
    `status` ENUM('OPEN', 'CLOSED', 'DRAFT') NOT NULL DEFAULT 'OPEN',
    `views` INTEGER NULL,
    `exam_taken` BOOLEAN NULL DEFAULT false,

    UNIQUE INDEX `Subject_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Questionaire` (
    `id` VARCHAR(191) NOT NULL,
    `postingId` VARCHAR(191) NOT NULL,
    `question_type` VARCHAR(191) NOT NULL,
    `options` JSON NULL,
    `score` INTEGER NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `created_by_name` VARCHAR(191) NULL,
    `created_by_id` INTEGER NULL,
    `boolean_answer` BOOLEAN NULL,
    `multichoice_answer` VARCHAR(191) NULL,
    `applicant_id` VARCHAR(191) NULL,
    `question` VARCHAR(10000) NOT NULL,
    `student_boolean_answer` BOOLEAN NULL,
    `student_multichoice_answer` VARCHAR(191) NULL,
    `student_unstructured_answer` VARCHAR(191) NULL,
    `correct` BOOLEAN NULL DEFAULT false,

    INDEX `Questionaire_postingId_fkey`(`postingId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `QuestionaireAnswers` (
    `id` VARCHAR(191) NOT NULL,
    `postingId` VARCHAR(191) NOT NULL,
    `question` VARCHAR(10000) NOT NULL,
    `question_type` VARCHAR(191) NOT NULL,
    `multichoice_answer` VARCHAR(191) NULL,
    `boolean_answer` BOOLEAN NULL,
    `options` JSON NULL,
    `score` INTEGER NULL,
    `student_boolean_answer` BOOLEAN NULL,
    `student_multichoice_answer` VARCHAR(191) NULL,
    `student_unstructured_answer` VARCHAR(191) NULL,
    `correct` BOOLEAN NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `created_by_name` VARCHAR(191) NULL,
    `created_by_id` INTEGER NULL,
    `applicant_id` VARCHAR(191) NULL,
    `id_primary` VARCHAR(191) NOT NULL,

    INDEX `QuestionaireAnswers_postingId_fkey`(`postingId`),
    PRIMARY KEY (`id_primary`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Attachments` (
    `id` VARCHAR(191) NOT NULL,
    `attachment_name` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Applications` ADD CONSTRAINT `Applications_postingId_fkey` FOREIGN KEY (`postingId`) REFERENCES `Subject`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Applications` ADD CONSTRAINT `Applications_applicantId_fkey` FOREIGN KEY (`applicantId`) REFERENCES `Student`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Questionaire` ADD CONSTRAINT `Questionaire_postingId_fkey` FOREIGN KEY (`postingId`) REFERENCES `Subject`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QuestionaireAnswers` ADD CONSTRAINT `QuestionaireAnswers_postingId_fkey` FOREIGN KEY (`postingId`) REFERENCES `Subject`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
