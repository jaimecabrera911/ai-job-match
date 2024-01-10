import { CreateWorkDto } from './create-work.dto';
import { CreateEducationDto } from './create-education.dto';
import { CreateProjectDto } from './create-project.dto';
import { CreateLanguageDto } from './create-language.dto';

export interface CreateCurriculumDto {
  profile: string;
  work?: CreateWorkDto[];
  education?: CreateEducationDto[];
  projects?: CreateProjectDto[];
  skills?: string[];
  languages?: CreateLanguageDto[];
  userId: number;
}
