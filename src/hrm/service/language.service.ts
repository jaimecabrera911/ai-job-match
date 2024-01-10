import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { LanguageDto } from '../dto/language.dto';

@Injectable()
export class LanguageService {
  constructor(private readonly primaClient: PrismaClient) {}

  async createLanguages(languages: string[]) {
    languages.forEach((lang) => {
      Promise.all([this.primaClient.language.create({ data: { name: lang } })]);
    });
  }

  async findAll() {
    return this.primaClient.language.findMany();
  }

  async findByLanguage(name: string) {
    return this.primaClient.skill.findFirstOrThrow({ where: { name: name } });
  }
}
