import { Module } from '@nestjs/common';
import { DatabaseModule } from 'src/database/database.module';
import { usersProviders } from './users.provider';
import { UsersService } from './users.service';

@Module({
  imports: [DatabaseModule],
  providers: [...usersProviders, UsersService],
  exports: [UsersService],
})
export class UsersModule {}
