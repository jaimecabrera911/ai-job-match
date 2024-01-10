import { CreatePersonalInformationDto } from './create-personal-information.dto';
import { Role } from './role.enum';

export interface CreateUserDto {
  username: string;
  email: string;
  password: string;
  role: Role;
  personalInformation: CreatePersonalInformationDto;
}
