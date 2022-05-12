import { Connection } from 'typeorm';
import { Game } from '../../lib/src/domain/entities/game.entity';

export const GameRepositoryToken = 'GAMES_REPOSITORY';

export const gameProviders = [
  {
    provide: GameRepositoryToken,
    useFactory: (connection: Connection) => connection.getRepository(Game),
    inject: ['DATABASE_CONNECTION'],
  },
];
