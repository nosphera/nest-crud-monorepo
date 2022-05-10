import { Inject, Injectable } from '@nestjs/common';
import { UpdateUserDto } from 'src/domain/dto/update-user.dto';
import { User } from 'src/domain/entities/user.entity';
import { Repository } from 'typeorm';
import { CreateUserDto } from '../domain/dto/create-user.dto';
import { UsersRepositoryToken } from './users.provider';

@Injectable()
export class UsersService {
  constructor(
    @Inject(UsersRepositoryToken)
    private repository: Repository<User>,
  ) {}

  create(createUserDto: CreateUserDto) {
    return 'This action adds a new user';
  }

  findAll() {
    return `This action returns all users`;
  }

  async findOne(username: string) {
    const user = await this.repository.findOne({ where: { name: username } });
    return user;
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    return `This action updates a #${id} user`;
  }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }
}
