import { Module } from '@nestjs/common';
import { HrmService } from './service/hrm.service';
import { HrmController } from './hrm.controller';
import { PrismaClient } from '@prisma/client';
import { OfferService } from './service/offer.service';
import { CurriculumService } from './service/curriculum.service';
import { SkillService } from './service/skill.service';
import { LanguageService } from './service/language.service';

@Module({
  controllers: [HrmController],
  providers: [
    HrmService,
    OfferService,
    PrismaClient,
    CurriculumService,
    SkillService,
    LanguageService,
  ],
})
export class HrmModule {}
