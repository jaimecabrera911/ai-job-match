import { JwtService } from '@nestjs/jwt';
import { PayloadDto } from '../auth/dto/payload.dto';

export function decodeToken(token: string): PayloadDto {
  token = token.replace('Bearer ', '');
  const jwtService = new JwtService();
  return jwtService.decode(token);
}

export function getTokenDecoded(req: Request): PayloadDto {
  return decodeToken(req.headers['authorization']);
}
