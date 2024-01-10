import { Role } from '../../users/dto/role.enum';

export interface PayloadDto {
  username: string;
  email: string;
  role: Role;
  iat?: number;
  exp?: number;
}
