import { Injectable } from '@nestjs/common';
import { CreateLivroDto } from './dto/create-livro.dto';
import { UpdateLivroDto } from './dto/update-livro.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class LivroService {

  constructor (private readonly prisma: PrismaService){}
  create(createLivroDto: CreateLivroDto) {
    return 'This action adds a new livro';
  }

  findAll() {
    return `This action returns all livro`;
  }

  findOne(id: number) {
    return `This action returns a #${id} livro`;
  }

  update(id: number, updateLivroDto: UpdateLivroDto) {
    return `This action updates a #${id} livro`;
  }

  remove(id: number) {
    return `This action removes a #${id} livro`;
  }
}
