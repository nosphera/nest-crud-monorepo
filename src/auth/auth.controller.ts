import { Controller, Request, Post, UseGuards, Body } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { LoginBodyDto } from 'lib/src/domain/dto/login-body.dto';
import { AuthService } from './auth.service';
import { LocalAuthGuard } from './local.auth-guard';
@ApiTags('auth')
@Controller()
export class AuthController {
  constructor(private authService: AuthService) {}

  @UseGuards(LocalAuthGuard)
  @Post('auth/login')
  async login(@Body() user: LoginBodyDto) {
    return this.authService.login(user);
  }
}
