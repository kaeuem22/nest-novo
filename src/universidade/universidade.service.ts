import { Injectable } from '@nestjs/common';
import { CreateUniversidadeDto } from './dto/create-universidade.dto';
import { UpdateUniversidadeDto } from './dto/update-universidade.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class UniversidadeService {
  constructor(private readonly prisma: PrismaService){}

  async create(createUniversidadeDto: CreateUniversidadeDto) {
    return await this.prisma.universidade.create({
      data: createUniversidadeDto, 
    });
  }

  async findAll() {
    return this.prisma.universidade.findMany();
  }

  async findOne(id: number) {
    return this.prisma.universidade.findUnique({
      where: { id },
  });
}

  async update(id: number, updateUniversidadeDto: UpdateUniversidadeDto) {
    return this.prisma.universidade.update({
      where: { id }, 
      data: updateUniversidadeDto, 
    });
  }

  async remove(id: number) {
    return this.prisma.universidade.delete({
      where: { id }, 
    });
  }
}

