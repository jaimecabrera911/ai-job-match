import { Test, TestingModule } from '@nestjs/testing';
import { HrmService } from './service/hrm.service';

describe('HrmService', () => {
  let service: HrmService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [HrmService],
    }).compile();

    service = module.get<HrmService>(HrmService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
