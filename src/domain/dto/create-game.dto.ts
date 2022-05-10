import { ApiProperty } from '@nestjs/swagger';

export class CreateGameDto {
  name: string;
  category: string;
  status: boolean;
}
