-- AlterTable
ALTER TABLE `usuario` ADD COLUMN `apelido` VARCHAR(255) NULL,
    ADD COLUMN `cpf` VARCHAR(255) NULL;

-- CreateTable
CREATE TABLE `professor` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `usuario_id` INTEGER NOT NULL,
    `datacriacao` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `dataatualizacao` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_professor_usuario`(`usuario_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `aluno` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `usuario_id` INTEGER NOT NULL,
    `datacriacao` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `dataatualizacao` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_aluno_usuario`(`usuario_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `turma_aluno` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `aluno_id` INTEGER NOT NULL,
    `turma_id` INTEGER NOT NULL,
    `datacriacao` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `dataatualizacao` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_turma_aluno_aluno`(`aluno_id`),
    INDEX `fk_turma_aluno_turma`(`turma_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `turma` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `materia` VARCHAR(255) NOT NULL,
    `dia_semana` VARCHAR(255) NOT NULL,
    `curso_id` INTEGER NOT NULL,
    `professor_id` INTEGER NOT NULL,
    `datacriacao` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `dataatualizacao` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_turma_curso`(`curso_id`),
    INDEX `fk_turma_professor`(`professor_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE INDEX `fk_curso_universidade` ON `curso`(`universidade_id`);

-- AddForeignKey
ALTER TABLE `curso` ADD CONSTRAINT `fk_curso_universidade` FOREIGN KEY (`universidade_id`) REFERENCES `universidade`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `professor` ADD CONSTRAINT `fk_professor_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `aluno` ADD CONSTRAINT `fk_aluno_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `turma_aluno` ADD CONSTRAINT `fk_turma_aluno_aluno` FOREIGN KEY (`aluno_id`) REFERENCES `aluno`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `turma_aluno` ADD CONSTRAINT `fk_turma_aluno_turma` FOREIGN KEY (`turma_id`) REFERENCES `turma`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `turma` ADD CONSTRAINT `fk_turma_curso` FOREIGN KEY (`curso_id`) REFERENCES `curso`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `turma` ADD CONSTRAINT `fk_turma_professor` FOREIGN KEY (`professor_id`) REFERENCES `professor`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
