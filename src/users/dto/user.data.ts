import { Role } from './role.enum';

interface UserData {
  id: number;
  username: string;
  email: string;
  role: Role;
  iat: number;
  exp: number;
}
