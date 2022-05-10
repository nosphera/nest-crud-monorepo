import { join } from 'path';
import { createConnection } from 'typeorm';

export const databaseProviders = [
  {
    provide: 'DATABASE_CONNECTION',
    useFactory: async () =>
      await createConnection({
        type: 'postgres',
        host: 'localhost',
        port: 5432,
        username: 'iniciador_admin',
        password: 'Di@blo2000',
        database: 'games-crud',
        entities: [join(__dirname, '/../**/*.entity.{ts,js}')],
        synchronize: false,
      }),
  },
];
