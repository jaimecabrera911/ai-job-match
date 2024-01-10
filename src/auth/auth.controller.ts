import {
  Body,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthGuard } from './auth.guard';
import { UsersService } from '../users/users.service';
import { CreateUserDto } from '../users/dto/create-user.dto';

@Controller('auth')
export class AuthController {
  constructor(
    private authService: AuthService,
    private userService: UsersService,
  ) {}

  @HttpCode(HttpStatus.OK)
  @Post('login')
  async signIn(@Body() signInDto: Record<string, any>) {
    const auth = await this.authService.signIn(
      signInDto.username,
      signInDto.password,
    );
    return {
      accessToken: auth,
    };
  }

  @HttpCode(HttpStatus.CREATED)
  @Post('signup')
  async signup(@Body() createUserDto: CreateUserDto) {
    await this.userService.signup(createUserDto);
  }

  @UseGuards(AuthGuard)
  @Get('profile')
  getProfile(@Req() req: any) {
    return req.user;
  }
}
