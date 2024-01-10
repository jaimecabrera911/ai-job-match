import {
  Body,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import { HrmService } from './service/hrm.service';
import { OfferService } from './service/offer.service';
import { CreateOfferDto } from './dto/create-offer.dto';
import { AuthGuard } from '../auth/auth.guard';
import { getTokenDecoded } from '../utils/token.util';
import { SkillService } from './service/skill.service';
import { LanguageService } from './service/language.service';
import { CurriculumService } from './service/curriculum.service';
import { CreateCurriculumDto } from './dto/create-curriculum.dto';

@Controller('hrm')
export class HrmController {
  private;

  constructor(
    private readonly hrmService: HrmService,
    private readonly offerService: OfferService,
    private readonly skillService: SkillService,
    private readonly languageServices: LanguageService,
    private readonly curriculumService: CurriculumService,
  ) {}

  @Post('/offers')
  @UseGuards(AuthGuard)
  @HttpCode(201)
  async createOffer(
    @Body() createOfferDto: CreateOfferDto,
    @Req() req: Request,
  ) {
    const { username } = getTokenDecoded(req);
    const offer = await this.offerService.createOffer(createOfferDto, username);
    return {
      uuid: offer.uuid,
    };
  }

  @Get('/offers')
  async getOffers() {
    return this.offerService.getOffers();
  }

  @Post('/skills')
  @HttpCode(HttpStatus.CREATED)
  async createSkills(@Body() skills: string[]) {
    await this.skillService.createSkills(skills);
  }

  @Get('/skills')
  async getSkills() {
    return this.skillService.findAll();
  }

  @Post('/curriculums')
  @HttpCode(HttpStatus.CREATED)
  async createCurriculum(
    @Body() createCurriculumsDto: CreateCurriculumDto,
    @Req() req: Request,
  ) {
    let payload = getTokenDecoded(req);
    await this.curriculumService.createCurriculum(
      createCurriculumsDto,
      payload.username,
    );
  }

  @Post('/languages')
  @HttpCode(HttpStatus.CREATED)
  async createLanguages(@Body() languages: string[]) {
    await this.languageServices.createLanguages(languages);
  }

  @Get('/languages')
  async getLanguages() {
    return this.languageServices.findAll();
  }

  @Get()
  getUsers() {
    return this.hrmService.getUsers();
  }
}
