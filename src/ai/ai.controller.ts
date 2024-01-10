import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
} from '@nestjs/common';
import { AiService } from './ai.service';
import { UpdateAiDto } from './dto/update-ai.dto';
import { CreateAiDto } from './dto/create-ai.dto';

@Controller('ai')
export class AiController {
  constructor(private readonly aiService: AiService) {}

  @Post()
  getIAGeneratedResponse(@Body() createAiDto: CreateAiDto) {
    return this.aiService.getIAGeneratedResponse(createAiDto.prompt);
  }
}
