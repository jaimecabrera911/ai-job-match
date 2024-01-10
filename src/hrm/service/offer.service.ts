import { Injectable } from '@nestjs/common';
import { CreateOfferDto } from '../dto/create-offer.dto';
import { PrismaClient } from '@prisma/client';
import { Role } from '../../users/dto/role.enum';

@Injectable()
export class OfferService {
  constructor(private readonly prismaClient: PrismaClient) {}

  async createOffer(createOfferDto: CreateOfferDto, username: string) {
    const user = await this.prismaClient.user.findFirstOrThrow({
      where: { username: username },
    });

    if (user.role == Role.RECRUITER.toString()) {
      return this.prismaClient.offer.create({
        data: {
          ...createOfferDto,
          userId: user.id,
        },
      });
    } else {
      throw new Error("You don't have permission");
    }
  }

  async getOffers() {
    return this.prismaClient.offer.findMany();
  }
}
