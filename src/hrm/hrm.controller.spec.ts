import { Test, TestingModule } from '@nestjs/testing';
import { HrmController } from './hrm.controller';
import { HrmService } from './service/hrm.service';

describe('HrmController', () => {
  let controller: HrmController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [HrmController],
      providers: [HrmService],
    }).compile();

    controller = module.get<HrmController>(HrmController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
