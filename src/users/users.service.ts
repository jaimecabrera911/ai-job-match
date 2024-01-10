import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { CreateUserDto } from './dto/create-user.dto';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class UsersService {
  constructor(private readonly prismaClient: PrismaClient) {}

  async signup(createUserDto: CreateUserDto) {
    this.prismaClient.user
      .create({
        data: {
          ...createUserDto,
          role: createUserDto.role.toString(),
          personalInformation: {
            create: { ...createUserDto.personalInformation },
          },
        },
      })
      .then((result) => console.log(result))
      .catch((err) => console.log(err));
  }

  async findOne(username: string) {
    return this.prismaClient.user.findFirstOrThrow({
      where: { username: username },
    });
  }
}
