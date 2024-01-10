import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class SkillService {
  constructor(private readonly primaClient: PrismaClient) {}

  async createSkills(skills: string[]) {
    skills.forEach((skill) => {
      Promise.all([this.primaClient.skill.create({ data: { name: skill } })]);
    });
  }

  async findAll() {
    return this.primaClient.skill.findMany();
  }

  async findSkillByName(name: string) {
    return this.primaClient.skill.findFirstOrThrow({ where: { name: name } });
  }
}
