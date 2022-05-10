import { Module } from '@nestjs/common';
import { DatabaseModule } from './database/database.module';
import { AuthModule } from './auth/auth.module';
import { GamesModule } from './games/games.module';
import { UsersModule } from './users/users.module';

@Module({
  imports: [AuthModule, DatabaseModule, GamesModule, UsersModule],
})
export class AppModule {}
