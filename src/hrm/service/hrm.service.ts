import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class HrmService {
  constructor(private readonly primaClient: PrismaClient) {}

  async getUsers() {
    return this.primaClient.user.findMany({
      select: {
        username: true,
        email: true,
        personalInformation: {
          select: { fullName: true, address: true, city: true },
        },
      },
    });
  }
}
