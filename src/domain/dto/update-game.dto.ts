import { ApiPropertyOptional } from '@nestjs/swagger';

export class UpdateGameDto {
  @ApiPropertyOptional()
  name?: string;
  @ApiPropertyOptional()
  category?: string;
  @ApiPropertyOptional()
  status?: boolean;
  createBy?: string;
}
