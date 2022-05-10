import {
  ConflictException,
  Inject,
  Injectable,
  InternalServerErrorException,
  NotFoundException,
} from '@nestjs/common';
import { Repository } from 'typeorm';
import { CreateGameDto } from '../domain/dto/create-game.dto';
import { UpdateGameDto } from '../domain/dto/update-game.dto';
import { Game } from '../domain/entities/game.entity';
import { GameRepositoryToken } from './game.provider';

@Injectable()
export class GamesService {
  constructor(
    @Inject(GameRepositoryToken)
    private repository: Repository<Game>,
  ) {}

  async create(createGameDto: CreateGameDto) {
    try {
      let game = this.repository.create(createGameDto);
      game = await this.repository.save(game);
      return game;
    } catch (error) {
      if (error.code.toString() === '23505') {
        throw new ConflictException('Game already exists');
      } else {
        throw new InternalServerErrorException(
          'Unknown error, please try again later',
        );
      }
    }
  }

  findAll() {
    return this.repository.find({ where: { status: true } });
  }

  async findOne(id: string) {
    const game = await this.repository.findOneBy({
      id: id.toString(),
    });

    if (!game) {
      throw new NotFoundException('Game not found');
    }

    return game;
  }

  async update(id: string, updateGameDto: UpdateGameDto) {
    const game = await this.repository.preload({
      id: id.toString(),
      ...updateGameDto,
    });

    if (!game) {
      throw new NotFoundException('Game not found');
    }

    this.repository.save(game);
    return game;
  }

  remove(id: string) {
    this.update(id, { status: false });
  }
}
