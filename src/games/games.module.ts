import { Module } from '@nestjs/common';
import { GamesService } from './games.service';
import { GamesController } from './games.controller';
import { gameProviders } from './game.provider';
import { DatabaseModule } from 'src/database/database.module';

@Module({
  imports: [DatabaseModule],
  controllers: [GamesController],
  providers: [...gameProviders, GamesService],
})
export class GamesModule {}
