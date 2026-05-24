import { Injectable } from '@nestjs/common';

@Injectable()
export class AuthService {
  getAuthContent(): { content: string } {
    return {
      content: 'Hello',
    };
  }
}
