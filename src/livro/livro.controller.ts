import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { LivroService } from './livro.service';
import { CreateLivroDto } from './dto/create-livro.dto';

@Controller('livro')
export class LivroController {
  constructor(private readonly livroService: LivroService) {}

  @Post()
  create(@Body() createLivroDto: CreateLivroDto) {
    return this.livroService.create(createLivroDto);
  }

  @Get()
  findAll() {
    return this.livroService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.livroService.findOne(+id);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.livroService.remove(+id);
  }
}
