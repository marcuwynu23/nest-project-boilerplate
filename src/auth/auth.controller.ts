import { Controller, Get } from '@nestjs/common';
import { type AuthResponse } from './auth.interface';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}
  @Get()
  getAuthContent(): AuthResponse {
    return this.authService.getAuthContent();
  }
}
