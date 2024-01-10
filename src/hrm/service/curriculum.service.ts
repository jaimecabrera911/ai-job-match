import { Injectable } from '@nestjs/common';
import { LanguagesOnCurriculums, PrismaClient } from '@prisma/client';
import { CreateCurriculumDto } from '../dto/create-curriculum.dto';

@Injectable()
export class CurriculumService {
  constructor(private readonly primaClient: PrismaClient) {}

  async createCurriculum(
    createCurriculumDto: CreateCurriculumDto,
    username: string,
  ) {
    const user = await this.primaClient.user.findFirstOrThrow({
      where: { username: username },
    });

    const skills = await Promise.all(
      createCurriculumDto.skills.map((skill) =>
        this.primaClient.skill.findFirstOrThrow({ where: { name: skill } }),
      ),
    );

    const languages: LanguagesOnCurriculums[] = await Promise.all(
      createCurriculumDto.languages.map(async (lang) => {
        const prismaLanguages = await this.primaClient.language.findFirst({
          where: { name: lang.language },
        });

        return {
          languageId: prismaLanguages.id,
          level: lang.level,
          curriculumId: null,
        };
      }),
    );

    await this.primaClient.curriculum.create({
      data: {
        ...createCurriculumDto,
        userId: user.id,
        skills: {
          create: skills.map((skill) => ({ skillId: skill.id })),
        },
        work: { create: createCurriculumDto.work },
        education: { create: createCurriculumDto.education },
        projects: { create: createCurriculumDto.projects },
        languages: {
          create: languages.map((langCurr) => ({
            languageId: langCurr.languageId,
            level: langCurr.level,
          })),
        },
      },
    });
  }
}
