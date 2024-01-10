import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { AiModule } from './ai/ai.module';
import { HrmModule } from './hrm/hrm.module';

@Module({
  imports: [AuthModule, UsersModule, AiModule, HrmModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
