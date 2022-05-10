import { User } from 'src/domain/entities/user.entity';
import { Connection } from 'typeorm';

export const UsersRepositoryToken = 'USERS_REPOSITORY';

export const usersProviders = [
  {
    provide: UsersRepositoryToken,
    useFactory: (connection: Connection) => connection.getRepository(User),
    inject: ['DATABASE_CONNECTION'],
  },
];
