import { Injectable } from '@nestjs/common';
import { AuthServiceModel } from './auth.interface';

@Injectable()
export class AuthService {
  getAuthContent(): AuthServiceModel {
    return {
      content: 'Hello',
    };
  }
}
