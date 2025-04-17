import { IsNotEmpty, Length  } from "@nestjs/class-validator";
export class CreateLivroDto {
    @IsNotEmpty()
    @Length(1,255)
    nome: string;

    @IsNotEmpty()
    @Length(1,255)
    codigo: string;

    @IsNotEmpty()
    @Length(1,255)
    id_autor: string;

}
