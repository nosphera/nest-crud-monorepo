import { join } from 'path';
import { createConnection } from 'typeorm';

export const databaseProviders = [
  {
    provide: 'DATABASE_CONNECTION',
    useFactory: async () =>
      await createConnection({
        type: 'postgres',
        host: process.env.POSTGRES_HOST ?? 'postgres',
        port: 5432,
        username: 'iniciador_admin',
        password: 'Di@blo2000',
        database: 'iniciador_admin',
        entities: [join(__dirname, '/../**/*.entity.{ts,js}')],
        synchronize: false,
      }),
  },
];
